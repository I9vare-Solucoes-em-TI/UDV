unit Agenda;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  cxEdit, DB,
  Gauges, cxPC, Menus,
  cxMaskEdit,
  cxClasses,
  cxControls, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Buttons, cxDropDownEdit, StdCtrls, cxButtons,
  cxLabel, cxTextEdit, ToolWin, ActnMan, ActnCtrls, ActnMenus, cxContainer,
  ExtCtrls, cxRadioGroup, DBClient, SimpleDS,
  ComCtrls, cxScheduler, cxSchedulerStorage,
  cxSchedulerCustomControls,
  cxSchedulerDayView, cxSchedulerWeekView,
  cxSchedulerDBStorage, cxSchedulerUtils, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu, cxSchedulerRibbonStyleEventEditor,
  cxStyles, cxSchedulerCustomResourceView, cxSchedulerDateNavigator,
  cxSchedulerHolidays, cxSchedulerTimeGridView, cxSchedulerYearView,
  cxSchedulerGanttView, cxSchedulerRecurrence, cxSchedulerTreeListBrowser,
  dxSkinsCore, dxSkinscxPCPainter, dxSkinscxSchedulerPainter;

type
  TfrmAgenda = class(TForm)
    Panel2: TPanel;
    pagPrincipal: TcxPageControl;
    tbsCadastro: TcxTabSheet;
    pnlCadastro: TPanel;
    btnFechar: TcxButton;
    sqlG_Agenda: TI9Query;
    sqlG_AgendaAGENDA_ID: TBCDField;
    sqlG_AgendaTIPO_EVENTO: TBCDField;
    sqlG_AgendaDATA_INICIO: TSQLTimeStampField;
    sqlG_AgendaDATA_FIM: TSQLTimeStampField;
    sqlG_AgendaASSUNTO: TStringField;
    sqlG_AgendaMENSAGEM: TStringField;
    sqlG_AgendaCOR: TBCDField;
    sqlG_AgendaOPCAO: TBCDField;
    sqlG_AgendaSTATUS: TBCDField;
    dtsG_Agenda: TDataSource;
    SchedulerDBStorage: TcxSchedulerDBStorage;
    Panel1: TPanel;
    rdbDiario: TcxRadioButton;
    cxLabel1: TcxLabel;
    rdbSemanal: TcxRadioButton;
    rdbMensal: TcxRadioButton;
    Scheduler: TcxScheduler;
    sqlG_AgendaUSUARIO_ID: TBCDField;
    sqlG_AgendaUSUARIO_AGENDOU_ID: TBCDField;
    sqlG_AgendaMENSAGEM_FINALIZADO: TBlobField;
    cxLabel2: TcxLabel;
    lcxUsuarioAgenda: TcxLookupComboBox;
    sqlG_AgendaDATA_HORA_CADASTRO: TSQLTimeStampField;
    sqlG_AgendaDATA_HORA_ENVIADO: TSQLTimeStampField;
    sqlG_AgendaDATA_HORA_FINALIZADO: TSQLTimeStampField;
    sqlG_AgendaDATA_HORA_AVISADO: TSQLTimeStampField;
    sqlG_AgendaUsuarioAgendouCalc: TStringField;
    sqlG_AgendaTemp: TI9Query;
    dtsG_AgendaTemp: TDataSource;
    sqlG_AgendaTempAGENDA_ID: TBCDField;
    sqlG_AgendaTempTIPO_EVENTO: TBCDField;
    sqlG_AgendaTempDATA_INICIO: TSQLTimeStampField;
    sqlG_AgendaTempDATA_FIM: TSQLTimeStampField;
    sqlG_AgendaTempASSUNTO: TStringField;
    sqlG_AgendaTempMENSAGEM: TStringField;
    sqlG_AgendaTempCOR: TBCDField;
    sqlG_AgendaTempOPCAO: TBCDField;
    sqlG_AgendaTempSTATUS: TBCDField;
    sqlG_AgendaTempUSUARIO_ID: TBCDField;
    sqlG_AgendaTempUSUARIO_AGENDOU_ID: TBCDField;
    sqlG_AgendaTempDATA_HORA_CADASTRO: TSQLTimeStampField;
    sqlG_AgendaTempDATA_HORA_ENVIADO: TSQLTimeStampField;
    sqlG_AgendaTempDATA_HORA_FINALIZADO: TSQLTimeStampField;
    sqlG_AgendaTempMENSAGEM_FINALIZADO: TBlobField;
    sqlG_AgendaTempDATA_HORA_AVISADO: TSQLTimeStampField;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure sqlG_AgendaAfterInsert(DataSet: TDataSet);
    procedure sqlG_AgendaAfterPost(DataSet: TDataSet);
    procedure rdbDiarioClick(Sender: TObject);
    procedure rdbSemanalClick(Sender: TObject);
    procedure rdbMensalClick(Sender: TObject);
    procedure sqlG_AgendaAfterDelete(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure lcxUsuarioAgendaPropertiesChange(Sender: TObject);
    procedure sqlG_AgendaBeforePost(DataSet: TDataSet);
  private
    vpData: TDateTime;
    vpPermissao_AcessarAgenda: string;
    vpEnviouTodos: Boolean;
    procedure LerConfig;
    { Private declarations }
  public
    { Public declarations }
  end;

  // you must create your own thread to synch
  // writing to a gui component
  TClientDataThread = class(TThread)
  private
  public
    ListBuffer :TStringList;
    TargetList :TStrings;
    procedure synchAddDataToControl;
    constructor Create(CreateSuspended: Boolean);
    procedure Execute; override;
    procedure Terminate;
  end;

var
  frmAgenda: TfrmAgenda;

implementation
uses Controles, Lookup;
{$R *.dfm}

//------------- TClientDataThread impl -----------------------------------------
constructor TClientDataThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  FreeOnTerminate := true;
  ListBuffer := TStringList.Create;
end;

procedure TClientDataThread.Terminate;
begin
  ListBuffer.Free;
  inherited;
end;

procedure TClientDataThread.Execute;
begin
  Synchronize(synchAddDataToControl);
end;

procedure TClientDataThread.synchAddDataToControl;
begin
  TargetList.AddStrings(ListBuffer);
end;
//------------- end TClientDataThread impl -------------------------------------


procedure TfrmAgenda.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmAgenda := nil;
end;

procedure TfrmAgenda.FormCreate(Sender: TObject);
begin
  inherited;
  vpData := dtmControles.DataHoraBanco(3);
  sqlG_Agenda.Connection := dtmControles.DB;
  sqlG_AgendaTemp.Connection := dtmControles.DB;
  vpEnviouTodos := False;
  LerConfig;
end;

procedure TfrmAgenda.sqlG_AgendaAfterInsert(DataSet: TDataSet);
begin
  sqlG_AgendaAGENDA_ID.AsCurrency := dtmControles.GerarSequencia('G_AGENDA');
  sqlG_AgendaUSUARIO_AGENDOU_ID.AsString := vgUsuarioID;
  sqlG_AgendaDATA_HORA_CADASTRO.AsDateTime := dtmControles.DataHoraBanco(3);
end;

procedure TfrmAgenda.sqlG_AgendaAfterPost(DataSet: TDataSet);
begin
  if vpEnviouTodos = False then
    sqlG_Agenda.ApplyUpdates(-1)
  else
    vpEnviouTodos := False;
end;

procedure TfrmAgenda.rdbDiarioClick(Sender: TObject);
begin
  if not Scheduler.ViewWeek.Active then
    vpData := Scheduler.SelectedDays[0];
  Scheduler.SelectDays([vpData], TMenuItem(Sender).Tag in [0, 1]);
  Scheduler.ViewDay.Active := True;
end;

procedure TfrmAgenda.rdbSemanalClick(Sender: TObject);
begin
  if not Scheduler.ViewWeek.Active then
    vpData := Scheduler.SelectedDays[0];
  Scheduler.SelectDays([vpData], TMenuItem(Sender).Tag in [0, 1]);
  Scheduler.ViewWeek.Active := True;
end;

procedure TfrmAgenda.rdbMensalClick(Sender: TObject);
begin
  if not Scheduler.ViewWeek.Active then
    vpData := Scheduler.SelectedDays[0];
  Scheduler.SelectDays([vpData], TMenuItem(Sender).Tag in [0, 1]);
  Scheduler.GoToDate(Scheduler.SelectedDays[0], vmMonth);
end;

procedure TfrmAgenda.sqlG_AgendaAfterDelete(DataSet: TDataSet);
begin
  sqlG_Agenda.ApplyUpdates(-1);
end;

procedure TfrmAgenda.LerConfig;
begin
  vpPermissao_AcessarAgenda := dtmControles.CodPermissao('ESP_ACESSAR_AGENDA');
  if (vpPermissao_AcessarAgenda[6] = '1') or (vgLogin = 'TRI7') then //Tem Permissão
    lcxUsuarioAgenda.Enabled := True
  else
    lcxUsuarioAgenda.Enabled := False;
end;

procedure TfrmAgenda.FormShow(Sender: TObject);
begin
  lcxUsuarioAgenda.EditValue := vgUsuarioID;
end;

procedure TfrmAgenda.lcxUsuarioAgendaPropertiesChange(Sender: TObject);
begin
  sqlG_Agenda.Close;
  sqlG_Agenda.Params[0].AsCurrency := lcxUsuarioAgenda.EditValue;
  sqlG_Agenda.Open;
end;

procedure TfrmAgenda.sqlG_AgendaBeforePost(DataSet: TDataSet);
var
  vTipoEvento, vAssunto, vMensagem,
  vCor, vOpcao, vStatus: string;
  vDataHoraEnviado, vDataInicio, vDataFim: TDateTime;
begin
  if (sqlG_Agenda.State = dsInsert) and (sqlG_AgendaSTATUS.AsCurrency = 1) then
  begin
    vpEnviouTodos := True;
    vTipoEvento := sqlG_AgendaTIPO_EVENTO.AsString;
    vDataInicio := sqlG_AgendaDATA_INICIO.AsDateTime;
    vDataFim := sqlG_AgendaDATA_FIM.AsDateTime;
    vAssunto := sqlG_AgendaASSUNTO.AsString;
    vMensagem := sqlG_AgendaMENSAGEM.AsString;
    vCor := sqlG_AgendaCOR.AsString;
    vOpcao := sqlG_AgendaOPCAO.AsString;
    vStatus := sqlG_AgendaSTATUS.AsString;
    vDataHoraEnviado := sqlG_AgendaDATA_HORA_ENVIADO.AsDateTime;
    sqlG_Agenda.Cancel;
    sqlG_AgendaTemp.Active := True;
    dtmLookup.sqlUsuarioSistema.First;
    while not dtmLookup.sqlUsuarioSistema.Eof do
    begin
      sqlG_AgendaTemp.Insert;
      sqlG_AgendaTempAGENDA_ID.AsCurrency := dtmControles.GerarSequencia('G_AGENDA');
      sqlG_AgendaTempTIPO_EVENTO.AsString := vTipoEvento;
      sqlG_AgendaTempDATA_INICIO.AsDateTime := vDataInicio;
      sqlG_AgendaTempDATA_FIM.AsDateTime := vDataFim;
      sqlG_AgendaTempASSUNTO.AsString := vAssunto;
      sqlG_AgendaTempMENSAGEM.AsString := vMensagem;
      sqlG_AgendaTempCOR.AsString := vCor;
      sqlG_AgendaTempOPCAO.AsString := vOpcao;
      sqlG_AgendaTempSTATUS.AsString := vStatus;
      sqlG_AgendaTempUSUARIO_ID.AsCurrency := dtmLookup.sqlUsuarioSistemaUSUARIO_ID.AsCurrency;
      sqlG_AgendaTempUSUARIO_AGENDOU_ID.AsString := vgUsuarioID;
      sqlG_AgendaTempDATA_HORA_CADASTRO.AsDateTime := dtmControles.DataHoraBanco(3);
      sqlG_AgendaTempDATA_HORA_ENVIADO.AsDateTime := vDataHoraEnviado;
      sqlG_AgendaTemp.ApplyUpdates(-1);
      dtmLookup.sqlUsuarioSistema.Next;
    end;
    sqlG_Agenda.Refresh;
  end;
end;

end.













































































