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
  Vcl.ComCtrls, dxCore, cxDateUtils;

type
  TFrmTarefaGerenciamento = class(TForm)
    btnCriar: TcxButton;
    btnHoje: TcxButton;
    dateNavigator: TcxDateNavigator;
    DtsTarefaItem: TDataSource;
    mniAlterarTarefaItem: TMenuItem;
    mniExcluirTarefaItem: TMenuItem;
    Panel1: TPanel;
    Panel2: TPanel;
    ppmScheduler: TPopupMenu;
    QryTarefaItem: TI9Query;
    QryTarefaItemASSUNTO: TStringField;
    QryTarefaItemDATA_CADASTRO: TSQLTimeStampField;
    QryTarefaItemDATA_FINAL: TSQLTimeStampField;
    QryTarefaItemDATA_INICIAL: TSQLTimeStampField;
    QryTarefaItemHORA_FINAL: TSQLTimeStampField;
    QryTarefaItemHORA_INICIAL: TSQLTimeStampField;
    QryTarefaItemITEM_DATA_FINAL: TSQLTimeStampField;
    QryTarefaItemITEM_DATA_INICIAL: TSQLTimeStampField;
    QryTarefaItemITEM_HORA_FINAL: TSQLTimeStampField;
    QryTarefaItemITEM_HORA_INICIAL: TSQLTimeStampField;
    QryTarefaItemITEM_PERCENTUAL: TBCDField;
    QryTarefaItemITEM_SITUACAO: TStringField;
    QryTarefaItemITEM_TAREFA_ID: TBCDField;
    QryTarefaItemITEM_TAREFA_ITEM_ID: TBCDField;
    QryTarefaItemMENSAGEM: TBlobField;
    QryTarefaItemPERCENTUAL: TBCDField;
    QryTarefaItemPERIODO_TIPO: TStringField;
    QryTarefaItemREPETIR_DOMINGO: TStringField;
    QryTarefaItemREPETIR_QUARTA: TStringField;
    QryTarefaItemREPETIR_QUINTA: TStringField;
    QryTarefaItemREPETIR_SABADO: TStringField;
    QryTarefaItemREPETIR_SEGUNDA: TStringField;
    QryTarefaItemREPETIR_SEXTA: TStringField;
    QryTarefaItemREPETIR_TERCA: TStringField;
    QryTarefaItemSERVENTIA: TBCDField;
    QryTarefaItemSITUACAO: TStringField;
    QryTarefaItemTAREFA_GRUPO_ID: TBCDField;
    QryTarefaItemTAREFA_ID: TBCDField;
    QryTarefaItemTERMINO_DATA: TSQLTimeStampField;
    QryTarefaItemTERMINO_OCORRENCIAS: TBCDField;
    QryTarefaItemTIPO_TERMINO: TStringField;
    QryTarefaItemUSUARIO_ID: TBCDField;
    scdHolydays: TcxSchedulerHolidays;
    SchedulerDBStorage: TcxSchedulerDBStorage;
    tblTarefaItem: TFDMemTable;
    tblTarefaItemActualFinish: TIntegerField;
    tblTarefaItemActualStart: TIntegerField;
    tblTarefaItemcaption: TStringField;
    tblTarefaItemEventType: TIntegerField;
    tblTarefaItemFinish: TDateTimeField;
    tblTarefaItemGroupId: TIntegerField;
    tblTarefaItemID: TIntegerField;
    tblTarefaItemLabelColor: TIntegerField;
    tblTarefaItemLocation: TStringField;
    tblTarefaItemMessage: TStringField;
    tblTarefaItemOptions: TIntegerField;
    tblTarefaItemParentID: TIntegerField;
    tblTarefaItemRecurrenceIndex: TIntegerField;
    tblTarefaItemRecurrenceInfo: TBlobField;
    tblTarefaItemReminderDate: TDateTimeField;
    tblTarefaItemReminderMinutesBeforeStart: TIntegerField;
    tblTarefaItemReminderResourcesData: TBlobField;
    tblTarefaItemResourceID: TIntegerField;
    tblTarefaItemStart: TDateTimeField;
    tblTarefaItemState: TIntegerField;
    tblTarefaItemTaskCompleteField: TIntegerField;
    tblTarefaItemTaskIndexField: TIntegerField;
    tblTarefaItemTaskLinkField: TBlobField;
    tblTarefaItemTaskStatusField: TIntegerField;
    PnlProgresso: TPanel;
    LblProgresso: TLabel;
    PgbProgresso: TcxProgressBar;
    mniIncluirTarefa: TMenuItem;
    mniAlterarTarefa: TMenuItem;
    N1: TMenuItem;
    mniExcluirTarefa: TMenuItem;
    N2: TMenuItem;
    PnlLembretes: TPanel;
    grdLembreteDBTableView: TcxGridDBTableView;
    grdLembreteLevel: TcxGridLevel;
    grdLembrete: TcxGrid;
    tblLembrete: TFDMemTable;
    dtsLembrete: TDataSource;
    tblLembreteASSUNTO: TStringField;
    tblLembreteMENSAGEM: TStringField;
    tblLembreteDATA_FINAL: TDateTimeField;
    tblLembreteDATA_INICIAL: TDateTimeField;
    tblLembreteTAREFA_ID: TIntegerField;
    tblLembreteTAREFA_ITEM_ID: TIntegerField;
    tblLembreteSITUACAO: TStringField;
    tblLembretePERCENTUAL: TCurrencyField;
    grdLembreteDBTableViewASSUNTO: TcxGridDBColumn;
    grdLembreteDBTableViewMENSAGEM: TcxGridDBColumn;
    grdLembreteDBTableViewDATA_INICIAL: TcxGridDBColumn;
    grdLembreteDBTableViewDATA_FINAL: TcxGridDBColumn;
    grdLembreteDBTableViewSITUACAO: TcxGridDBColumn;
    btnAtualizar: TcxButton;
    icxTipoPeriodo: TcxImageComboBox;
    lblPeriodo: TcxLabel;
    splTarefa: TcxSplitter;
    btnFechar: TcxButton;
    scdTarefas: TcxScheduler;

    procedure btnAtualizarClick(Sender: TObject);
    procedure btnCriarClick(Sender: TObject);
    procedure btnHojeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure icxTipoPeriodoPropertiesChange(Sender: TObject);

    procedure scdTarefasBeforeEditing(
      Sender: TcxCustomScheduler;
      AEvent: TcxSchedulerControlEvent;
      AInplace: Boolean;
      var Allow: Boolean
    );

    procedure mniIncluirTarefaClick(Sender: TObject);
    procedure mniAlterarTarefaClick(Sender: TObject);
    procedure mniExcluirTarefaClick(Sender: TObject);
    procedure mniAlterarTarefaItemClick(Sender: TObject);
    procedure mniExcluirTarefaItemClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dateNavigatorSelectionChanged(Sender: TObject; const AStart, AFinish: TDateTime);
    procedure scdTarefasViewTypeChanged(Sender: TObject; APrevView,
      ANewView: TcxSchedulerCustomView);
    procedure scdTarefasEventSelectionChanged(Sender: TcxCustomScheduler;
      AEvent: TcxSchedulerControlEvent);

  private

    vlTarefaId: Integer;
    vlTarefaItemId: Integer;
    vlDataInicial: TDatetime;
    vlHoraInicial: TTime;
    vlDataAtual: TDateTime;

    procedure AtualizarTela;

    procedure PreencherTarefas(
      const vpUsuarioId: Integer);

    procedure PreencherLembretes(
      const vpUsuarioId: Integer;
      const vpDataInicial: TDateTime;
      const vpDataFinal: TDateTime
    );

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
var
  viFrmCadastroRapdidoTarefa: TfrmCadastroRapidoTarefa;
begin
  if vpTarefaId <= 0 then
    Exit;

  TfrmCadastroRapidoTarefa.AbrirCadastroRapido(
    vpTarefaId);

  PreencherTarefas(0);

  PreencherLembretes(
    0,
    scdTarefas.CurrentView.FirstVisibleDate,
    scdTarefas.CurrentView.LastVisibleDate);
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

  PreencherTarefas(0);
  PreencherLembretes(0, scdTarefas.CurrentView.FirstVisibleDate, scdTarefas.CurrentView.LastVisibleDate);
end;

procedure TFrmTarefaGerenciamento.AtualizarTela;
begin
  ControlarTipoPeriodo;
  PreencherTarefas(0);
  PreencherLembretes(0, scdTarefas.CurrentView.FirstVisibleDate, scdTarefas.CurrentView.LastVisibleDate);
end;

procedure TFrmTarefaGerenciamento.btnAtualizarClick(Sender: TObject);
begin
  AtualizarTela;
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
  scdTarefas.GoToDate(vlDataAtual);
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

  scdTarefas.ViewYear.Active := True;
  scdTarefas.ViewYear.Scale := 12;
  scdTarefas.GoToDate(viDataAtual);
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

  scdTarefas.ViewDay.Active := True;
  scdTarefas.SelectDays(viInicioDecendio, viFinalDecendio, True);
  scdTarefas.GoToDate(viDataAtual);
end;

procedure TFrmTarefaGerenciamento.ControlarTipoPeriodoDia(const vpDataAtual: TDateTime);
var
  viDataAtual: TDateTime;
begin
  viDataAtual := vpDataAtual;

  scdTarefas.ViewDay.Active := True;
  scdTarefas.SelectDays(viDataAtual, viDataAtual, True);
  scdTarefas.GoToDate(viDataAtual);
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

  scdTarefas.ViewWeeks.Active := True;
  scdTarefas.SelectDays(viInicioMes, viFinalMes);
  scdTarefas.GoToDate(viDataAtual);
end;

procedure TFrmTarefaGerenciamento.ControlarTipoPeriodoNormal(const vpDataAtual: TDateTime);
var
  viDataAtual: TDateTime;
begin
  viDataAtual := vpDataAtual;

  scdTarefas.ViewTimeGrid.Active := True;
  scdTarefas.SelectDays(viDataAtual, viDataAtual, True);
  scdTarefas.GoToDate(viDataAtual);
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

  scdTarefas.ViewDay.Active := True;
  scdTarefas.SelectDays(viInicioQuinzena, viFinalQuinzena, True);
  scdTarefas.GoToDate(viDataAtual);
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

  scdTarefas.ViewDay.Active := True;
  scdTarefas.SelectDays(viInicioSemana, viFinalSemana, True);
  scdTarefas.GoToDate(viDataAtual);
end;

procedure TFrmTarefaGerenciamento.ControlarTipoPeriodoSemestre(const vpDataAtual: TDateTime);
var
  viDataAtual: TDateTime;
begin
  viDataAtual := vpDataAtual;

  scdTarefas.ViewYear.Active := True;
  scdTarefas.ViewYear.Scale := 6;
  scdTarefas.GoToDate(viDataAtual);
end;

procedure TFrmTarefaGerenciamento.ControlarTipoPeriodoTrimestre(const vpDataAtual: TDateTime);
var
  viDataAtual: TDateTime;
begin
  viDataAtual := vpDataAtual;

  scdTarefas.ViewYear.Active := True;
  scdTarefas.ViewYear.Scale := 3;
  scdTarefas.GoToDate(viDataAtual);
end;

procedure TFrmTarefaGerenciamento.dateNavigatorSelectionChanged(Sender: TObject; const AStart, AFinish: TDateTime);
begin
  PreencherLembretes(
    0,
    scdTarefas.CurrentView.FirstVisibleDate,
    scdTarefas.CurrentView.LastVisibleDate
  );
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

  PreencherTarefas(0);
  PreencherLembretes(0, scdTarefas.CurrentView.FirstVisibleDate, scdTarefas.CurrentView.LastVisibleDate);
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

  PreencherTarefas(0);
  PreencherLembretes(0, scdTarefas.CurrentView.FirstVisibleDate, scdTarefas.CurrentView.LastVisibleDate);
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
  vlDataAtual := StartOfTheDay(dtmControles.DataHoraBanco(3));
  AtualizarTela;
end;

procedure TFrmTarefaGerenciamento.icxTipoPeriodoPropertiesChange(Sender: TObject);
begin
  ControlarTipoPeriodo;
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

  PreencherTarefas(0);
  PreencherLembretes(0, scdTarefas.CurrentView.FirstVisibleDate, scdTarefas.CurrentView.LastVisibleDate);
end;

procedure TFrmTarefaGerenciamento.mniAlterarTarefaClick(Sender: TObject);
begin
  AlterarTarefa(vlTarefaId);
end;

procedure TFrmTarefaGerenciamento.mniAlterarTarefaItemClick(Sender: TObject);
begin
  AlterarTarefaItem(vlTarefaItemId);
end;

procedure TFrmTarefaGerenciamento.mniExcluirTarefaClick(Sender: TObject);
begin
  ExcluirTarefa(vlTarefaId);
end;

procedure TFrmTarefaGerenciamento.mniExcluirTarefaItemClick(Sender: TObject);
begin
  ExcluirTarefaItem(vlTarefaItemId);
end;

procedure TFrmTarefaGerenciamento.mniIncluirTarefaClick(Sender: TObject);
begin
  IncluirTarefa(
    'D',
    vlDataInicial,
    vlHoraInicial
  );
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

procedure TFrmTarefaGerenciamento.PreencherLembretes(
  const vpUsuarioId: Integer;
  const vpDataInicial: TDateTime;
  const vpDataFinal: TDateTime
);
const
  CI_METODO_TEXTO = 'Aguarde... Preenchendo os lembretes';
var
  viDataInicial: TDateTime;
  viDataFinal: TDateTime;
begin
  tblLembrete.Open;
  tblLembrete.EmptyDataSet;

  QryTarefaItem.Close;
  QryTarefaItem.Open;

  MostrarProgresso(CI_METODO_TEXTO, 0, QryTarefaItem.RecordCount);

  tblLembrete.BeginBatch;
  try
    QryTarefaItem.First;
    while not QryTarefaItem.Eof do
    begin
      viDataInicial :=
        StrToDateTime(
          FormatDateTime('dd/MM/yyyy', QryTarefaItemITEM_DATA_INICIAL.AsDateTime) +
          ' ' +
          FormatDateTime('hh:mm:ss', QryTarefaItemITEM_HORA_INICIAL.AsDateTime)
        );

      viDataFinal :=
        StrToDateTime(
          FormatDateTime('dd/MM/yyyy', QryTarefaItemITEM_DATA_FINAL.AsDateTime) +
            ' ' +
            FormatDateTime('hh:mm:ss', QryTarefaItemITEM_HORA_FINAL.AsDateTime)
          );

      if not ((vpDataInicial > 0) and (viDataInicial >= StartOfTheDay(vpDataInicial))) then
      begin
        QryTarefaItem.Next;
        Continue;
      end;

      if not ((vpDataFinal > 0) and (viDataFinal <= EndOfTheDay(vpDataFinal))) then
      begin
        QryTarefaItem.Next;
        Continue;
      end;

      tblLembrete.AppendRecord([
        { TAREFA_ID         } QryTarefaItemTAREFA_ID.AsInteger,
        { TAREFA_ITEM_ID    } QryTarefaItemITEM_TAREFA_ITEM_ID.AsInteger,
        { ASSUNTO           } QryTarefaItemASSUNTO.AsString,
        { MENSAGEM          } DeCompressString(AnsiString(QryTarefaItemMENSAGEM.AsString)),
        { DATA_INICIAL      } viDataInicial,
        { DATA_FINAL        } viDataFinal,
        { SITUACAO          } QryTarefaItemITEM_SITUACAO.AsString,
        { PERCENTUAL        } QryTarefaItemITEM_PERCENTUAL.AsCurrency
      ]);

      MostrarProgresso(CI_METODO_TEXTO, QryTarefaItem.RecNo, QryTarefaItem.RecordCount);

      QryTarefaItem.Next;
    end;

  finally
    tblLembrete.EndBatch;
    //QryTarefaItem.Close;
    OcultarProgresso;
  end;
end;

procedure TFrmTarefaGerenciamento.PreencherTarefas(const vpUsuarioId: Integer);
const
  CI_METODO_TEXTO = 'Aguarde... Preenchendo as Tarefas';
var
  viDataInicial: TDateTime;
  viDataFinal: TDateTime;
begin
  tblTarefaItem.Open;
  tblTarefaItem.EmptyDataSet;

  QryTarefaItem.Close;
  QryTarefaItem.Open;

  MostrarProgresso(CI_METODO_TEXTO, 0, QryTarefaItem.RecordCount);

  tblTarefaItem.BeginBatch;
  try
    QryTarefaItem.First;
    while not QryTarefaItem.Eof do
    begin
      viDataInicial :=
        StrToDateTime(
          FormatDateTime('dd/MM/yyyy', QryTarefaItemITEM_DATA_INICIAL.AsDateTime) +
          ' ' +
          FormatDateTime('hh:mm:ss', QryTarefaItemITEM_HORA_INICIAL.AsDateTime)
        );

      viDataFinal :=
        StrToDateTime(
          FormatDateTime('dd/MM/yyyy', QryTarefaItemITEM_DATA_FINAL.AsDateTime) +
            ' ' +
            FormatDateTime('hh:mm:ss', QryTarefaItemITEM_HORA_FINAL.AsDateTime)
          );

      tblTarefaItem.AppendRecord([
        { ID                         } QryTarefaItemITEM_TAREFA_ITEM_ID.AsInteger,
        { ResourceID                 } 0,
        { ParentID                   } 0,
        { Caption                    } QryTarefaItemASSUNTO.AsString,
        { Start                      } viDataInicial,
        { Finish                     } viDataFinal,
        { State                      } 0,
        { ActualFinish               } 0,
        { ActualStart                } 0,
        { EventType                  } 0, // [0..1]
        { LabelColor                 } 3843560, // Link:https://www.tydac.ch/color/
        { Location                   } '', // Deixar em branco
        { Message                    } DeCompressString(AnsiString(QryTarefaItemMENSAGEM.AsString)),
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
        { GroupId                    } QryTarefaItemTAREFA_ID.AsInteger
      ]);

      MostrarProgresso(CI_METODO_TEXTO, QryTarefaItem.RecNo, QryTarefaItem.RecordCount);

      QryTarefaItem.Next;
    end;

  finally
    tblTarefaItem.EndBatch;
    QryTarefaItem.Close;
    OcultarProgresso;
  end;
end;

procedure TFrmTarefaGerenciamento.scdTarefasBeforeEditing(
  Sender: TcxCustomScheduler;
  AEvent: TcxSchedulerControlEvent;
  AInplace: Boolean;
  var Allow: Boolean
);
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
    ppmScheduler.Popup(viPoint.X, viPoint.Y);
end;

procedure TFrmTarefaGerenciamento.scdTarefasEventSelectionChanged(
  Sender: TcxCustomScheduler; AEvent: TcxSchedulerControlEvent);
begin
  (*
  PreencherLembretes(
    0,
    scdTarefas.CurrentView.FirstVisibleDate,
    scdTarefas.CurrentView.LastVisibleDate
  );
  *)
end;

procedure TFrmTarefaGerenciamento.scdTarefasViewTypeChanged(
  Sender: TObject; APrevView, ANewView: TcxSchedulerCustomView);
begin
  PreencherLembretes(
    0,
    scdTarefas.CurrentView.FirstVisibleDate,
    scdTarefas.CurrentView.LastVisibleDate
  );
end;

end.
