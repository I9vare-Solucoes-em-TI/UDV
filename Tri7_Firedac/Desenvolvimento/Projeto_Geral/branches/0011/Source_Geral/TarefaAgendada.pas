unit TarefaAgendada;

interface

uses
  Controles,
  cxBarEditItem,
  cxCalendar,
  cxCheckBox,
  cxClasses,
  cxContainer,
  cxControls,
  cxCustomData,
  cxData,
  cxDataStorage,
  cxDateNavigator,
  cxDBData,
  cxDBLookupComboBox,
  cxDBTL,
  cxDropDownEdit,
  cxEdit,
  cxFilter,
  cxGraphics,
  cxGrid,
  cxGridCustomTableView,
  cxGridCustomView,
  cxGridDBTableView,
  cxGridLevel,
  cxGridTableView,
  cxImageComboBox,
  cxInplaceContainer,
  cxLookAndFeelPainters,
  cxLookAndFeels,
  cxMaskEdit,
  cxNavigator,
  cxPC,
  cxRichEdit,
  cxSchedulerCustomControls,
  cxSchedulerDateNavigator,
  cxSchedulerDBStorage,
  cxSchedulerStorage,
  cxSplitter,
  cxStyles,
  cxTextEdit,
  cxTL,
  cxTLData,
  cxTLdxBarBuiltInMenu,
  Data.DB,
  DateUtils,
  dxBar,
  dxBarBuiltInMenu,
  dxBarExtItems,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Async,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  I9Query,
  IniFiles,
  System.Classes,
  System.SysUtils,
  System.Variants,
  System.UITypes,
  Vcl.Controls,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Graphics,
  Winapi.Messages,
  Winapi.Windows,
  cxProgressBar,
  Vcl.StdCtrls,
  I9MemTable,
  Vcl.Menus,
  Lookup,
  cxButtons,
  cxSchedulerHolidays, dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinscxPCPainter, cxLookupEdit, cxDBLookupEdit, cxLabel, cxDBEdit, cxGroupBox, cxMemo, Vcl.ComCtrls, dxCore, cxDateUtils,
  cxDBRichEdit;

type
  TfrmTarefaAgendada = class(TForm)
    dtsLembrete: TDataSource;
    tblLembrete: TI9MemTable;
    tblLembreteASSUNTO: TStringField;
    tblLembreteDATA_FINAL: TDateTimeField;
    tblLembreteDATA_INICIAL: TDateTimeField;
    tblLembreteMENSAGEM: TStringField;
    tblLembretePERCENTUAL: TCurrencyField;
    tblLembreteSITUACAO: TStringField;
    tblLembreteTAREFA_ID: TIntegerField;
    tblLembreteTAREFA_ITEM_ID: TIntegerField;
    PnlBottom: TPanel;
    LblTarefasCanceladas: TLabel;
    ShpTarefasCanceladas: TShape;
    ShpTarefasVencer3Dias: TShape;
    LblTarefasVencer3Dias: TLabel;
    ShpTarefasVencer10Dias: TShape;
    ShpTarefasVencemHoje: TShape;
    LblTarefasVencemHoje: TLabel;
    ShpOutrasTarefas: TShape;
    LblOutrasTarefas: TLabel;
    LblTarefasVencer10Dias: TLabel;
    ppmLembrete: TPopupMenu;
    mniConcluirTarefa: TMenuItem;
    mniCancelarTarefa: TMenuItem;
    N1: TMenuItem;
    mniDesfazerTarefa: TMenuItem;
    stlRepositorio: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyleDestaque: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxStyle43: TcxStyle;
    cxStyle44: TcxStyle;
    cxStyle45: TcxStyle;
    cxStyle46: TcxStyle;
    cxStyle47: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridTableViewStyleSheetLigth: TcxGridTableViewStyleSheet;
    LblTarefasRealizadas: TLabel;
    ShpTarefasRealizadas: TShape;
    tblLembreteMOTIVO: TStringField;
    ShpTarefasVencidas: TShape;
    LblTarefasVencidas: TLabel;
    hldFeriados: TcxSchedulerHolidays;
    sdbStorage: TcxSchedulerDBStorage;
    pnlClient: TPanel;
    PnlLembrete: TPanel;
    tbcLembrete: TcxTabControl;
    grdLembrete: TcxGrid;
    grdLembreteDBTableView: TcxGridDBTableView;
    grdLembreteDBTableViewASSUNTO: TcxGridDBColumn;
    grdLembreteDBTableViewMENSAGEM: TcxGridDBColumn;
    grdLembreteDBTableViewDATA_INICIAL: TcxGridDBColumn;
    grdLembreteDBTableViewDATA_FINAL: TcxGridDBColumn;
    grdLembreteDBTableViewSITUACAO: TcxGridDBColumn;
    grdLembreteDBTableViewMOTIVO: TcxGridDBColumn;
    grdLembreteLevel: TcxGridLevel;
    tblTarefaGrupo: TFDMemTable;
    dtsTarefaGrupo: TDataSource;
    tblTarefaGrupoTAREFA_GRUPO_ID: TIntegerField;
    tblTarefaGrupoDESCRICAO: TStringField;
    tblTarefaGrupoSITUACAO: TStringField;
    tblTarefaGrupoSERVENTIA: TIntegerField;
    PnlFiltro: TPanel;
    lblTarefaGrupo: TcxLabel;
    lcxTarefaGrupo: TcxDBImageComboBox;
    BtnLimpar: TcxButton;
    LblSituacao: TcxLabel;
    LcbSituacao: TcxComboBox;
    BtnPesquisar: TcxButton;
    LblAssunto: TcxLabel;
    EdtAssunto: TcxTextEdit;
    btnFechar: TcxButton;
    gpxPeriodo: TcxGroupBox;
    DteDataInicial: TcxDateEdit;
    DteDataFinal: TcxDateEdit;
    pnlAcoesMotivo: TPanel;
    btnIncluirTarefa: TcxButton;
    btnAlterarTarefa: TcxButton;
    btnExcluirTafefa: TcxButton;

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure dateNavigatorPeriodChanged(Sender: TObject; const AStart: TDateTime; const AFinish: TDateTime);

    procedure grdLembreteDBTableViewCustomDrawCell(
      Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean
    );
    procedure btnFecharClick(Sender: TObject);
    procedure mniConcluirTarefaClick(Sender: TObject);
    procedure ppmLembretePopup(Sender: TObject);
    procedure mniCancelarTarefaClick(Sender: TObject);
    procedure mniDesfazerTarefaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbxTarefasRealizadasClick(Sender: TObject);
    procedure dateNavigatorSelectionChanged(Sender: TObject; const AStart, AFinish: TDateTime);
    procedure btnIncluirTarefaClick(Sender: TObject);
    procedure btnTarefaGrupoLimparClick(Sender: TObject);
    procedure BtnLimparClick(Sender: TObject);
    procedure btnAlterarTarefaClick(Sender: TObject);
    procedure btnExcluirTafefaClick(Sender: TObject);
    procedure tbcLembreteChange(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);

  private
    FPrimeiroDia: TDateTime;
    FUltimoDia: TDateTime;

    procedure AtualizaMsgTela(
      vpMsg: string);

    procedure OrganizarFiltros;
    procedure CarregarFiltros;
    procedure LimparFiltros;
    procedure LimparMsgTela;

    procedure IncluirTarefa(
      const vpTipoPeriodo: string;
      const vpDataInicial: TDatetime;
      const vpHoraInicial: TDatetime);

    procedure Pesquisar;

    procedure PesquisarLembretes(
      const vpUsuarioId: Integer;
      const vpSistemaId: Integer;
      const vpDataInicial: TDateTime;
      const vpDataFinal: TDateTime;
      const vpSituacao: String;
      const vpGrupo: Integer;
      const vpAssunto: String);

    procedure PreencherGrupo;
    procedure PreencherSituacao;

    function RetornarPrimeiroDia: TDateTime;
    function RetornarUltimoDia: TDateTime;
    function RetornarSituacao: string;
    function RetornarGrupo: Integer;
    function RetornarAssunto: string;

  public
  end;

var
  frmTarefaAgendada: TfrmTarefaAgendada;

implementation

uses
  Atualizacao,
  CadastroSubTarefa,
  TarefaProcessos,
  Rotinas,
  MensagemUtils,
  CadastroRapidoTarefa,
  Geral.Controller.TarefaGrupo,
  Geral.Model.TarefaGrupo,
  Geral.Controller.Usuario,
  Geral.Model.Usuario,
  Geral.View.Input.RadioGroup,
  System.Generics.Collections;

{$R *.dfm}

function InputBoxData(
  const ACaption: String;
  const APrompt : string): TDateTime;
var
  Buffer: array[0..51] of Char;
  ButtonHeight: Integer;
  ButtonTop: Integer;
  ButtonWidth: Integer;
  DialogUnits: TPoint;
  Form: TForm;
  i: Integer;
  viBotaoCancelar: TButton;
  viBotaoOk: TButton;
  viEdit : TCxDateEdit;
  viPrompt: TLabel;
begin
  Result := 0;

  Form := TForm.Create(Application);
  try
    Form.Canvas.Font := Form.Font;

    for i := 0 to 25 do
      Buffer[i] := Chr(i + Ord('A'));

    for i := 0 to 25 do
      Buffer[i + 26] := Chr(i + Ord('a'));

    GetTextExtentPoint(Form.Canvas.Handle, Buffer, 52, TSize(DialogUnits));
    DialogUnits.X := DialogUnits.X div 52;

    Form.BorderStyle := bsDialog;
    Form.Caption := ACaption;
    Form.ClientWidth := MulDiv(180, DialogUnits.X, 4);
    Form.ClientHeight := MulDiv(63, DialogUnits.Y, 8);
    Form.Position := poScreenCenter;
    Form.Color := clWhite;

    viPrompt := TLabel.Create(Form);
    viPrompt.Parent := Form;
    viPrompt.AutoSize := True;
    viPrompt.Left := MulDiv(8, DialogUnits.X, 4);
    viPrompt.Top := MulDiv(8, DialogUnits.Y, 8);
    viPrompt.Caption := APrompt;

    viEdit := TCxDateEdit.Create(Form);
    viEdit.Parent := Form;
    viEdit.Left := viPrompt.Left;
    viEdit.Top := MulDiv(19, DialogUnits.Y, 8);
    viEdit.Width := MulDiv(164, DialogUnits.X, 4);
    viEdit.SelectAll;

    ButtonTop := MulDiv(41, DialogUnits.Y, 8);
    ButtonWidth := MulDiv(50, DialogUnits.X, 4);
    ButtonHeight := MulDiv(14, DialogUnits.Y, 8);

    viBotaoOk := TButton.Create(Form);
    viBotaoOk.Parent := Form;
    viBotaoOk.Caption := 'OK';
    viBotaoOk.ModalResult := mrOk;
    viBotaoOk.Default := True;
    viBotaoOk.SetBounds(MulDiv(38, DialogUnits.X, 4),ButtonTop, ButtonWidth, ButtonHeight);

    viBotaoCancelar := TButton.Create(Form);
    viBotaoCancelar.Parent := Form;
    viBotaoCancelar.Caption := 'Cancelar';
    viBotaoCancelar.ModalResult := mrCancel;
    viBotaoCancelar.Cancel := True;
    viBotaoCancelar.SetBounds(MulDiv(92, DialogUnits.X, 4),ButtonTop, ButtonWidth, ButtonHeight);

    if Form.ShowModal = mrOk then
      Result := viEdit.Date;

  finally
    FreeAndNil(Form);
  end;
end;

procedure TfrmTarefaAgendada.AtualizaMsgTela(
  vpMsg: string);
begin
  LimparMsgTela;

  {$WARN SYMBOL_PLATFORM OFF}
  if DebugHook <> 0 then
    Exit;
  {$WARN SYMBOL_PLATFORM ON}

  Self.Enabled := False;
  frmAtualizacao := TfrmAtualizacao.Create(nil);
  frmAtualizacao.lblTexto.Caption := vpMsg;
  frmAtualizacao.Show;

  Application.ProcessMessages;
end;

procedure TfrmTarefaAgendada.Pesquisar;
begin
  PesquisarLembretes(
    StrToInt(vgUsuarioID),
    vgId,
    RetornarPrimeiroDia,
    RetornarUltimoDia,
    RetornarSituacao,
    RetornarGrupo,
    RetornarAssunto);
end;

procedure TfrmTarefaAgendada.btnAlterarTarefaClick(Sender: TObject);
var
  viResposta: Integer;
  viFrmCadastroRapidoTarefa: TfrmCadastroRapidoTarefa;
  viFrmCadastroSubTarefa: TfrmCadastroSubTarefa;
begin
  if TFrmInputRadiogroup.InputBoxRadioGroup(
    'Informe',
    'Tipo de alteração?',
    ['Tarefa', 'Sub-tarefa'],
    viResposta) then
  begin
    if viResposta = 0 then
    begin
      TfrmCadastroRapidoTarefa.AbrirCadastroRapido(
        tblLembreteTAREFA_ID.AsInteger);
    end
    else
    begin
      viFrmCadastroSubTarefa := TfrmCadastroSubTarefa.Create(nil);
      try
        viFrmCadastroSubTarefa.vlTarefaItemId := tblLembreteTAREFA_ITEM_ID.AsInteger;
        viFrmCadastroSubTarefa.ShowModal;
      finally
        FreeAndNil(viFrmCadastroSubTarefa);
      end;
    end;

    Pesquisar;
  end;
end;

procedure TfrmTarefaAgendada.btnExcluirTafefaClick(Sender: TObject);
var
  viResposta: Integer;
  viFrmCadastroRapidoTarefa: TfrmCadastroRapidoTarefa;
  viFrmCadastroSubTarefa: TfrmCadastroSubTarefa;
  viMensagem: String;
begin
  if TFrmInputRadiogroup.InputBoxRadioGroup(
    'Informe',
    'Selecione o que deseja excluir?',
    ['Tarefa', 'Sub-tarefa'],
    viResposta) then
  begin
    if viResposta = 0 then
    begin
      if not TTarefaProcessos.ExcluirTarefa(
        tblLembreteTAREFA_ID.AsInteger,
        viMensagem) then
        TMensagemUtils.ExibirMensagemErro(
          viMensagem);
    end
    else
    begin
      if not TTarefaProcessos.ExcluirTarefaItem(
        tblLembreteTAREFA_ITEM_ID.AsInteger,
        False,
        False,
        viMensagem) then
        TMensagemUtils.ExibirMensagemErro(
          viMensagem);
    end;

    Pesquisar;
  end;
end;

procedure TfrmTarefaAgendada.btnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmTarefaAgendada.btnIncluirTarefaClick(Sender: TObject);
var
  viDataInicial: TDateTime;
  viHoraInicial: TTime;
begin
  viDataInicial := dtmControles.DataHoraBanco(3);
  viHoraInicial := StrToTime('12:00:00');

  IncluirTarefa(
    'D',
    viDataInicial,
    viHoraInicial);
end;

procedure TfrmTarefaAgendada.BtnLimparClick(Sender: TObject);
begin
  LimparFiltros;
end;

procedure TfrmTarefaAgendada.BtnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmTarefaAgendada.btnTarefaGrupoLimparClick(Sender: TObject);
begin
  lcxTarefaGrupo.ItemIndex := 0;
end;

procedure TfrmTarefaAgendada.CarregarFiltros;
begin
  PreencherGrupo;
  PreencherSituacao;
end;

function TfrmTarefaAgendada.RetornarSituacao: string;
begin
    if LcbSituacao.ItemIndex > 0 then
    Result := Copy(LcbSituacao.EditText, 0, 1)
  else
    Result := '';
end;

procedure TfrmTarefaAgendada.cbxTarefasRealizadasClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TfrmTarefaAgendada.OrganizarFiltros;

  procedure AjustarSituacao(
    const vpEnabled: Boolean;
    const vpIndex: Integer);
  begin
    LcbSituacao.ItemIndex := vpIndex;
    LcbSituacao.Enabled := vpEnabled;
  end;

  procedure AjustarPeriodo(
    const vpEnabled: Boolean;
    const vpDataInicial: TDateTime;
    const vpDataFinal: TDateTime);
  begin
    DteDataInicial.Enabled := vpEnabled;
    DteDataFinal.Enabled := vpEnabled;

    if vpDataInicial > 0 then
      DteDataInicial.Date := vpDataInicial
    else
      DteDataInicial.Clear;

    if vpDataFinal > 0 then
      DteDataFinal.Date := vpDataFinal
    else
      DteDataFinal.Clear;
  end;

begin
  case tbcLembrete.TabIndex of
    0: // Todas
    begin
      AjustarSituacao(False, 0);
      AjustarPeriodo(False, 0, 0);
    end;
    1: // Vencidas
    begin
      AjustarSituacao(False, 1);
      AjustarPeriodo(False, 0, dtmControles.DataHoraBanco(3) - 1);
    end;
    2: // Hoje
    begin
      AjustarSituacao(True, 0);
      AjustarPeriodo(False, dtmControles.DataHoraBanco(3), dtmControles.DataHoraBanco(3));
    end;
    3: // 10 dias
    begin
      AjustarSituacao(True, 0);
      AjustarPeriodo(False, dtmControles.DataHoraBanco(3), IncDay(dtmControles.DataHoraBanco(3), 10));
    end;
    4: // 1 mês
    begin
      AjustarSituacao(True, 0);
      AjustarPeriodo(False, dtmControles.DataHoraBanco(3), IncMonth(dtmControles.DataHoraBanco(3), 1));
    end;
    5: // 3 meses
    begin
      AjustarSituacao(True, 0);
      AjustarPeriodo(False, dtmControles.DataHoraBanco(3), IncMonth(dtmControles.DataHoraBanco(3), 3));
    end;
    6: // 6 meses
    begin
      AjustarSituacao(True, 0);
      AjustarPeriodo(False, dtmControles.DataHoraBanco(3), IncMonth(dtmControles.DataHoraBanco(3), 6));
    end;
    7: // 1 ano
    begin
      AjustarSituacao(True, 0);
      AjustarPeriodo(False, dtmControles.DataHoraBanco(3), IncYear(dtmControles.DataHoraBanco(3), 1));
    end
    else // Personalizado
    begin
      AjustarSituacao(True, 0);
      AjustarPeriodo(True, dtmControles.DataHoraBanco(3), dtmControles.DataHoraBanco(3));
    end;
  end;
end;

procedure TfrmTarefaAgendada.dateNavigatorPeriodChanged(Sender: TObject; const AStart, AFinish: TDateTime);
begin
  FPrimeiroDia := 0;
  FUltimoDia := 0;
//  dateNavigator.SelectedDays.Clear;

  Pesquisar;
end;

procedure TfrmTarefaAgendada.dateNavigatorSelectionChanged(
  Sender: TObject; const AStart, AFinish: TDateTime);
begin
  FPrimeiroDia := AStart;
  FUltimoDia := AFinish;

  Pesquisar;
end;

procedure TfrmTarefaAgendada.FormClose(
  Sender: TObject;
  var Action: TCloseAction
);
begin
  Action := caFree;
  frmTarefaAgendada := nil;
end;

procedure TfrmTarefaAgendada.FormCreate(Sender: TObject);
begin
  OrganizarFiltros;
  CarregarFiltros;
  LimparFiltros;
end;

procedure TfrmTarefaAgendada.FormShow(Sender: TObject);
begin
  TTarefaProcessos.GravarVisualizacaoTarefa(
    StrToInt(vgUsuarioID),
    dtmControles.DataHoraBanco(3));

  tbcLembrete.TabIndex := 2;

  Pesquisar;
end;

procedure TfrmTarefaAgendada.grdLembreteDBTableViewCustomDrawCell(
  Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  viColuna: TcxGridDBColumn;
  viDataAtual: TDateTime;
  viDataFinal: TDateTime;
  viSituacao: String;
begin
  viDataAtual := StartOfTheDay(dtmControles.DataHoraBanco(3));

  viColuna := (Sender as TcxGridDBTableView).GetColumnByFieldName('DATA_FINAL');
  viDataFinal := StartOfTheDay(VarToDateTime(AViewInfo.RecordViewInfo.GridRecord.Values[viColuna.Index]));

  viColuna := (Sender as TcxGridDBTableView).GetColumnByFieldName('SITUACAO');
  viSituacao := AViewInfo.RecordViewInfo.GridRecord.Values[viColuna.Index];

  if viSituacao = 'R' then
  begin
    // Tarefas realizadas
    ACanvas.Font.Color := shpTarefasRealizadas.Brush.Color;
  end
  else if viSituacao = 'C' then
  begin
    // Tarefas canceladas
    ACanvas.Font.Color := ShpTarefasCanceladas.Brush.Color;
  end
  else if viDataFinal < viDataAtual then
  begin
    // Tarefas vencidas
    ACanvas.Font.Color := shpTarefasVencidas.Brush.Color;
  end
  else if viDataFinal = viDataAtual then
  begin
    // Tarefas que vencem hoje
    ACanvas.Font.Color := ShpTarefasVencemHoje.Brush.Color;
  end
  else if (viDataFinal >= IncDay(viDataAtual, 1)) and (viDataFinal <= IncDay(viDataAtual, 3)) then
  begin
    // Tarefas a vencer até 3 dias
    ACanvas.Font.Color := ShpTarefasVencer3Dias.Brush.Color;
  end
  else if (viDataFinal > IncDay(viDataAtual, 3)) and (viDataFinal <= IncDay(viDataAtual, 10)) then
  begin
    // Tarefas a vencer até 10 dias
    ACanvas.Font.Color := ShpTarefasVencer10Dias.Brush.Color;
  end
  else if viDataFinal > viDataAtual then
  begin
    // Outras tarefas
    ACanvas.Font.Color := ShpOutrasTarefas.Brush.Color;
  end;
end;

procedure TfrmTarefaAgendada.IncluirTarefa(
  const vpTipoPeriodo: string;
  const vpDataInicial: TDatetime;
  const vpHoraInicial: TDatetime);
begin
  TfrmCadastroRapidoTarefa.AbrirCadastroRapido(
    0,
    vpTipoPeriodo,
    vpDataInicial,
    vpHoraInicial);

  Pesquisar;
end;

procedure TfrmTarefaAgendada.LimparFiltros;
begin
  lcxTarefaGrupo.ItemIndex := 0;
  LcbSituacao.ItemIndex := 0;
  EdtAssunto.Clear;
  DteDataInicial.Date := dtmControles.DataHoraBanco(3);
  DteDataFinal.Date := dtmControles.DataHoraBanco(3);
end;

procedure TfrmTarefaAgendada.LimparMsgTela;
begin
  Self.Enabled := True;

  if Assigned(frmAtualizacao) then
    FreeAndNil(frmAtualizacao);
end;

procedure TfrmTarefaAgendada.mniCancelarTarefaClick(Sender: TObject);
const
  ciSituacao = 'C';
var
  viDescMensagem: string;
  viMotivo: string;
begin
  if tblLembreteTAREFA_ITEM_ID.AsInteger <= 0 then
    Exit;

  viMotivo := InputBox('Informe', 'Motivo do cancelamento', '');

  if not TTarefaProcessos.ProcessarTarefaItem(
    tblLembreteTAREFA_ITEM_ID.AsInteger,
    ciSituacao,
    viMotivo,
    viDescMensagem) then
  begin
    TMensagemUtils.ExibirMensagemErro(viDescMensagem);
    Exit;
  end;

  Pesquisar;
end;

procedure TfrmTarefaAgendada.mniConcluirTarefaClick(Sender: TObject);
const
  ciSituacao = 'R';
var
  viDescMensagem: string;
begin
  if tblLembreteTAREFA_ITEM_ID.AsInteger <= 0 then
    Exit;

  if not TTarefaProcessos.ProcessarTarefaItem(
    tblLembreteTAREFA_ITEM_ID.AsInteger,
    ciSituacao,
    '',
    viDescMensagem) then
  begin
    TMensagemUtils.ExibirMensagemErro(viDescMensagem);
    Exit;
  end;

  Pesquisar;
end;

procedure TfrmTarefaAgendada.mniDesfazerTarefaClick(Sender: TObject);
const
  ciSituacao = 'A';
var
  viDescMensagem: string;
begin
  if tblLembreteTAREFA_ITEM_ID.AsInteger <= 0 then
    Exit;

  if not TTarefaProcessos.ProcessarTarefaItem(
    tblLembreteTAREFA_ITEM_ID.AsInteger,
    ciSituacao,
    '',
    viDescMensagem) then
  begin
    TMensagemUtils.ExibirMensagemErro(viDescMensagem);
    Exit;
  end;

  Pesquisar;
end;

procedure TfrmTarefaAgendada.ppmLembretePopup(Sender: TObject);
begin
  mniConcluirTarefa.Visible := (tblLembreteTAREFA_ITEM_ID.AsInteger > 0) and (tblLembreteSITUACAO.AsString = 'A');
  mniCancelarTarefa.Visible := (tblLembreteTAREFA_ITEM_ID.AsInteger > 0) and (tblLembreteSITUACAO.AsString = 'A');
  mniDesfazerTarefa.Visible := (tblLembreteTAREFA_ITEM_ID.AsInteger > 0) and ((tblLembreteSITUACAO.AsString = 'R') or (tblLembreteSITUACAO.AsString = 'C'));
end;

procedure TfrmTarefaAgendada.PreencherGrupo;
const
  CI_METODO_TEXTO = 'Aguarde... Preenchendo os grupos';
var
  viListaTarefaGrupo: TList<TTarefaGrupo>;
  viTarefaGrupo: TTarefaGrupo;
begin
  tblTarefaGrupo.Open;
  tblTarefaGrupo.EmptyDataSet;

  viListaTarefaGrupo := nil;
  try
    viListaTarefaGrupo := TTarefaGrupoController.Consultar(
      vgId);

    if (viListaTarefaGrupo  = nil)
    or (viListaTarefaGrupo.Count <= 0) then
      Exit;

    AtualizaMsgTela(CI_METODO_TEXTO);

    tblTarefaGrupo.BeginBatch;
    try
      for viTarefaGrupo in viListaTarefaGrupo do
      begin
        if AnsiUpperCase(viTarefaGrupo.Situacao) <> 'A' then
          Continue;

        tblTarefaGrupo.AppendRecord([
            { TAREFA_GRUPO_ID } viTarefaGrupo.TarefaGrupoId,
            { DESCRICAO       } viTarefaGrupo.Descricao,
            { SITUACAO        } viTarefaGrupo.Situacao,
            { SERVENTIA       } viTarefaGrupo.Serventia]);

        AtualizaMsgTela(CI_METODO_TEXTO);
      end;

    finally
      tblTarefaGrupo.EndBatch;
      LimparMsgTela;
    end;

  finally
    FreeAndNil(viListaTarefaGrupo);
  end;
end;

procedure TfrmTarefaAgendada.PesquisarLembretes(
  const vpUsuarioId: Integer;
  const vpSistemaId: Integer;
  const vpDataInicial: TDateTime;
  const vpDataFinal: TDateTime;
  const vpSituacao: String;
  const vpGrupo: Integer;
  const vpAssunto: String);
const
  CI_METODO_TEXTO = 'Aguarde... Preenchendo os lembretes';
var
  viTblTarefas: TDataSet;
begin
  tblLembrete.Open;
  tblLembrete.EmptyDataSet;

  viTblTarefas := TTarefaProcessos.BuscarTarefas(
    vpUsuarioId,
    vpSistemaId,
    vpDataInicial,
    vpDataFinal);

  AtualizaMsgTela(CI_METODO_TEXTO);

  tblLembrete.BeginBatch;
  try
    viTblTarefas.First;
    while not viTblTarefas.Eof do
    begin
      if Trim(vpSituacao) <> '' then
      begin
        if viTblTarefas.FieldByName('G_TI_SITUACAO').AsString <> vpSituacao then
        begin
          viTblTarefas.Next;
          Continue;
        end;
      end;

      tblLembrete.AppendRecord([
        { TAREFA_ID         } viTblTarefas.FieldByName('G_TF_TAREFA_ID').AsInteger,
        { TAREFA_ITEM_ID    } viTblTarefas.FieldByName('G_TI_TAREFA_ITEM_ID').AsInteger,
        { ASSUNTO           } viTblTarefas.FieldByName('G_TF_ASSUNTO').AsString,
        { MENSAGEM          } DeCompressString(AnsiString(viTblTarefas.FieldByName('G_TF_MENSAGEM').AsString)),
        { DATA_INICIAL      } viTblTarefas.FieldByName('G_TI_DATA_HORA_INICIAL').AsDateTime,
        { DATA_FINAL        } viTblTarefas.FieldByName('G_TI_DATA_HORA_FINAL').AsDateTime,
        { SITUACAO          } viTblTarefas.FieldByName('G_TI_SITUACAO').AsString,
        { PERCENTUAL        } viTblTarefas.FieldByName('G_TI_PERCENTUAL').AsCurrency,
        { MOTIVO            } viTblTarefas.FieldByName('G_TI_MOTIVO').AsString]);

      AtualizaMsgTela(CI_METODO_TEXTO);

      viTblTarefas.Next;
    end;

    tblLembrete.IndexFieldNames := 'DATA_FINAL';

  finally
    tblLembrete.EndBatch;
    viTblTarefas.Close;
    FreeAndNil(viTblTarefas);
    LimparMsgTela;
  end;
end;

procedure TfrmTarefaAgendada.PreencherSituacao;
begin
  LcbSituacao.Properties.Items.Clear;
  LcbSituacao.Properties.Items.Add('Todos');
  LcbSituacao.Properties.Items.Add('Aguardando');
  LcbSituacao.Properties.Items.Add('Realizado');
  LcbSituacao.Properties.Items.Add('Cancelado');
end;

function TfrmTarefaAgendada.RetornarAssunto: string;
begin
  Result := Trim(EdtAssunto.Text);
end;

function TfrmTarefaAgendada.RetornarGrupo: Integer;
begin
  if lcxTarefaGrupo.ItemIndex = 0 then
    Result := 0
  else
    Result := tblTarefaGrupoTAREFA_GRUPO_ID.AsInteger;
end;

function TfrmTarefaAgendada.RetornarPrimeiroDia: TDateTime;
begin
  if VarIsNull(DteDataInicial.EditValue) then
    Result := 0
  else
    Result := StartOfTheDay(DteDataInicial.Date);
end;

function TfrmTarefaAgendada.RetornarUltimoDia: TDateTime;
begin
  if VarIsNull(DteDataFinal.EditValue) then
    Result := 0
  else
    Result := EndOfTheDay(DteDataFinal.Date);
end;

procedure TfrmTarefaAgendada.tbcLembreteChange(Sender: TObject);
begin
  OrganizarFiltros;
  Pesquisar;
end;

end.
