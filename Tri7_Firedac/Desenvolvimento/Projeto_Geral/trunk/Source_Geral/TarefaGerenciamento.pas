unit TarefaGerenciamento;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.DateUtils,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Controles,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  Vcl.Menus,
  cxControls,
  cxStyles,
  cxSchedulerStorage,
  cxSchedulerCustomControls,
  cxSchedulerDateNavigator,
  cxContainer,
  cxEdit,
  cxScheduler,
  cxSchedulerCustomResourceView,
  cxSchedulerDayView,
  cxSchedulerHolidays,
  cxSchedulerTimeGridView,
  cxSchedulerUtils,
  cxSchedulerWeekView,
  cxSchedulerYearView,
  cxSchedulerGanttView,
  cxSchedulerRecurrence,
  cxSchedulerTreeListBrowser,
  cxSchedulerRibbonStyleEventEditor,
  cxLabel,
  cxEditRepositoryItems,
  cxTextEdit,
  cxMaskEdit,
  cxDropDownEdit,
  cxClasses,
  cxDateNavigator,
  Vcl.StdCtrls,
  cxButtons,
  Vcl.ExtCtrls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  I9Query,
  cxSchedulerDBStorage,
  Vcl.Grids,
  Vcl.DBGrids,
  Lookup,
  cxSchedulercxGridConnection,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxNavigator,
  cxDBData,
  cxGridLevel,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGrid, cxImageComboBox, cxDBEdit, cxProgressBar, cxSplitter, cxCalendar,
  Vcl.ComCtrls, dxCore, cxDateUtils, dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinscxPCPainter, dxSkinscxSchedulerPainter, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxBarBuiltInMenu, cxPC;

type
  TFrmTarefaGerenciamento = class(TForm)
    btnAtualizar: TcxButton;
    btnCriar: TcxButton;
    btnFechar: TcxButton;
    btnHoje: TcxButton;
    dtsPeriodo: TcxDateNavigator;
    DtsCalendario: TDataSource;
    DtsListagem: TDataSource;
    DtsResponsavel: TDataSource;
    dtsResponsavelListSource: TDataSource;
    grdLembrete: TcxGrid;
    grdLembreteDBTableView: TcxGridDBTableView;
    grdLembreteDBTableViewASSUNTO: TcxGridDBColumn;
    grdLembreteDBTableViewDATA_FINAL: TcxGridDBColumn;
    grdLembreteDBTableViewDATA_INICIAL: TcxGridDBColumn;
    grdLembreteDBTableViewMENSAGEM: TcxGridDBColumn;
    grdLembreteDBTableViewSITUACAO: TcxGridDBColumn;
    grdLembreteLevel: TcxGridLevel;
    icxTipoPeriodo: TcxImageComboBox;
    LblObservacao: TcxLabel;
    lblPeriodo: TcxLabel;
    LblProgresso: TLabel;
    lcbResponsavel: TcxDBLookupComboBox;
    mniAlterarTarefa: TMenuItem;
    mniAlterarTarefaItem: TMenuItem;
    mniExcluirTarefa: TMenuItem;
    mniExcluirTarefaItem: TMenuItem;
    mniIncluirTarefa: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    PgbProgresso: TcxProgressBar;
    pgcTarefas: TcxPageControl;
    PnlLembretes: TPanel;
    PnlLista: TPanel;
    PnlProgresso: TPanel;
    ppmCalendario: TPopupMenu;
    QryTarefas: TI9Query;
    QryTarefasASSUNTO: TStringField;
    QryTarefasDATA_CADASTRO: TSQLTimeStampField;
    QryTarefasDATA_FINAL: TSQLTimeStampField;
    QryTarefasDATA_INICIAL: TSQLTimeStampField;
    QryTarefasHORA_FINAL: TSQLTimeStampField;
    QryTarefasHORA_INICIAL: TSQLTimeStampField;
    QryTarefasITEM_DATA_FINAL: TSQLTimeStampField;
    QryTarefasITEM_DATA_INICIAL: TSQLTimeStampField;
    QryTarefasITEM_HORA_FINAL: TSQLTimeStampField;
    QryTarefasITEM_HORA_INICIAL: TSQLTimeStampField;
    QryTarefasITEM_PERCENTUAL: TBCDField;
    QryTarefasITEM_SITUACAO: TStringField;
    QryTarefasITEM_TAREFA_ID: TBCDField;
    QryTarefasITEM_TAREFA_ITEM_ID: TBCDField;
    QryTarefasMENSAGEM: TBlobField;
    QryTarefasPERCENTUAL: TBCDField;
    QryTarefasPERIODO_TIPO: TStringField;
    QryTarefasREPETIR_DOMINGO: TStringField;
    QryTarefasREPETIR_QUARTA: TStringField;
    QryTarefasREPETIR_QUINTA: TStringField;
    QryTarefasREPETIR_SABADO: TStringField;
    QryTarefasREPETIR_SEGUNDA: TStringField;
    QryTarefasREPETIR_SEXTA: TStringField;
    QryTarefasREPETIR_TERCA: TStringField;
    QryTarefasSERVENTIA: TBCDField;
    QryTarefasSITUACAO: TStringField;
    QryTarefasTAREFA_GRUPO_ID: TBCDField;
    QryTarefasTAREFA_ID: TBCDField;
    QryTarefasTERMINO_DATA: TSQLTimeStampField;
    QryTarefasTERMINO_OCORRENCIAS: TBCDField;
    QryTarefasTIPO_TERMINO: TStringField;
    QryTarefasUSUARIO_ID: TBCDField;
    scbCalendario: TcxSchedulerDBStorage;
    scdCalendario: TcxScheduler;
    scdFeriados: TcxSchedulerHolidays;
    sqlResponsavel: TI9Query;
    sqlResponsavelFUNCAO: TStringField;
    sqlResponsavelListSource: TI9Query;
    sqlResponsavelListSourceFUNCAO: TStringField;
    sqlResponsavelListSourceNOME_COMPLETO: TStringField;
    sqlResponsavelListSourceUSUARIO_ID: TBCDField;
    sqlResponsavelNOME_COMPLETO: TStringField;
    sqlResponsavelUSUARIO_ID: TBCDField;
    TblCalendario: TFDMemTable;
    TblCalendarioActualFinish: TIntegerField;
    TblCalendarioActualStart: TIntegerField;
    TblCalendariocaption: TStringField;
    TblCalendarioEventType: TIntegerField;
    TblCalendarioFinish: TDateTimeField;
    TblCalendarioGroupId: TIntegerField;
    TblCalendarioID: TIntegerField;
    TblCalendarioLabelColor: TIntegerField;
    TblCalendarioLocation: TStringField;
    TblCalendarioMessage: TStringField;
    TblCalendarioOptions: TIntegerField;
    TblCalendarioParentID: TIntegerField;
    TblCalendarioRecurrenceIndex: TIntegerField;
    TblCalendarioRecurrenceInfo: TBlobField;
    TblCalendarioReminderDate: TDateTimeField;
    TblCalendarioReminderMinutesBeforeStart: TIntegerField;
    TblCalendarioReminderResourcesData: TBlobField;
    TblCalendarioResourceID: TIntegerField;
    TblCalendarioStart: TDateTimeField;
    TblCalendarioState: TIntegerField;
    TblCalendarioTaskCompleteField: TIntegerField;
    TblCalendarioTaskIndexField: TIntegerField;
    TblCalendarioTaskLinkField: TBlobField;
    TblCalendarioTaskStatusField: TIntegerField;
    TblListagem: TFDMemTable;
    TblListagemASSUNTO: TStringField;
    TblListagemDATA_FINAL: TDateTimeField;
    TblListagemDATA_INICIAL: TDateTimeField;
    TblListagemMENSAGEM: TStringField;
    TblListagemPERCENTUAL: TCurrencyField;
    TblListagemSITUACAO: TStringField;
    TblListagemTAREFA_ID: TIntegerField;
    TblListagemTAREFA_ITEM_ID: TIntegerField;
    tbsCalendario: TcxTabSheet;
    tbsListagem: TcxTabSheet;
    ppmListagem: TPopupMenu;
    MniIncluirTarefaListagem: TMenuItem;
    MniAlterarTarefaListagem: TMenuItem;
    MniExcluirTarefaListagem: TMenuItem;
    MenuItem4: TMenuItem;
    MniAlterarSubTarefaListagem: TMenuItem;
    MniExcluirSubTarefaListagem: TMenuItem;
    MenuItem7: TMenuItem;
    TblListagemUSUARIO_ID: TIntegerField;
    TblListagemUSUARIO_NOME: TStringField;
    grdLembreteDBTableViewUSUARIO_NOME: TcxGridDBColumn;
    QryTarefasUSUARIO_NOME: TStringField;

    procedure btnAtualizarClick(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnHojeClick(Sender: TObject);
    procedure dtsPeriodoSelectionChanged(Sender: TObject; const AStart, AFinish: TDateTime);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure icxTipoPeriodoPropertiesChange(Sender: TObject);
    procedure lcbResponsavelPropertiesChange(Sender: TObject);
    procedure mniAlterarTarefaClick(Sender: TObject);
    procedure mniAlterarTarefaItemClick(Sender: TObject);
    procedure mniExcluirTarefaClick(Sender: TObject);
    procedure mniExcluirTarefaItemClick(Sender: TObject);
    procedure mniIncluirTarefaClick(Sender: TObject);
    procedure scdCalendarioViewTypeChanged(Sender: TObject; APrevView, ANewView: TcxSchedulerCustomView);

    procedure scdCalendarioBeforeEditing(
      Sender: TcxCustomScheduler;
      AEvent: TcxSchedulerControlEvent;
      AInplace: Boolean;
      var Allow: Boolean);
    procedure MniIncluirTarefaListagemClick(Sender: TObject);
    procedure MniAlterarTarefaListagemClick(Sender: TObject);
    procedure MniExcluirTarefaListagemClick(Sender: TObject);
    procedure MniAlterarSubTarefaListagemClick(Sender: TObject);
    procedure MniExcluirSubTarefaListagemClick(Sender: TObject);

  private

    vlTarefaId: Integer;
    vlTarefaItemId: Integer;
    vlDataInicial: TDatetime;
    vlDataFinal: TDatetime;
    vlHoraInicial: TTime;
    vlDataAtual: TDateTime;

    procedure PreencherTela(
      const vpUsuarioId: Integer;
      const vpDataInicial: TDateTime;
      const vpDataFinal: TDateTime);

    procedure PreencherCalendario(
      const vpUsuarioId: Integer);

    procedure PreencherListagem(
      const vpUsuarioId: Integer;
      const vpDataInicial: TDateTime;
      const vpDataFinal: TDateTime);

    procedure PesquisarTarefas(
      const vpUsuarioId: Integer);

    procedure ControlarTipoPeriodo;

    procedure ControlarTipoPeriodoNormal(
      const vpDataAtual: TDateTime);

    procedure ControlarTipoPeriodoDia(
      const vpDataAtual: TDateTime);

    procedure ControlarTipoPeriodoSemana(
      const vpDataAtual: TDateTime);

    procedure ControlarTipoPeriodoDecendio(
      const vpDataAtual: TDateTime);

    procedure ControlarTipoPeriodoQuinzena(
      const vpDataAtual: TDateTime); // Erro pq só seleciona até 14 dias

    procedure ControlarTipoPeriodoMes(
      const vpDataAtual: TDateTime);

    procedure ControlarTipoPeriodoSemestre(
      const vpDataAtual: TDateTime);

    procedure ControlarTipoPeriodoTrimestre(
      const vpDataAtual: TDateTime);

    procedure ControlarTipoPeriodoAno(
      const vpDataAtual: TDateTime);

    procedure MostrarProgresso(
      const vpTexto: string;
      const vpPosicao: Integer;
      const vpMaximo: Integer);

    procedure OcultarProgresso;

    procedure IncluirTarefa(
      const vpTipoPeriodo: string;
      const vpDataInicial: TDatetime;
      const vpHoraInicial: TDatetime);

    procedure AlterarTarefa(
      vpTarefaId: Integer);

    procedure ExcluirTarefa(
      vpTarefaId: Integer);

    procedure AlterarTarefaItem(
      vpTarefaItemId: Integer);

    procedure ExcluirTarefaItem(
      vpTarefaItemId: Integer);

  public
  end;

var
  FrmTarefaGerenciamento: TFrmTarefaGerenciamento;

implementation

uses
  Rotinas,
  MensagemUtils,
  TarefaProcessos,
  CadastroRapidoTarefa,
  CadastroSubTarefa;

{$R *.dfm}

procedure TFrmTarefaGerenciamento.AlterarTarefa(
  vpTarefaId: Integer);
begin
  if vpTarefaId <= 0 then
    Exit;

  TfrmCadastroRapidoTarefa.AbrirCadastroRapido(vpTarefaId);

  PreencherTela(
    sqlResponsavelUSUARIO_ID.AsInteger,
    vlDataInicial,
    vlDataFinal);
end;

procedure TFrmTarefaGerenciamento.AlterarTarefaItem(vpTarefaItemId: Integer);
var
  viFrmCadastroSubTarefa: TfrmCadastroSubTarefa;
begin
  if vpTarefaItemId <= 0 then
    Exit;

  viFrmCadastroSubTarefa := TfrmCadastroSubTarefa.Create(nil);
  try
    viFrmCadastroSubTarefa.vlTarefaItemId := vpTarefaItemId;
    viFrmCadastroSubTarefa.ShowModal;
  finally
    FreeAndNil(viFrmCadastroSubTarefa);
  end;

  PreencherTela(
    sqlResponsavelUSUARIO_ID.AsInteger,
    vlDataInicial,
    vlDataFinal);
end;

procedure TFrmTarefaGerenciamento.PreencherTela(
  const vpUsuarioId: Integer;
  const vpDataInicial: TDateTime;
  const vpDataFinal: TDateTime);
begin
  ControlarTipoPeriodo;

  PesquisarTarefas(vpUsuarioId);

  PreencherListagem(
    vpUsuarioId,
    vpDataInicial,
    vpDataFinal);

  PreencherCalendario(vpUsuarioId);

  vlDataInicial := vpDataInicial;
  vlDataFinal := vpDataFinal;
end;

procedure TFrmTarefaGerenciamento.btnAtualizarClick(Sender: TObject);
begin
  PreencherTela(
    sqlResponsavelUSUARIO_ID.AsInteger,
    vlDataInicial,
    vlDataFinal);
end;

procedure TFrmTarefaGerenciamento.btnCriarClick(Sender: TObject);
begin
  IncluirTarefa(
    'D',
    vlDataInicial,
    vlHoraInicial);
end;

procedure TFrmTarefaGerenciamento.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TFrmTarefaGerenciamento.btnHojeClick(Sender: TObject);
begin
  vlDataAtual := StartOfTheDay(dtmControles.DataHoraBanco(3));
  ScdCalendario.GoToDate(vlDataAtual);
end;

procedure TFrmTarefaGerenciamento.ControlarTipoPeriodo;
var
  viDataAtual: TDateTime;
begin
  if vlDataAtual <= 0 then
    vlDataAtual := StartOfTheDay(dtmControles.DataHoraBanco(3));

  viDataAtual := vlDataAtual;

  if icxTipoPeriodo.EditingValue = 'N' then // Normal
    ControlarTipoPeriodoNormal(viDataAtual)
  else if icxTipoPeriodo.EditingValue = 'D' then // Dia
    ControlarTipoPeriodoDia(viDataAtual)
  else if icxTipoPeriodo.EditingValue = 'S' then // Semana
    ControlarTipoPeriodoSemana(viDataAtual)
  else if icxTipoPeriodo.EditingValue = 'C' then // Decêndio
    ControlarTipoPeriodoDecendio(viDataAtual)
  else if icxTipoPeriodo.EditingValue = 'Q' then // Quinzena
    ControlarTipoPeriodoQuinzena(viDataAtual)
  else if icxTipoPeriodo.EditingValue = 'M' then // Mês
    ControlarTipoPeriodoMes(viDataAtual)
  else if icxTipoPeriodo.EditingValue = 'T' then // Trimestre
    ControlarTipoPeriodoTrimestre(viDataAtual)
  else if icxTipoPeriodo.EditingValue = 'R' then // Semestre
    ControlarTipoPeriodoSemestre(viDataAtual)
  else if icxTipoPeriodo.EditingValue = 'A' then // Ano
    ControlarTipoPeriodoAno(viDataAtual);
end;

procedure TFrmTarefaGerenciamento.ControlarTipoPeriodoAno(const vpDataAtual: TDateTime);
var
  viDataAtual: TDateTime;
begin
  viDataAtual := vpDataAtual;

  ScdCalendario.ViewYear.Active := True;
  ScdCalendario.ViewYear.Scale := 12;
  ScdCalendario.GoToDate(viDataAtual);
end;

procedure TFrmTarefaGerenciamento.ControlarTipoPeriodoDecendio(const vpDataAtual: TDateTime);
var
  viDataAtual: TDateTime;
  viInicioDecendio: TDateTime;
  viFinalDecendio: TDateTime;
  viDiaAtual: Word;
  viMesAtual: Word;
  viAnoAtual: Word;
begin
  viInicioDecendio := 0;
  viFinalDecendio := 0;

  viDataAtual := vpDataAtual;

  viDiaAtual := DayOf(viDataAtual);
  viMesAtual := MonthOf(viDataAtual);
  viAnoAtual := YearOf(viDataAtual);

  if viDiaAtual in [1..10] then
  begin
    viInicioDecendio := StrToDate('01/' + IntToStr(viMesAtual) + '/' + IntToStr(viAnoAtual));
    viFinalDecendio := StrToDateTime('10/' + IntToStr(viMesAtual) + '/' + IntToStr(viAnoAtual) + ' 23:59:59');
  end
  else if viDiaAtual in [11..20] then
  begin
    viInicioDecendio := StrToDate('11/' + IntToStr(viMesAtual) + '/' + IntToStr(viAnoAtual));
    viFinalDecendio := StrToDateTime('20/' + IntToStr(viMesAtual) + '/' + IntToStr(viAnoAtual) + ' 23:59:59');
  end
  else if viDiaAtual >= 21 then
  begin
    viInicioDecendio := StrToDate('21/' + IntToStr(viMesAtual) + '/' + IntToStr(viAnoAtual));
    viFinalDecendio := EndOfTheMonth(StrToDateTime('01/' + IntToStr(viMesAtual) + '/' + IntToStr(viAnoAtual) + ' 23:59:59'));
  end;

  ScdCalendario.ViewDay.Active := True;
  ScdCalendario.SelectDays(viInicioDecendio, viFinalDecendio, True);
  ScdCalendario.GoToDate(viDataAtual);
end;

procedure TFrmTarefaGerenciamento.ControlarTipoPeriodoDia(const vpDataAtual: TDateTime);
var
  viDataAtual: TDateTime;
begin
  viDataAtual := vpDataAtual;

  ScdCalendario.ViewDay.Active := True;
  ScdCalendario.SelectDays(viDataAtual, viDataAtual, True);
  ScdCalendario.GoToDate(viDataAtual);
end;

procedure TFrmTarefaGerenciamento.ControlarTipoPeriodoMes(const vpDataAtual: TDateTime);
var
  viDataAtual: TDateTime;
  viInicioMes: TDateTime;
  viFinalMes: TDateTime;
begin
  viDataAtual := vpDataAtual;

  viInicioMes := StartOfTheMonth(viDataAtual);
  viFinalMes := EndOfTheMonth(viDataAtual);

  ScdCalendario.ViewWeeks.Active := True;
  ScdCalendario.SelectDays(viInicioMes, viFinalMes);
  ScdCalendario.GoToDate(viDataAtual);
end;

procedure TFrmTarefaGerenciamento.ControlarTipoPeriodoNormal(const vpDataAtual: TDateTime);
var
  viDataAtual: TDateTime;
begin
  viDataAtual := vpDataAtual;

  ScdCalendario.ViewTimeGrid.Active := True;
  ScdCalendario.SelectDays(viDataAtual, viDataAtual, True);
  ScdCalendario.GoToDate(viDataAtual);
end;

procedure TFrmTarefaGerenciamento.ControlarTipoPeriodoQuinzena(const vpDataAtual: TDateTime);
var
  viDataAtual: TDateTime;
  viInicioQuinzena: TDateTime;
  viFinalQuinzena: TDateTime;
  viDiaAtual: Word;
  viMesAtual: Word;
  viAnoAtual: Word;
begin
  viInicioQuinzena := 0;
  viFinalQuinzena := 0;

  viDataAtual := vpDataAtual;

  viDiaAtual := DayOf(viDataAtual);
  viMesAtual := MonthOf(viDataAtual);
  viAnoAtual := YearOf(viDataAtual);

  if viDiaAtual in [1..15] then
  begin
    viInicioQuinzena := StrToDate('01/' + IntToStr(viMesAtual) + '/' + IntToStr(viAnoAtual));
    viFinalQuinzena := incDay(viInicioQuinzena, 12);
    //viFinalQuinzena := StrToDateTime('15/' + IntToStr(viMesAtual) + '/' + IntToStr(viAnoAtual) + ' 23:59:59');
    //cxScheduler permite selecionar no máximo 14 dias
  end
  else if viDiaAtual >= 16 then
  begin
    viInicioQuinzena := StrToDate('16/' + IntToStr(viMesAtual) + '/' + IntToStr(viAnoAtual));
    viFinalQuinzena := incDay(viInicioQuinzena, 12);
    //viFinalQuinzena := EndOfTheMonth(StrToDateTime('01/' + IntToStr(viMesAtual) + '/' + IntToStr(viAnoAtual) + ' 23:59:59'));
    //cxScheduler permite selecionar no máximo 14 dias
  end;

  ScdCalendario.ViewDay.Active := True;
  ScdCalendario.SelectDays(viInicioQuinzena, viFinalQuinzena, True);
  ScdCalendario.GoToDate(viDataAtual);
end;

procedure TFrmTarefaGerenciamento.ControlarTipoPeriodoSemana(const vpDataAtual: TDateTime);
var
  viDataAtual: TDateTime;
  viInicioSemana: TDateTime;
  viFinalSemana: TDateTime;
begin
  viDataAtual := vpDataAtual;

  viInicioSemana := StartOfTheWeek(viDataAtual);
  viFinalSemana := EndOfTheWeek(viDataAtual);

  ScdCalendario.ViewDay.Active := True;
  ScdCalendario.SelectDays(viInicioSemana, viFinalSemana, True);
  ScdCalendario.GoToDate(viDataAtual);
end;

procedure TFrmTarefaGerenciamento.ControlarTipoPeriodoSemestre(const vpDataAtual: TDateTime);
var
  viDataAtual: TDateTime;
begin
  viDataAtual := vpDataAtual;

  ScdCalendario.ViewYear.Active := True;
  ScdCalendario.ViewYear.Scale := 6;
  ScdCalendario.GoToDate(viDataAtual);
end;

procedure TFrmTarefaGerenciamento.ControlarTipoPeriodoTrimestre(const vpDataAtual: TDateTime);
var
  viDataAtual: TDateTime;
begin
  viDataAtual := vpDataAtual;

  ScdCalendario.ViewYear.Active := True;
  ScdCalendario.ViewYear.Scale := 3;
  ScdCalendario.GoToDate(viDataAtual);
end;

procedure TFrmTarefaGerenciamento.dtsPeriodoSelectionChanged(Sender: TObject; const AStart, AFinish: TDateTime);
begin
  if (icxTipoPeriodo.EditValue = 'D')
  and (AStart = AFinish) then
  begin
    PreencherTela(
      sqlResponsavelUSUARIO_ID.AsInteger,
      AStart,
      AFinish);
  end
  else
  begin
    PreencherTela(
      sqlResponsavelUSUARIO_ID.AsInteger,
      dtsPeriodo.FirstDate,
      dtsPeriodo.LastDate);
  end;
end;

procedure TFrmTarefaGerenciamento.ExcluirTarefaItem(vpTarefaItemId: Integer);
var
  viExcluirSeguintes: Boolean;
  viDescMensagem: string;
begin
  if vpTarefaItemId <= 0 then
    Exit;

  viExcluirSeguintes := TMensagemUtils.ExibirMensagemPergunta('Deseja excluir as sub-tarefas seguintes?', False);

  if not TTarefaProcessos.ExcluirTarefaItem(
    vpTarefaItemId,
    viExcluirSeguintes,
    True,
    viDescMensagem
  ) then
  begin
    TMensagemUtils.ExibirMensagemAtencao(viDescMensagem);
    Exit;
  end;

  PreencherTela(
    sqlResponsavelUSUARIO_ID.AsInteger,
    vlDataInicial,
    vlDataFinal);
end;

procedure TFrmTarefaGerenciamento.ExcluirTarefa(vpTarefaId: Integer);
var
  viDescMensagem: string;
  viExcluir: Boolean;
begin
  if vpTarefaId <= 0 then
    Exit;

  viExcluir := TMensagemUtils.ExibirMensagemPergunta('Deseja realmente excluir a tarefa?', False);

  if not viExcluir then
    Exit;

  if not TTarefaProcessos.ExcluirTarefa(
    vpTarefaId,
    viDescMensagem
  ) then
  begin
    TMensagemUtils.ExibirMensagemAtencao(viDescMensagem);
    Exit;
  end;

  PreencherTela(
    sqlResponsavelUSUARIO_ID.AsInteger,
    vlDataInicial,
    vlDataFinal);
end;

procedure TFrmTarefaGerenciamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmTarefaGerenciamento := nil;
end;

procedure TFrmTarefaGerenciamento.FormCreate(Sender: TObject);
begin
  icxTipoPeriodo.ItemIndex := 2; // Semanal
end;

procedure TFrmTarefaGerenciamento.FormShow(Sender: TObject);
begin
  sqlResponsavel.Close;
  sqlResponsavel.Connection := dtmControles.DB;
  sqlResponsavel.Open;

  sqlResponsavelListSource.Connection := dtmControles.DB;
  sqlResponsavelListSource.Open;

  sqlResponsavel.Locate(
    'USUARIO_ID',
    StrToInt(vgUsuarioID),
    []);

  vlDataAtual := StartOfTheDay(dtmControles.DataHoraBanco(3));

  pgcTarefas.ActivePage := tbsListagem;

  PreencherTela(
    sqlResponsavelUSUARIO_ID.AsInteger,
    dtsPeriodo.FirstDate,
    dtsPeriodo.LastDate);
end;

procedure TFrmTarefaGerenciamento.icxTipoPeriodoPropertiesChange(Sender: TObject);
begin
  dtsPeriodoSelectionChanged(
    Sender,
    Now,
    Now);
end;

procedure TFrmTarefaGerenciamento.IncluirTarefa(
  const vpTipoPeriodo: string;
  const vpDataInicial: TDatetime;
  const vpHoraInicial: TDatetime);
begin
  TfrmCadastroRapidoTarefa.AbrirCadastroRapido(
    0,
    vpTipoPeriodo,
    vpDataInicial,
    vpHoraInicial);

  PreencherTela(
    sqlResponsavelUSUARIO_ID.AsInteger,
    vlDataInicial,
    vlDataFinal);
end;

procedure TFrmTarefaGerenciamento.lcbResponsavelPropertiesChange(Sender: TObject);
var
  viUsuarioId: Integer;
begin
  viUsuarioId := 0;

  if not VarIsNull(lcbResponsavel.EditValue) then
    viUsuarioId := lcbResponsavel.EditValue;

  PreencherListagem(
    viUsuarioId,
    dtsPeriodo.FirstDate,
    dtsPeriodo.LastDate);

  PreencherCalendario(
    viUsuarioId);
end;

procedure TFrmTarefaGerenciamento.MniAlterarSubTarefaListagemClick(Sender: TObject);
begin
  AlterarTarefaItem(TblListagemTAREFA_ITEM_ID.AsInteger);
end;

procedure TFrmTarefaGerenciamento.mniAlterarTarefaClick(Sender: TObject);
begin
  AlterarTarefa(vlTarefaId);
end;

procedure TFrmTarefaGerenciamento.mniAlterarTarefaItemClick(Sender: TObject);
begin
  AlterarTarefaItem(vlTarefaItemId);
end;

procedure TFrmTarefaGerenciamento.MniAlterarTarefaListagemClick(Sender: TObject);
begin
  AlterarTarefa(TblListagemTAREFA_ID.AsInteger);
end;

procedure TFrmTarefaGerenciamento.MniExcluirSubTarefaListagemClick(Sender: TObject);
begin
  ExcluirTarefaItem(TblListagemTAREFA_ITEM_ID.AsInteger);
end;

procedure TFrmTarefaGerenciamento.mniExcluirTarefaClick(Sender: TObject);
begin
  ExcluirTarefa(vlTarefaId);
end;

procedure TFrmTarefaGerenciamento.mniExcluirTarefaItemClick(Sender: TObject);
begin
  ExcluirTarefaItem(vlTarefaItemId);
end;

procedure TFrmTarefaGerenciamento.MniExcluirTarefaListagemClick(Sender: TObject);
begin
  ExcluirTarefa(TblListagemTAREFA_ID.AsInteger);
end;

procedure TFrmTarefaGerenciamento.mniIncluirTarefaClick(Sender: TObject);
begin
  IncluirTarefa(
    'D',
    vlDataInicial,
    vlHoraInicial);
end;

procedure TFrmTarefaGerenciamento.MniIncluirTarefaListagemClick(Sender: TObject);
begin
  IncluirTarefa(
    'D',
    vlDataInicial,
    vlHoraInicial);
end;

procedure TFrmTarefaGerenciamento.MostrarProgresso(
  const vpTexto: string;
  const vpPosicao: Integer;
  const vpMaximo: Integer);
begin
  PnlProgresso.Visible := True;
  PgbProgresso.Position := vpPosicao;

  if vpMaximo <> PgbProgresso.Properties.Max then
    PgbProgresso.Properties.Max := vpMaximo;

  LblProgresso.Caption := vpTexto;

  Application.ProcessMessages;
end;

procedure TFrmTarefaGerenciamento.OcultarProgresso;
begin
  PnlProgresso.Visible := False;
  PgbProgresso.Position := 0;
  PgbProgresso.Properties.Max := 0;

  LblProgresso.Caption := '';

  Application.ProcessMessages;
end;

procedure TFrmTarefaGerenciamento.PreencherListagem(
  const vpUsuarioId: Integer;
  const vpDataInicial: TDateTime;
  const vpDataFinal: TDateTime
);
const
  CI_METODO_TEXTO = 'Aguarde... Preenchendo listagem';
var
  viDataInicial: TDateTime;
  viDataFinal: TDateTime;
begin
  MostrarProgresso(CI_METODO_TEXTO, 0, QryTarefas.RecordCount);

  TblListagem.Open;
  TblListagem.EmptyDataSet;
  TblListagem.BeginBatch;
  try
    QryTarefas.First;
    while not QryTarefas.Eof do
    begin
      viDataInicial :=
        StrToDateTime(
          FormatDateTime('dd/MM/yyyy', QryTarefasITEM_DATA_INICIAL.AsDateTime) +
          ' ' +
          FormatDateTime('hh:mm:ss', QryTarefasITEM_HORA_INICIAL.AsDateTime));

      viDataFinal :=
        StrToDateTime(
          FormatDateTime('dd/MM/yyyy', QryTarefasITEM_DATA_FINAL.AsDateTime) +
            ' ' +
            FormatDateTime('hh:mm:ss', QryTarefasITEM_HORA_FINAL.AsDateTime));

      if not ((vpDataInicial > 0) and (viDataInicial >= StartOfTheDay(vpDataInicial))) then
      begin
        QryTarefas.Next;
        Continue;
      end;

      if not ((vpDataFinal > 0) and (viDataFinal <= EndOfTheDay(vpDataFinal))) then
      begin
        QryTarefas.Next;
        Continue;
      end;

      TblListagem.AppendRecord([
        { TAREFA_ID         } QryTarefasTAREFA_ID.AsInteger,
        { TAREFA_ITEM_ID    } QryTarefasITEM_TAREFA_ITEM_ID.AsInteger,
        { ASSUNTO           } QryTarefasASSUNTO.AsString,
        { MENSAGEM          } DeCompressString(AnsiString(QryTarefasMENSAGEM.AsString)),
        { DATA_INICIAL      } viDataInicial,
        { DATA_FINAL        } viDataFinal,
        { SITUACAO          } QryTarefasITEM_SITUACAO.AsString,
        { PERCENTUAL        } QryTarefasITEM_PERCENTUAL.AsCurrency,
        { USUARIO_ID        } QryTarefasUSUARIO_ID.AsInteger,
        { USUARIO_NOME      } QryTarefasUSUARIO_NOME.AsString]);

      MostrarProgresso(CI_METODO_TEXTO, QryTarefas.RecNo, QryTarefas.RecordCount);
      QryTarefas.Next;
    end;

  finally
    TblListagem.EndBatch;
    OcultarProgresso;
    grdLembreteDBTableViewUSUARIO_NOME.Visible := vpUsuarioId = -1;
  end;
end;

procedure TFrmTarefaGerenciamento.PesquisarTarefas(
  const vpUsuarioId: Integer);
var
  viSql: String;
begin
  viSql :=
    'SELECT '+
    '       G_TR.TAREFA_ID, '+
    '       G_TR.SITUACAO, '+
    '       G_TR.PERIODO_TIPO, '+
    '       G_TR.TAREFA_GRUPO_ID, '+
    '       G_TR.DATA_CADASTRO, '+
    '       G_TR.SERVENTIA, '+
    '       G_TR.ASSUNTO, '+
    '       G_TI.MENSAGEM, '+
    '       G_TR.PERCENTUAL, '+
    '       G_TR.DATA_INICIAL, '+
    '       G_TR.HORA_INICIAL, '+
    '       G_TR.DATA_FINAL, '+
    '       G_TR.HORA_FINAL, '+
    '       G_TR.REPETIR_SEGUNDA, '+
    '       G_TR.REPETIR_TERCA, '+
    '       G_TR.REPETIR_QUARTA, '+
    '       G_TR.REPETIR_QUINTA, '+
    '       G_TR.REPETIR_SEXTA, '+
    '       G_TR.REPETIR_SABADO, '+
    '       G_TR.REPETIR_DOMINGO, '+
    '       G_TR.TERMINO_DATA, '+
    '       G_TR.TERMINO_OCORRENCIAS, '+
    '       G_TR.TIPO_TERMINO, '+
    '       G_TI.TAREFA_ITEM_ID          AS ITEM_TAREFA_ITEM_ID, '+
    '       G_TI.TAREFA_ID               AS ITEM_TAREFA_ID, '+
    '       G_TI.SITUACAO                AS ITEM_SITUACAO, '+
    '       G_TI.PERCENTUAL              AS ITEM_PERCENTUAL, '+
    '       G_TI.DATA_INICIAL            AS ITEM_DATA_INICIAL, '+
    '       G_TI.HORA_INICIAL            AS ITEM_HORA_INICIAL, '+
    '       G_TI.DATA_FINAL              AS ITEM_DATA_FINAL, '+
    '       G_TI.HORA_FINAL              AS ITEM_HORA_FINAL, '+
    '       G_US.USUARIO_ID              AS USUARIO_ID, '+
    '       G_US.NOME_COMPLETO           AS USUARIO_NOME '+
    '  FROM G_TAREFA G_TR '+
    ' INNER JOIN G_TAREFA_ITEM G_TI ON G_TR.TAREFA_ID = G_TI.TAREFA_ID '+
    ' INNER JOIN G_USUARIO G_US ON G_US.USUARIO_ID = G_TI.USUARIO_ID '+
    ' WHERE 1 = 1 ';

  if vpUsuarioId > 0 then
    viSql :=
      viSql +
      ' AND G_TI.USUARIO_ID = ' + IntToStr(vpUsuarioId);

  QryTarefas.Close;
  QryTarefas.SQL.Text := viSql;
  QryTarefas.Open;
end;

procedure TFrmTarefaGerenciamento.PreencherCalendario(
  const vpUsuarioId: Integer);
const
  CI_METODO_TEXTO = 'Aguarde... Preenchendo calendário';
var
  viDataInicial: TDateTime;
  viDataFinal: TDateTime;
begin
  MostrarProgresso(CI_METODO_TEXTO, 0, QryTarefas.RecordCount);

  TblCalendario.Open;
  TblCalendario.EmptyDataSet;
  TblCalendario.BeginBatch;
  try
    QryTarefas.First;
    while not QryTarefas.Eof do
    begin
      viDataInicial :=
        StrToDateTime(
          FormatDateTime('dd/MM/yyyy', QryTarefasITEM_DATA_INICIAL.AsDateTime) +
          ' ' +
          FormatDateTime('hh:mm:ss', QryTarefasITEM_HORA_INICIAL.AsDateTime));

      viDataFinal :=
        StrToDateTime(
          FormatDateTime('dd/MM/yyyy', QryTarefasITEM_DATA_FINAL.AsDateTime) +
            ' ' +
            FormatDateTime('hh:mm:ss', QryTarefasITEM_HORA_FINAL.AsDateTime));

      TblCalendario.AppendRecord([
        { ID                         } QryTarefasITEM_TAREFA_ITEM_ID.AsInteger,
        { ResourceID                 } 0,
        { ParentID                   } 0,
        { Caption                    } QryTarefasASSUNTO.AsString,
        { Start                      } viDataInicial,
        { Finish                     } viDataFinal,
        { State                      } 0,
        { ActualFinish               } 0,
        { ActualStart                } 0,
        { EventType                  } 0, // [0..1]
        { LabelColor                 } 3843560, // Link:https://www.tydac.ch/color/
        { Location                   } '', // Deixar em branco
        { Message                    } DeCompressString(AnsiString(QryTarefasMENSAGEM.AsString)),
        { Options                    } 0, // 0 = Etiqueta com data e hora ou ícone do relógio; 1 = Etiqueta sem data
        { RecurrenceIndex            } 0,
        { RecurrenceInfo             } nil,
        { ReminderDate               } Now,
        { ReminderMinutesBeforeStart } 0,
        { ReminderResourcesData      } nil,
        { TaskCompleteField          } 0,
        { TaskIndexField             } 0,
        { TaskLinkField              } nil,
        { TaskStatusField            } 0,
        { GroupId                    } QryTarefasTAREFA_ID.AsInteger]);

      MostrarProgresso(CI_METODO_TEXTO, QryTarefas.RecNo, QryTarefas.RecordCount);
      QryTarefas.Next;
    end;

  finally
    TblCalendario.EndBatch;
    OcultarProgresso;
  end;
end;

procedure TFrmTarefaGerenciamento.scdCalendarioBeforeEditing(
  Sender: TcxCustomScheduler;
  AEvent: TcxSchedulerControlEvent;
  AInplace: Boolean;
  var Allow: Boolean);
var
  viPoint: TPoint;
begin
  //AInplace := False;
  Allow  := False;

  vlTarefaItemId := 0;
  vlDataInicial := 0;
  vlHoraInicial := 0;

  vlTarefaId := 0;

  if AEvent.GroupID <> null then
    vlTarefaId := AEvent.GroupID;

  if AEvent.ID <> null then
    vlTarefaItemId := AEvent.ID;

  if AEvent.Start > 0 then
  begin
    vlDataInicial := StrToDate(FormatDateTime('dd/mm/yyyy', AEvent.Start));
    vlHoraInicial := StrToTime(FormatDateTime('hh:mm:ss', AEvent.Start));
  end;

  mniIncluirTarefa.Visible := True;
  mniAlterarTarefa.Visible := vlTarefaId > 0;
  mniExcluirTarefa.Visible := vlTarefaId > 0;
  mniAlterarTarefaItem.Visible := vlTarefaItemId > 0;
  mniExcluirTarefaItem.Visible := vlTarefaItemId > 0;

  if GetCursorPos(viPoint) then
    ppmCalendario.Popup(viPoint.X, viPoint.Y);
end;

procedure TFrmTarefaGerenciamento.scdCalendarioViewTypeChanged(
  Sender: TObject; APrevView, ANewView: TcxSchedulerCustomView);
begin
  PreencherCalendario(
    sqlResponsavelUSUARIO_ID.AsInteger);
end;

end.
