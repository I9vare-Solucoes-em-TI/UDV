unit CadastroRapidoTarefa;

interface

uses
  Classes,
  Controls,
  cxButtons,
  cxCalendar,
  cxCheckBox,
  cxClasses,
  cxContainer,
  cxControls,
  cxCustomData,
  cxData,
  cxDataStorage,
  cxDBData,
  cxDBEdit,
  cxDBLookupComboBox,
  cxDBLookupEdit,
  cxDBRichEdit,
  cxDropDownEdit,
  cxEdit,
  cxEditRepositoryItems,
  cxFilter,
  cxGraphics,
  cxGrid,
  cxGridCustomTableView,
  cxGridCustomView,
  cxGridDBTableView,
  cxGridLevel,
  cxGridTableView,
  cxGroupBox,
  cxImageComboBox,
  cxLabel,
  cxLookAndFeelPainters,
  cxLookAndFeels,
  cxLookupEdit,
  cxMaskEdit,
  cxMemo,
  cxNavigator,
  cxPC,
  cxRadioGroup,
  cxRichEdit,
  cxSpinEdit,
  cxStyles,
  cxTextEdit,
  cxTimeEdit,
  Data.DB,
  Datasnap.DBClient,
  Datasnap.Provider,
  Dialogs,
  dxBarBuiltInMenu,
  dxGDIPlusClasses,
  dxSkinMcSkin,
  dxSkinOffice2007Black,
  dxSkinOffice2007Blue,
  dxSkinOffice2007Green,
  dxSkinOffice2007Pink,
  dxSkinOffice2007Silver,
  dxSkinsCore,
  dxSkinscxPCPainter,
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
  Forms,
  Graphics,
  I9Query,
  Messages,
  System.UITypes,
  SysUtils,
  Variants,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Menus,
  Vcl.StdCtrls,
  Windows;

type
  TArrayOfInteger = array of Integer;

  TfrmCadastroRapidoTarefa = class(TForm)
    btnAdicionarResponsavel: TcxButton;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    btnExcluirResponsavel: TcxButton;
    btnLimpar: TcxButton;
    btnRepetirDomingo: TSpeedButton;
    btnRepetirQuarta: TSpeedButton;
    btnRepetirQuinta: TSpeedButton;
    btnRepetirSabado: TSpeedButton;
    btnRepetirSegunda: TSpeedButton;
    btnRepetirSexta: TSpeedButton;
    btnRepetirTerca: TSpeedButton;
    btnTarefaGrupoAdicionar: TcxButton;
    btnTarefaGrupoExcluir: TcxButton;
    cxGridDBColumn1: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxTabSheet1: TcxTabSheet;
    dtaDataFinal: TcxDBDateEdit;
    dtaDataInicial: TcxDBDateEdit;
    dteTerminoData: TcxDBDateEdit;
    dtmHoraFinal: TcxDBTimeEdit;
    dtmHoraInicial: TcxDBTimeEdit;
    dtsRespLigacao: TDataSource;
    dtsResponsavel: TDataSource;
    dtsTarefaGrupo: TDataSource;
    edtAssunto: TcxDBTextEdit;
    grdLevelResponsaveis: TcxGridLevel;
    grdResponsaveis: TcxGrid;
    grdTableViewResponsaveis: TcxGridDBTableView;
    icxServentia: TcxDBImageComboBox;
    icxSomenteDiaUtil: TcxDBImageComboBox;
    icxTipoPeriodo: TcxDBImageComboBox;
    Image1: TImage;
    lblAssunto: TcxLabel;
    lblMensagem: TcxLabel;
    lblRepetir: TcxLabel;
    lblServentia: TcxLabel;
    lblSomenteDiaUtil: TcxLabel;
    lblTarefaGrupo: TcxLabel;
    lblTerminoOcorrencias: TcxLabel;
    lblTipoPeriodo: TcxLabel;
    lcxResponsavel: TcxLookupComboBox;
    lcxTarefaGrupo: TcxDBLookupComboBox;
    Panel1: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    pgcTarefa: TcxPageControl;
    pnlDados: TPanel;
    pnlDiasSemana: TPanel;
    pnlRepetirDomingo: TPanel;
    pnlRepetirQuarta: TPanel;
    pnlRepetirQuinta: TPanel;
    pnlRepetirSabado: TPanel;
    pnlRepetirSegunda: TPanel;
    pnlRepetirSexta: TPanel;
    pnlRepetirTerca: TPanel;
    rdtMensagem: TcxDBRichEdit;
    rgpTermino: TcxDBRadioGroup;
    ShpRepetirDomingo: TShape;
    shpRepetirQuarta: TShape;
    shpRepetirQuinta: TShape;
    shpRepetirSabado: TShape;
    shpRepetirSegunda: TShape;
    shpRepetirSexta: TShape;
    shpRepetirTerca: TShape;
    shpResponsavel: TShape;
    speTerminoOcorrencias: TcxDBSpinEdit;
    sqlRespLigacao: TI9Query;
    sqlRespLigacaoNOME_COMPLETO: TStringField;
    sqlRespLigacaoUSUARIO_ID: TBCDField;
    sqlResponsavel: TI9Query;
    sqlResponsavelFUNCAO: TStringField;
    sqlResponsavelNOME_COMPLETO: TStringField;
    sqlResponsavelUSUARIO_ID: TBCDField;
    sqlTarefaGrupo: TI9Query;
    sqlTarefaGrupoDESCRICAO: TStringField;
    sqlTarefaGrupoSERVENTIA: TBCDField;
    sqlTarefaGrupoSITUACAO: TStringField;
    sqlTarefaGrupoTAREFA_GRUPO_ID: TBCDField;
    sqlTarefa: TI9Query;
    sqlTarefaTAREFA_ID: TBCDField;
    sqlTarefaUSUARIO_ID: TBCDField;
    sqlTarefaPRAZO_DATA_FINAL: TSQLTimeStampField;
    sqlTarefaPRAZO_DATA_LIMITE: TSQLTimeStampField;
    sqlTarefaPRAZO_HORA_LIMITE: TSQLTimeStampField;
    sqlTarefaSITUACAO: TStringField;
    sqlTarefaDESCRICAO: TStringField;
    sqlTarefaNOTAS: TBlobField;
    sqlTarefaPERIODO_TIPO: TStringField;
    sqlTarefaTAREFA_GRUPO_ID: TBCDField;
    sqlTarefaREALIZADO_TEMPO: TSQLTimeStampField;
    sqlTarefaREALIZADO_DATA: TSQLTimeStampField;
    sqlTarefaREALIZADO_OBSERVACAO: TStringField;
    sqlTarefaDATA_CADASTRO: TSQLTimeStampField;
    sqlTarefaREPETIR: TStringField;
    sqlTarefaSERVENTIA: TBCDField;
    sqlTarefaPRINCIPAL: TStringField;
    sqlTarefaASSUNTO: TStringField;
    sqlTarefaMENSAGEM: TBlobField;
    sqlTarefaPERCENTUAL: TBCDField;
    sqlTarefaDATA_INICIAL: TSQLTimeStampField;
    sqlTarefaHORA_INICIAL: TSQLTimeStampField;
    sqlTarefaDATA_FINAL: TSQLTimeStampField;
    sqlTarefaHORA_FINAL: TSQLTimeStampField;
    sqlTarefaREPETIR_SEGUNDA: TStringField;
    sqlTarefaREPETIR_TERCA: TStringField;
    sqlTarefaREPETIR_QUARTA: TStringField;
    sqlTarefaREPETIR_QUINTA: TStringField;
    sqlTarefaREPETIR_SEXTA: TStringField;
    sqlTarefaREPETIR_SABADO: TStringField;
    sqlTarefaREPETIR_DOMINGO: TStringField;
    sqlTarefaTERMINO_DATA: TSQLTimeStampField;
    sqlTarefaTERMINO_OCORRENCIAS: TBCDField;
    sqlTarefaTIPO_TERMINO: TStringField;
    sqlTarefaSOMENTE_DIA_UTIL: TStringField;
    dsrTarefa: TDataSource;

    procedure btnAdicionarResponsavelClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcluirResponsavelClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnRepetirDomingoClick(Sender: TObject);
    procedure btnRepetirQuartaClick(Sender: TObject);
    procedure btnRepetirQuintaClick(Sender: TObject);
    procedure btnRepetirSabadoClick(Sender: TObject);
    procedure btnRepetirSegundaClick(Sender: TObject);
    procedure btnRepetirSextaClick(Sender: TObject);
    procedure btnRepetirTercaClick(Sender: TObject);
    procedure btnSelecionarTarefaGrupoClick(Sender: TObject);
    procedure btnTarefaGrupoAdicionarClick(Sender: TObject);
    procedure btnTarefaGrupoExcluirClick(Sender: TObject);
    procedure ClientAncestralAfterOpen(DataSet: TDataSet);
    procedure dtaDataInicialExit(Sender: TObject);
    procedure dtaDataInicialPropertiesChange(Sender: TObject);
    procedure dtmHoraInicialExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ibxSistemaPropertiesChange(Sender: TObject);
    procedure icxTipoPeriodoPropertiesChange(Sender: TObject);
    procedure lcxTarefaGrupoExit(Sender: TObject);
    procedure rgpTerminoPropertiesChange(Sender: TObject);

  private
    vlTarefaId: Integer;
    vlTipoPeriodo: string;
    vlDataInicial: TDatetime;
    vlHoraInicial: TTime;

    function MontarListaUsuarios: TArrayOfInteger;

    procedure controlarTipoPeriodo;

    procedure DesmarcarDia(
      vpShp: TShape;
      vpBtn: TSpeedButton);

    procedure DesmarcarTodosDias;

    procedure MarcarApenasDiaSemana(
      const vpData: TDateTime);

    procedure MarcarDesmarcarDia(
      vpShp: TShape;
      vpBtn: TSpeedButton);

    procedure MarcarDia(
      vpShp: TShape;
      vpBtn: TSpeedButton);

    procedure MarcarTodosDias;

    procedure PreencherDataSetDiasSemana;

    procedure PreencherDiasSemana;

    procedure PreencherResponsaveis(
      const vpTarefaId: Integer);

    procedure PreencherSistemas;

    procedure PreencherTarefaGrupo;

    procedure VerificarDiasSemana;

  public

    class function AbrirCadastroRapido(
      const vpTarefaId: Integer;
      const vpTipoPeriodo: string = '';
      const vpDataInicial: TDatetime = 0;
      const vpHoraInicial: TTime = 0): Integer;

  end;

implementation

uses
  Cadastro,
  Controles,
  Lookup,
  MensagemUtils,
  Rotinas,
  System.DateUtils,
  TarefaGrupo,
  TarefaProcessos;

{$R *.dfm}

class function TfrmCadastroRapidoTarefa.AbrirCadastroRapido(
  const vpTarefaId: Integer;
  const vpTipoPeriodo: string;
  const vpDataInicial: TDatetime;
  const vpHoraInicial: TTime): Integer;
var
  viFrmCadastroRapidoTarefa: TFrmCadastroRapidoTarefa;
begin
  Result := 0;

  viFrmCadastroRapidoTarefa := nil;
  try
    viFrmCadastroRapidoTarefa := TFrmCadastroRapidoTarefa.Create(nil);

    viFrmCadastroRapidoTarefa.vlTarefaId := vpTarefaId;
    viFrmCadastroRapidoTarefa.vlTipoPeriodo := vpTipoPeriodo;
    viFrmCadastroRapidoTarefa.vlDataInicial := vpDataInicial;
    viFrmCadastroRapidoTarefa.vlHoraInicial := vpHoraInicial;

    if viFrmCadastroRapidoTarefa.ShowModal = mrOk then
    begin
      Result := viFrmCadastroRapidoTarefa.sqlTarefaTAREFA_ID.AsInteger;
      Exit;
    end;

  finally
    FreeAndNil(viFrmCadastroRapidoTarefa);
  end;
end;

procedure TfrmCadastroRapidoTarefa.btnAdicionarResponsavelClick(
  Sender: TObject);
begin
  inherited;
  if sqlRespLigacao.Locate('USUARIO_ID', sqlResponsavelUSUARIO_ID.AsInteger) then
    Exit;

  sqlRespLigacao.Insert;
  sqlRespLigacaoUSUARIO_ID.AsInteger := sqlResponsavelUSUARIO_ID.AsInteger;
  sqlRespLigacaoNOME_COMPLETO.AsString := sqlResponsavelNOME_COMPLETO.AsString;
  sqlRespLigacao.Post;
end;

procedure TfrmCadastroRapidoTarefa.btnCancelarClick(Sender: TObject);
begin
  Self.ModalResult := mrCancel;
end;

procedure TfrmCadastroRapidoTarefa.btnConfirmarClick(
  Sender: TObject);
var
  viDescMensagem: string;
  viMensagem: TStringStream;
  viListaUsuarioId: TArrayOfInteger;
  viDataInicial: TDateTime;
  viDataFinal: TDateTime;
  viHoraInicial: TTime;
  viHoraFinal: TTime;
  viTarefaId: Integer;
begin
  VerificarPreenchimentoICX_DB(icxServentia.Text,      'Serventia',          icxServentia);
  VerificarPreenchimentoLCX_DB(lcxTarefaGrupo.Text,    'Grupo da Tarefa',    lcxTarefaGrupo);
  VerificarPreenchimentoEDT_DB(edtAssunto.Text,        'Assunto',            edtAssunto);
  VerificarPreenchimentoICX_DB(icxTipoPeriodo.Text,    'Tipo do Período',    icxTipoPeriodo);
  VerificarPreenchimentoDTA_DB(dtaDataInicial.Text,    'Data Inicial',       dtaDataInicial);
  VerificarPreenchimentoTIME_DB(dtmHoraInicial.Text,   'Hora Inicial',       dtmHoraInicial);

  if dtaDataFinal.Visible then
    VerificarPreenchimentoDTA_DB(dtaDataFinal.Text,    'Data Final',         dtaDataFinal);

  VerificarPreenchimentoTIME_DB(dtmHoraFinal.Text,     'Hora Final',         dtmHoraFinal);
  VerificarPreenchimentoICX_DB(icxSomenteDiaUtil.Text, 'Somente dias úteis', icxSomenteDiaUtil);

  if sqlTarefaTAREFA_ID.AsInteger > 0 then
  begin
    if not TMensagemUtils.ExibirMensagemPergunta(
      'Esta gravação irá recriar todas as sub-tarefas vinculadas!' + sLineBreak +
      'Deseja realmente continuar?',
      False) then
      Abort;
  end;

  viDataInicial :=
    StrToDateTime(
      FormatDateTime('dd/MM/yyyy', dtaDataInicial.Date) +
      ' ' +
      FormatDateTime('hh:mm:ss', dtmHoraInicial.Time));

  if dtaDataFinal.Visible then
  begin
    viDataFinal :=
      StrToDateTime(
        FormatDateTime('dd/MM/yyyy', dtaDataFinal.Date) +
          ' ' +
          FormatDateTime('hh:mm:ss', dtmHoraInicial.Time));

    if viDataFinal < viDataInicial then
    begin
      TMensagemUtils.ExibirMensagemErro(
        'Data final deve ser maior ou igual que a data inicial');

      dtaDataFinal.SetFocus;
      Abort;
    end;
  end
  else
  begin
    viHoraInicial := dtmHoraInicial.Time;
    viHoraFinal := dtmHoraFinal.Time;

    if viHoraFinal < viHoraInicial then
    begin
      TMensagemUtils.ExibirMensagemErro(
        'Hora final deve ser maior ou igual que a hora inicial');

      dtmHoraFinal.SetFocus;
      Abort;
    end;
  end;

  if icxTipoPeriodo.EditingValue = 'D' then
    VerificarDiasSemana;

  if rgpTermino.EditingValue = 'E' then
    VerificarPreenchimentoDTA_DB(dteTerminoData.Text, '"Repetição termina em"', dteTerminoData)
  else if rgpTermino.EditingValue = 'A' then
  begin
    if speTerminoOcorrencias.EditingValue <= 0 then
    begin
      TMensagemUtils.ExibirMensagemAtencao(
        'Campo "Repetição termina em" com valor inválido!');

      speTerminoOcorrencias.SetFocus;
      Abort;
    end;
  end;

  if sqlRespLigacao.IsEmpty then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Responsável deve ser informado!');

    lcxResponsavel.SetFocus;
    Abort;
  end;

  if sqlTarefaTAREFA_ID.AsInteger <= 0 then
  begin
    sqlTarefaTAREFA_ID.AsInteger := dtmControles.GerarSequencia('G_TAREFA');
    sqlTarefaSITUACAO.AsString := 'A'; // Aguardando
  end;

  sqlTarefaMENSAGEM.AsString := String(CompressString(AnsiString(rdtMensagem.Text)));

  if not (sqlTarefa.State in [dsInsert, dsEdit]) then
    sqlTarefa.Edit;

  sqlTarefaUSUARIO_ID.AsInteger := StrToIntDef(vgUsuarioId, 0);

  PreencherDataSetDiasSemana;

  if not sqlTarefaMENSAGEM.IsNull then
  begin
    viMensagem := TStringStream.Create;
    TBlobField(sqlTarefaMENSAGEM).SaveToStream(viMensagem);
    viMensagem.Position := 0;
  end
  else
    viMensagem := nil;

  viListaUsuarioId := MontarListaUsuarios;

  viTarefaId := sqlTarefaTAREFA_ID.AsInteger;

  if not TTarefaProcessos.ProcessarTarefa(
    viTarefaId,
    sqlTarefaSERVENTIA.AsInteger,
    sqlTarefaTAREFA_GRUPO_ID.AsInteger,
    sqlTarefaUSUARIO_ID.AsInteger,
    sqlTarefaASSUNTO.AsString,
    viMensagem,
    sqlTarefaDATA_CADASTRO.AsDateTime,
    sqlTarefaSITUACAO.AsString,
    sqlTarefaPERCENTUAL.AsCurrency,
    sqlTarefaDATA_INICIAL.AsDateTime,
    sqlTarefaHORA_INICIAL.AsDateTime,
    sqlTarefaDATA_FINAL.AsDateTime,
    sqlTarefaHORA_FINAL.AsDateTime,
    sqlTarefaPERIODO_TIPO.AsString,
    sqlTarefaREPETIR_SEGUNDA.AsString,
    sqlTarefaREPETIR_TERCA.AsString,
    sqlTarefaREPETIR_QUARTA.AsString,
    sqlTarefaREPETIR_QUINTA.AsString,
    sqlTarefaREPETIR_SEXTA.AsString,
    sqlTarefaREPETIR_SABADO.AsString,
    sqlTarefaREPETIR_DOMINGO.AsString,
    sqlTarefaTERMINO_DATA.AsDateTime,
    sqlTarefaTERMINO_OCORRENCIAS.AsInteger,
    rgpTermino.editvalue,
    sqlTarefaSOMENTE_DIA_UTIL.AsString,
    viListaUsuarioId,
    viDescMensagem) then
    TMensagemUtils.ExibirMensagemErro(
      viDescMensagem);

  Self.ModalResult := mrOk;
end;

procedure TfrmCadastroRapidoTarefa.btnExcluirResponsavelClick(
  Sender: TObject);
begin
  inherited;
  sqlResponsavel.Delete;
end;

procedure TfrmCadastroRapidoTarefa.btnFecharClick(
  Sender: TObject);
begin
  inherited;
  Self.Close;
end;

procedure TfrmCadastroRapidoTarefa.btnLimparClick(
  Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadastroRapidoTarefa.btnRepetirDomingoClick(
  Sender: TObject);
begin
  inherited;
  MarcarDesmarcarDia(ShpRepetirDomingo, btnRepetirDomingo);
end;

procedure TfrmCadastroRapidoTarefa.btnRepetirQuartaClick(
  Sender: TObject);
begin
  inherited;
  MarcarDesmarcarDia(shpRepetirQuarta, btnRepetirQuarta);
end;

procedure TfrmCadastroRapidoTarefa.btnRepetirQuintaClick(
  Sender: TObject);
begin
  inherited;
  MarcarDesmarcarDia(shpRepetirQuinta, btnRepetirQuinta);
end;

procedure TfrmCadastroRapidoTarefa.btnRepetirSabadoClick(
  Sender: TObject);
begin
  inherited;
  MarcarDesmarcarDia(shpRepetirSabado, btnRepetirSabado);
end;

procedure TfrmCadastroRapidoTarefa.btnRepetirSegundaClick(
  Sender: TObject);
begin
  inherited;
  MarcarDesmarcarDia(shpRepetirSegunda, btnRepetirSegunda);
end;

procedure TfrmCadastroRapidoTarefa.btnRepetirSextaClick(
  Sender: TObject);
begin
  inherited;
  MarcarDesmarcarDia(shpRepetirSexta, btnRepetirSexta);
end;

procedure TfrmCadastroRapidoTarefa.btnRepetirTercaClick(
  Sender: TObject);
begin
  inherited;
  MarcarDesmarcarDia(shpRepetirTerca, btnRepetirTerca);
end;

procedure TfrmCadastroRapidoTarefa.btnSelecionarTarefaGrupoClick(
  Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadastroRapidoTarefa.btnTarefaGrupoAdicionarClick(
  Sender: TObject);
begin
  inherited;
  vgPermissaoRotina := ValidarPermissao('CAD_TAREFA_GRUPO');
  ExibirFormulario(TfrmTarefaGrupo, frmTarefaGrupo, True);
  PreencherTarefaGrupo;
end;

procedure TfrmCadastroRapidoTarefa.btnTarefaGrupoExcluirClick(
  Sender: TObject);
begin
  inherited;
  sqlTarefaGrupo.Delete;
end;

procedure TfrmCadastroRapidoTarefa.ClientAncestralAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  PreencherDiasSemana;
end;

procedure TfrmCadastroRapidoTarefa.controlarTipoPeriodo;
begin
  if icxTipoPeriodo.EditingValue = 'D' then
  begin
    dtaDataInicial.Enabled := True;
    dtmHoraInicial.Enabled := True;
    dtaDataFinal.Enabled := False;
    dtmHoraFinal.Enabled := True;

    dtaDataFinal.Visible := False;
    dtmHoraFinal.Left := dtaDataFinal.Left;

    lblRepetir.Enabled := True;
    pnlDiasSemana.Enabled := True;
    rgpTermino.Enabled := True;

    MarcarTodosDias;
  end
  else if icxTipoPeriodo.EditingValue = 'S' then
  begin
    dtaDataInicial.Enabled := True;
    dtmHoraInicial.Enabled := True;
    dtaDataFinal.Enabled := False;
    dtmHoraFinal.Enabled := True;

    dtaDataFinal.Visible := False;
    dtmHoraFinal.Left := dtaDataFinal.Left;

    lblRepetir.Enabled := True;
    pnlDiasSemana.Enabled := False;
    rgpTermino.Enabled := True;

    marcarApenasDiaSemana(dtaDataInicial.Date);
  end
  else if icxTipoPeriodo.EditingValue = 'C' then
  begin
    dtaDataInicial.Enabled := True;
    dtmHoraInicial.Enabled := True;
    dtaDataFinal.Enabled := False;
    dtmHoraFinal.Enabled := True;

    dtaDataFinal.Visible := False;
    dtmHoraFinal.Left := dtaDataFinal.Left;

    lblRepetir.Enabled := False;
    pnlDiasSemana.Enabled := False;
    rgpTermino.Enabled := True;

    DesmarcarTodosDias;
  end
  else if icxTipoPeriodo.EditingValue = 'Q' then
  begin
    dtaDataInicial.Enabled := True;
    dtmHoraInicial.Enabled := True;
    dtaDataFinal.Enabled := False;
    dtmHoraFinal.Enabled := True;

    dtaDataFinal.Visible := False;
    dtmHoraFinal.Left := dtaDataFinal.Left;

    lblRepetir.Enabled := False;
    pnlDiasSemana.Enabled := False;
    rgpTermino.Enabled := True;

    DesmarcarTodosDias;
  end
  else if icxTipoPeriodo.EditingValue = 'M' then
  begin
    dtaDataInicial.Enabled := True;
    dtmHoraInicial.Enabled := True;
    dtaDataFinal.Enabled := False;
    dtmHoraFinal.Enabled := True;

    dtaDataFinal.Visible := False;
    dtmHoraFinal.Left := dtaDataFinal.Left;

    lblRepetir.Enabled := True;
    pnlDiasSemana.Enabled := True;
    rgpTermino.Enabled := True;

    MarcarTodosDias;
  end
  else if icxTipoPeriodo.EditingValue = 'T' then
  begin
    dtaDataInicial.Enabled := True;
    dtmHoraInicial.Enabled := True;
    dtaDataFinal.Enabled := False;
    dtmHoraFinal.Enabled := True;

    dtaDataFinal.Visible := False;
    dtmHoraFinal.Left := dtaDataFinal.Left;

    lblRepetir.Enabled := False;
    pnlDiasSemana.Enabled := False;
    rgpTermino.Enabled := True;

    DesmarcarTodosDias;
  end
  else if icxTipoPeriodo.EditingValue = 'R' then
  begin
    dtaDataInicial.Enabled := True;
    dtmHoraInicial.Enabled := True;
    dtaDataFinal.Enabled := False;
    dtmHoraFinal.Enabled := True;

    dtaDataFinal.Visible := False;
    dtmHoraFinal.Left := dtaDataFinal.Left;

    lblRepetir.Enabled := False;
    pnlDiasSemana.Enabled := False;
    rgpTermino.Enabled := True;

    DesmarcarTodosDias;
  end
  else if icxTipoPeriodo.EditingValue = 'A' then
  begin
    dtaDataInicial.Enabled := True;
    dtmHoraInicial.Enabled := True;
    dtaDataFinal.Enabled := False;
    dtmHoraFinal.Enabled := True;

    dtaDataFinal.Visible := False;
    dtmHoraFinal.Left := dtaDataFinal.Left;

    lblRepetir.Enabled := False;
    pnlDiasSemana.Enabled := False;
    rgpTermino.Enabled := True;

    DesmarcarTodosDias;
  end
  else
  begin
    dtaDataInicial.Enabled := True;
    dtmHoraInicial.Enabled := True;
    dtaDataFinal.Enabled := True;
    dtmHoraFinal.Enabled := True;

    dtaDataFinal.Visible := True;
    dtmHoraFinal.Left := dtaDataFinal.Left + dtaDataFinal.Width;

    lblRepetir.Enabled := False;
    pnlDiasSemana.Enabled := False;
    rgpTermino.Enabled := False;

    DesmarcarTodosDias;
  end;

  lblSomenteDiaUtil.Left := dtmHoraFinal.Left + dtmHoraFinal.Width + 4;
  icxSomenteDiaUtil.Left := lblSomenteDiaUtil.Left;
end;

procedure TfrmCadastroRapidoTarefa.DesmarcarDia(
  vpShp: TShape;
  vpBtn: TSpeedButton);
begin
  vpShp.Brush.Color := clSilver;
  vpBtn.Font.Color := clGray;
end;

procedure TfrmCadastroRapidoTarefa.DesmarcarTodosDias;
begin
  DesmarcarDia(ShpRepetirDomingo, btnRepetirDomingo);
  DesmarcarDia(shpRepetirSegunda, btnRepetirSegunda);
  DesmarcarDia(shpRepetirTerca,   btnRepetirTerca);
  DesmarcarDia(shpRepetirQuarta,  btnRepetirQuarta);
  DesmarcarDia(shpRepetirQuinta,  btnRepetirQuinta);
  DesmarcarDia(shpRepetirSexta,   btnRepetirSexta);
  DesmarcarDia(shpRepetirSabado,  btnRepetirSabado);
end;

procedure TfrmCadastroRapidoTarefa.dtaDataInicialExit(
  Sender: TObject);
var
  viDia: Word;
  viMes: Word;
  viAno: Word;
begin
  inherited;
  viDia := DayOf(dtaDataInicial.Date);
  viMes := MonthOf(dtaDataInicial.Date);
  viAno := YearOf(dtaDataInicial.Date);

  if icxTipoPeriodo.EditingValue = 'C' then // Decêndio
  begin
    if viDia >= 21 then
      viDia := DayOf(EndOfAMonth(viAno, viMes))
    else if viDia >= 11 then
      viDia := 20
    else
      viDia := 10;

    sqlTarefaDATA_INICIAL.AsDateTime := StrToDate(IntToStr(viDia) + '/' +
                                                  IntToStr(viMes) + '/' +
                                                  IntToStr(viAno));
  end
  else if icxTipoPeriodo.EditingValue = 'Q' then // Quinzena
  begin
    if viDia >= 1 then
      viDia := 1
    else if viDia >= 15 then
      viDia := 15;

    sqlTarefaDATA_INICIAL.AsDateTime := StrToDate(IntToStr(viDia) + '/' +
                                                  IntToStr(viMes) + '/' +
                                                  IntToStr(viAno));
  end;
end;

procedure TfrmCadastroRapidoTarefa.dtaDataInicialPropertiesChange(
  Sender: TObject);
var
  viData: TDateTime;
begin
  inherited;
  viData := 0;

  if icxTipoPeriodo.EditingValue = 'S' then
  begin
    try
      viData := dtaDataInicial.EditingValue;
    except
      // Ignorar o erro
    end;

    if viData > 0 then
      marcarApenasDiaSemana(viData)
    else
      DesmarcarTodosDias;
  end;
end;

procedure TfrmCadastroRapidoTarefa.dtmHoraInicialExit(Sender: TObject);
begin
  inherited;
  if not (sqlTarefa.State in dsEditModes) then
    Exit;

  if (dtmHoraInicial.EditValue <> null)
  and (dtmHoraFinal.Time = null) then
    sqlTarefaHORA_FINAL.AsDateTime := sqlTarefaHORA_INICIAL.AsDateTime;
end;

procedure TfrmCadastroRapidoTarefa.FormClose(
  Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  Self := nil;
end;

procedure TfrmCadastroRapidoTarefa.FormCreate(
  Sender: TObject);
begin
  inherited;
  sqlTarefa.Connection := dtmControles.DB;
  sqlTarefaGrupo.Connection := dtmControles.DB;
  sqlResponsavel.Connection := dtmControles.DB;
  sqlRespLigacao.Connection := dtmControles.DB;

  sqlTarefaGrupo.Open;
  sqlResponsavel.Open;
  sqlRespLigacao.Open;

  PreencherSistemas;
  PreencherTarefaGrupo;
end;

procedure TfrmCadastroRapidoTarefa.FormShow(
  Sender: TObject);
begin
  inherited;
  sqlTarefa.Close;
  sqlTarefa.Params.ParamByName('TAREFA_ID').AsInteger := vlTarefaId;
  sqlTarefa.Open;

  if not sqlTarefa.IsEmpty then
  begin
    sqlTarefa.Edit;
    sqlTarefaMENSAGEM.AsString := String(DeCompressString(AnsiString(sqlTarefaMENSAGEM.AsString)));
    sqlTarefa.Post;
  end;

  sqlTarefa.Edit;

  if sqlTarefa.State = dsInsert then
  begin
    if Trim(vlTipoPeriodo) <> '' then
      sqlTarefaPERIODO_TIPO.AsString := vlTipoPeriodo;

    controlarTipoPeriodo;

    if vlDataInicial > 0 then
    begin
      sqlTarefaDATA_INICIAL.AsDateTime := vlDataInicial;
      sqlTarefaDATA_FINAL.AsDateTime := vlDataInicial;
    end;

    if vlHoraInicial > 0 then
    begin
      sqlTarefaHORA_INICIAL.AsDateTime := vlHoraInicial;
      sqlTarefaHORA_FINAL.AsDateTime := vlHoraInicial;
    end;
  end
  else
  begin
    controlarTipoPeriodo;
    PreencherDiasSemana;
  end;

  PreencherResponsaveis(vlTarefaId);
  icxServentia.SetFocus;
end;

procedure TfrmCadastroRapidoTarefa.ibxSistemaPropertiesChange(
  Sender: TObject);
begin
  inherited;
  PreencherTarefaGrupo;
end;

procedure TfrmCadastroRapidoTarefa.icxTipoPeriodoPropertiesChange(
  Sender: TObject);
begin
  inherited;
  ControlarTipoPeriodo;
end;

procedure TfrmCadastroRapidoTarefa.lcxTarefaGrupoExit(
  Sender: TObject);
begin
  inherited;
  if not (sqlTarefa.State in dsEditModes) then
    Exit;

  if (Trim(lcxTarefaGrupo.text) <> '')
  and (Trim(edtAssunto.Text) = '') then
    sqlTarefaASSUNTO.AsString := Trim(lcxTarefaGrupo.text);
end;

procedure TfrmCadastroRapidoTarefa.MarcarApenasDiaSemana(const vpData: TDateTime);
var
  viDiaSemana: Word;
begin
  viDiaSemana := DayOfWeek(vpData);

  DesmarcarTodosDias;

  case viDiaSemana of
    1: marcarDia(ShpRepetirDomingo, btnRepetirDomingo);
    2: marcarDia(shpRepetirSegunda, btnRepetirSegunda);
    3: marcarDia(shpRepetirTerca,   btnRepetirTerca);
    4: marcarDia(shpRepetirQuarta,  btnRepetirQuarta);
    5: marcarDia(shpRepetirQuinta,  btnRepetirQuinta);
    6: marcarDia(shpRepetirSexta,   btnRepetirSexta);
    7: marcarDia(shpRepetirSabado,  btnRepetirSabado);
  end;
end;

procedure TfrmCadastroRapidoTarefa.MarcarDesmarcarDia(
  vpShp: TShape;
  vpBtn: TSpeedButton);
begin
  if vpShp.Brush.Color = clSilver then
    MarcarDia(vpShp, vpBtn)
  else
    DesmarcarDia(vpShp, vpBtn);
end;

procedure TfrmCadastroRapidoTarefa.MarcarDia(
  vpShp: TShape;
  vpBtn: TSpeedButton);
begin
  vpShp.Brush.Color := clTeal;
  vpBtn.Font.Color := clWhite;
end;

procedure TfrmCadastroRapidoTarefa.MarcarTodosDias;
begin
  MarcarDia(ShpRepetirDomingo, btnRepetirDomingo);
  MarcarDia(shpRepetirSegunda, btnRepetirSegunda);
  MarcarDia(shpRepetirTerca,   btnRepetirTerca);
  MarcarDia(shpRepetirQuarta,  btnRepetirQuarta);
  MarcarDia(shpRepetirQuinta,  btnRepetirQuinta);
  MarcarDia(shpRepetirSexta,   btnRepetirSexta);
  MarcarDia(shpRepetirSabado,  btnRepetirSabado);
end;

function TfrmCadastroRapidoTarefa.MontarListaUsuarios: TArrayOfInteger;
begin
  SetLength(Result, sqlRespLigacao.RecordCount);

  sqlRespLigacao.First;
  while not sqlRespLigacao.Eof do
  begin
    Result[sqlRespLigacao.RecNo - 1] := sqlRespLigacaoUSUARIO_ID.AsInteger;

    sqlRespLigacao.Next;
  end;
end;

procedure TfrmCadastroRapidoTarefa.PreencherDataSetDiasSemana;
begin
  if not (sqlTarefa.State in [dsInsert, dsEdit]) then
    Exit;

  if ShpRepetirDomingo.Brush.Color = clTeal then
    sqlTarefaREPETIR_DOMINGO.AsString := 'S'
  else
    sqlTarefaREPETIR_DOMINGO.AsString := 'N';

  if shpRepetirSegunda.Brush.Color = clTeal then
    sqlTarefaREPETIR_SEGUNDA.AsString := 'S'
  else
    sqlTarefaREPETIR_SEGUNDA.AsString := 'N';

  if shpRepetirTerca.Brush.Color = clTeal then
    sqlTarefaREPETIR_TERCA.AsString := 'S'
  else
    sqlTarefaREPETIR_TERCA.AsString := 'N';

  if shpRepetirQuarta.Brush.Color = clTeal then
    sqlTarefaREPETIR_QUARTA.AsString := 'S'
  else
    sqlTarefaREPETIR_QUARTA.AsString := 'N';

  if shpRepetirQuinta.Brush.Color = clTeal then
    sqlTarefaREPETIR_QUINTA.AsString := 'S'
  else
    sqlTarefaREPETIR_QUINTA.AsString := 'N';

  if shpRepetirSexta.Brush.Color = clTeal then
    sqlTarefaREPETIR_SEXTA.AsString := 'S'
  else
    sqlTarefaREPETIR_SEXTA.AsString := 'N';

  if shpRepetirSabado.Brush.Color = clTeal then
    sqlTarefaREPETIR_SABADO.AsString := 'S'
  else
    sqlTarefaREPETIR_SABADO.AsString := 'N';
end;

procedure TfrmCadastroRapidoTarefa.PreencherDiasSemana;

  procedure PreencherDia(
    vpValor: string;
    vpShp: TShape;
    vpBtn: TSpeedButton);
  begin
    if vpValor = 'S' then
      MarcarDia(vpShp, vpBtn)
    else
      DesmarcarDia(vpShp, vpBtn);
  end;

begin
  PreencherDia(sqlTarefaREPETIR_DOMINGO.AsString, ShpRepetirDomingo, btnRepetirDomingo);
  PreencherDia(sqlTarefaREPETIR_SEGUNDA.AsString, shpRepetirSegunda, btnRepetirSexta);
  PreencherDia(sqlTarefaREPETIR_TERCA.AsString, shpRepetirTerca, btnRepetirTerca);
  PreencherDia(sqlTarefaREPETIR_QUARTA.AsString, shpRepetirQuarta, btnRepetirQuarta);
  PreencherDia(sqlTarefaREPETIR_QUINTA.AsString, shpRepetirQuinta, btnRepetirQuinta);
  PreencherDia(sqlTarefaREPETIR_SEXTA.AsString, shpRepetirSexta, btnRepetirSexta);
  PreencherDia(sqlTarefaREPETIR_SABADO.AsString, shpRepetirSabado, btnRepetirSabado);
end;

procedure TfrmCadastroRapidoTarefa.PreencherResponsaveis(
  const vpTarefaId: Integer);
begin
  sqlRespLigacao.Close;
  sqlRespLigacao.Params.ParamByName('TAREFA_ID').AsInteger := vpTarefaId;
  sqlRespLigacao.Open;
end;

procedure TfrmCadastroRapidoTarefa.PreencherSistemas;
var
  viQry : TI9Query;
  viSQL : String;
  viItem : TcxImageComboBoxItem;
begin
  inherited;
  icxServentia.Properties.Items.Clear;

  viItem := icxServentia.Properties.Items.Add;
  viItem.ImageIndex := 0;
  viItem.Description := 'GERAL';
  viItem.Value := 9;
  viItem.Tag := 0;

  viQry := TI9Query.Create(nil);
  try
    viQry.Connection := dtmControles.DB;

    viSql :=
      ' SELECT ' +
      '        G_ST.SISTEMA_ID, ' +
      '        G_ST.DESCRICAO ' +
      '   FROM G_SISTEMA G_ST ' +
      '  WHERE 1 = 1 ' +
      '    AND G_ST.SITUACAO = ''A'' ';

    viQry.SQL.Text := viSql;
    viQry.Open;

    viQry.First;
    while not viQry.Eof do
    begin
      viItem := icxServentia.Properties.Items.Add;
      viItem.ImageIndex := 0;
      viItem.Description := viQry.FieldByName('DESCRICAO').AsString;
      viItem.Value := viQry.FieldByName('SISTEMA_ID').AsInteger;
      viItem.Tag := 0;

      viQry.Next;
    end;

  finally
    FreeAndNil(viQry);
  end;
end;

procedure TfrmCadastroRapidoTarefa.PreencherTarefaGrupo;
var
  viSql : String;
begin
  inherited;
  sqlTarefaGrupo.Active := False;

  if icxServentia.EditValue = null then
    Exit;

  viSql :=
    ' SELECT * ' +
    '   FROM G_TAREFA_GRUPO ' +
    '  WHERE SERVENTIA = ' + IntToStr(icxServentia.EditValue);

  sqlTarefaGrupo.Active := False;
  sqlTarefaGrupo.SQL.Text := viSql;
  sqlTarefaGrupo.Active := True;
end;

procedure TfrmCadastroRapidoTarefa.rgpTerminoPropertiesChange(
  Sender: TObject);
begin
  inherited;
  dteTerminoData.Enabled := rgpTermino.EditingValue = 'E';
  speTerminoOcorrencias.Enabled := rgpTermino.EditingValue = 'A';
  lblTerminoOcorrencias.Enabled := rgpTermino.EditingValue = 'A';
end;

procedure TfrmCadastroRapidoTarefa.VerificarDiasSemana;
begin
  if  (ShpRepetirDomingo.Brush.Color = clSilver)
  and (shpRepetirSegunda.Brush.Color = clSilver)
  and (shpRepetirTerca.Brush.Color = clSilver)
  and (shpRepetirQuarta.Brush.Color = clSilver)
  and (shpRepetirQuinta.Brush.Color = clSilver)
  and (shpRepetirSexta.Brush.Color = clSilver)
  and (shpRepetirSabado.Brush.Color = clSilver) then
  begin
    TMensagemUtils.ExibirMensagemAtencao('Algum dia da semana deve ser escolhido!');
    pnlRepetirDomingo.SetFocus;
    Abort;
  end;
end;

end.
