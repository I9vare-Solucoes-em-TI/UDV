unit Auditoria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  cxEdit, DB, cxDBLookupComboBox,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxDropDownEdit, cxCalendar, StdCtrls, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxTextEdit, cxContainer,
  cxButtons, DBClient, SimpleDS, ComCtrls,
  cxSplitter, WPCTRMemo, FrameEditorSimples,
  Menus, Data.DBXInterBase,
  cxPC, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxImageComboBox, DbxDevartInterBase, dxSkinsCore,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinscxPCPainter;

type
  TfrmAuditoria = class(TForm)
    sqlFuncionario: TSimpleDataSet;
    sqlFuncionarioUSUARIO_ID: TFMTBCDField;
    sqlFuncionarioLOGIN: TStringField;
    dtsFuncionario: TDataSource;
    sqlAuditoria: TSimpleDataSet;
    dsAuditoria: TDataSource;
    sqlAuditoriaHISTORICO_ID: TFMTBCDField;
    sqlAuditoriaTABELA: TStringField;
    sqlAuditoriaCAMPO: TStringField;
    sqlAuditoriaOPERACAO: TStringField;
    sqlAuditoriaNEW_VALUE: TBlobField;
    sqlAuditoriaDATA: TSQLTimeStampField;
    sqlAuditoriaUSUARIO_ID: TFMTBCDField;
    sqlAuditoriaID: TFMTBCDField;
    cxSplitter4: TcxSplitter;
    sqlAuditoriaOBSERVACAO: TStringField;
    fmeEditorSimples1: TfmeEditorSimples;
    tbcSistemas: TcxTabControl;
    Panel4: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    Panel3: TPanel;
    btnFechar: TcxButton;
    Panel1: TPanel;
    grdAuditoria: TcxGrid;
    grdAuditoriaDBTableView1: TcxGridDBTableView;
    grdAuditoriaDBTableView1DATA: TcxGridDBColumn;
    grdAuditoriaDBTableView1USUARIO_ID: TcxGridDBColumn;
    grdAuditoriaDBTableView1TABELA: TcxGridDBColumn;
    grdAuditoriaDBTableView1CAMPO: TcxGridDBColumn;
    grdAuditoriaDBTableView1OPERACAO: TcxGridDBColumn;
    grdAuditoriaDBTableView1ID: TcxGridDBColumn;
    grdAuditoriaDBTableView1OBSERVACAO: TcxGridDBColumn;
    grdAuditoriaLevel1: TcxGridLevel;
    pnlDadosRegistro: TPanel;
    rdbProtocolo: TRadioButton;
    rdbRegAuxiliar: TRadioButton;
    rdbMinutas: TRadioButton;
    rdbTranscricao: TRadioButton;
    rdbMatricula: TRadioButton;
    lblNumero: TLabel;
    edtDataInicio: TcxDateEdit;
    edtDataFim: TcxDateEdit;
    lcxUsuario: TcxLookupComboBox;
    edtNumero: TcxTextEdit;
    edtObservacao: TcxTextEdit;
    edtID: TcxTextEdit;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    pnlTipoPesquisaNumero: TPanel;
    rdbPadrao: TRadioButton;
    rdbTextual: TRadioButton;
    procedure sqlAuditoriaAfterScroll(DataSet: TDataSet);
    procedure sqlAuditoriaBeforeOpen(DataSet: TDataSet);
    procedure sqlAuditoriaAfterOpen(DataSet: TDataSet);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLimparClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtIDKeyPress(Sender: TObject; var Key: Char);
    procedure tbcSistemasChange(Sender: TObject);
    procedure rdbTextualClick(Sender: TObject);
    procedure rdbPadraoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    vgControle : Boolean;
  public
    { Public declarations }
  end;

var
  frmAuditoria: TfrmAuditoria;

implementation

uses Controles, Rotinas;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure TfrmAuditoria.sqlAuditoriaAfterScroll(DataSet: TDataSet);
begin
  fmeEditorSimples1.wptTexto.Clear;
  if vgControle then
  begin
    fmeEditorSimples1.wptTexto.AsString := DeCompressString(sqlAuditoriaNEW_VALUE.AsString);
    if Copy(fmeEditorSimples1.wptTexto.text, 1, 2) = 'eJ' then
      fmeEditorSimples1.wptTexto.AsString := DeCompressString(fmeEditorSimples1.wptTexto.text);
  end;
end;

procedure TfrmAuditoria.sqlAuditoriaBeforeOpen(DataSet: TDataSet);
begin
  vgControle := False;
end;

procedure TfrmAuditoria.tbcSistemasChange(Sender: TObject);
begin
  btnLimparClick(Self);
  pnlDadosRegistro.Visible      := vgListaSistemas[tbcSistemas.TabIndex] = 1;
  pnlTipoPesquisaNumero.Visible := vgListaSistemas[tbcSistemas.TabIndex] = 1;
  lblNumero.Visible             := pnlDadosRegistro.Visible;
  edtNumero.Visible             := pnlDadosRegistro.Visible;

  if pnlDadosRegistro.Visible then
  begin
    rdbPadrao.Checked := True;
    rdbPadraoClick(self);
  end;

  if tbcSistemas.TabIndex > 0 then
    edtDataInicio.SetFocus;
end;

procedure TfrmAuditoria.sqlAuditoriaAfterOpen(DataSet: TDataSet);
begin
  vgControle := True;
end;

procedure TfrmAuditoria.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmAuditoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlFuncionario.Close;
  sqlAuditoria.Close;
  Action := caFree;
  frmAuditoria := nil;
end;

procedure TfrmAuditoria.btnLimparClick(Sender: TObject);
begin
  sqlAuditoria.Close;
  fmeEditorSimples1.wptTexto.Clear;
  edtDataInicio.Clear;
  edtDataFim.Clear;
  lcxUsuario.EditValue := Null;
  edtObservacao.Clear;
  edtID.Clear;
  edtNumero.Clear;
end;

procedure TfrmAuditoria.FormCreate(Sender: TObject);
begin
  sqlFuncionario.Connection := dtmControles.DB;
  sqlAuditoria.Connection   := dtmControles.DBH;
  sqlFuncionario.Open;
  dtmControles.CarregarSistemasTab(tbcSistemas);
  tbcSistemasChange(Self);
end;

procedure TfrmAuditoria.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #27 : begin
            Key := #0;
            if Application.MessageBox('Deseja fechar este formul�rio?', 'Aten��o', MB_YESNO + MB_ICONQUESTION) = IDYES then
               Close;
          end;
    #13 : begin
            Key := #0;
            PostMessage (Handle, WM_NEXTDLGCTL, 0, 0);
          end;
  end; {case}
end;

procedure TfrmAuditoria.FormShow(Sender: TObject);
begin
  edtDataInicio.SetFocus;
end;

procedure TfrmAuditoria.btnPesquisarClick(Sender: TObject);
var
  viSql, viSqlAux, viTabela  : String;

  procedure PreencherCondicao(vpCondicao : string);
  begin
    if viSqlAux = '' then
         viSqlAux := ' WHERE '+ vpCondicao
    else viSqlAux := viSqlAux + ' AND ' + vpCondicao;
  end;


  procedure CarregarCondicaoGeral;
  begin
    case vgListaSistemas[tbcSistemas.TabIndex] of
      1   : viTabela := 'R_HISTORICO';
      2   : viTabela := 'T_HISTORICO';
      5,20: viTabela := 'C_HISTORICO';
      7   : viTabela := 'D_HISTORICO';
     13   : viTabela := 'P_HISTORICO';
    end;

    viSqlAux := '';
    if (edtDataInicio.Text <> '  /  /    ') and (edtDataFim.Text <> '  /  /    ') then
      PreencherCondicao(' DATA ' +  MontarSqlData(edtDataInicio.Date , edtDataFim.Date));

    if lcxUsuario.EditValue <> null then
      PreencherCondicao(' USUARIO_ID = ' + IntToStr(lcxUsuario.EditValue));

    if Trim(edtObservacao.Text) <> '' then
      PreencherCondicao(' OBSERVACAO like ' + QuotedStr('%' + edtObservacao.Text + '%'));

    if Trim(edtID.Text) <> '' then
      PreencherCondicao(' ID = ' + edtID.Text);
  end;

  procedure CarregarDadosRegistro;
  var
    viTipo : String;

   {$REGION 'Carregar Pesquisa Numero Textual'}
    procedure CarregarPesquisaNumeroTextual;
    begin
      if rdbMatricula.Checked then
        viTipo := 'Matr�cula: '
      else if rdbTranscricao.Checked then
        viTipo := 'Transcri��o: '
      else if rdbRegAuxiliar.Checked then
        viTipo := 'Reg.Auxiliar: '
      else if rdbMinutas.Checked then
        viTipo := 'Minutas: '
      else if rdbProtocolo.Checked then
        viTipo := 'Protocolo: ';

      if Trim(edtNumero.Text) <> '' then
        PreencherCondicao(' OBSERVACAO like ' + QuotedStr('%' + viTipo + ' '+ edtNumero.Text+ '%') );
    end;
    {$ENDREGION}

   {$REGION 'Carregar Pesquisa Numero Padr�o'}
    procedure CarregarPesquisaNumeroPadrao;
    var
      viSql2 : String;
    begin
      if Trim(edtNumero.Text) = '' then
        exit;

      if rdbMatricula.Checked then
        viSql2 := 'SELECT IMOVEL_ID FROM R_IMOVEL WHERE TIPO_REGISTRO = '+QuotedStr('M')+' AND NUMERO = '+edtNumero.Text
      else if rdbTranscricao.Checked then
        viSql2 := 'SELECT IMOVEL_ID FROM R_IMOVEL WHERE TIPO_REGISTRO = '+QuotedStr('T')+' AND NUMERO = '+edtNumero.Text
      else if rdbRegAuxiliar.Checked then
        viSql2 := 'SELECT IMOVEL_ID FROM R_IMOVEL WHERE TIPO_REGISTRO = '+QuotedStr('A')+' AND NUMERO = '+edtNumero.Text
      else if rdbProtocolo.Checked then
        viSql2 := 'SELECT PEDIDO_ID FROM R_PROTOCOLO WHERE NUMERO_ORDEM = '+edtNumero.Text;

      if (rdbMatricula.Checked) or (rdbTranscricao.Checked) or
         (rdbRegAuxiliar.Checked) or (rdbProtocolo.Checked) then
      begin
        ExecutaSqlAuxiliar(viSql2,0);
        if dtmControles.sqlAuxiliar.IsEmpty then
          Exit;

        PreencherCondicao(' ID = ' + dtmControles.sqlAuxiliar.Fields[0].AsString);
      end
      else PreencherCondicao(' ID = ' + edtNumero.Text);
    end;
    {$ENDREGION}

  begin
    if not pnlDadosRegistro.Visible then
      exit;

    if rdbTextual.Checked then
         CarregarPesquisaNumeroTextual
    else CarregarPesquisaNumeroPadrao;
  end;

begin
  if edtDataInicio.Date > edtDataFim.Date then
  begin
    Application.MessageBox('Per�odo inicial maior que o final!', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtDataInicio.SetFocus;
    Abort;
  end;

  CarregarCondicaoGeral;

  if viSqlAux = '' then
  begin
    Application.MessageBox('Deve ser informado pelo menos um par�metro para pesquisa!', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtDataInicio.SetFocus;
    Abort;
  end;

  if lcxUsuario.EditValue <> null then
    PreencherCondicao(' USUARIO_ID = ' + IntToStr(lcxUsuario.EditValue));

  CarregarDadosRegistro;

  viSql := ' SELECT * FROM ' + viTabela + ' ' + viSqlAux + ' ORDER BY DATA';

  sqlAuditoria.Close;
  sqlAuditoria.DataSet.CommandText := viSql;
  sqlAuditoria.Open;

  if sqlAuditoria.IsEmpty then
  begin
    Application.MessageBox('N�o Existe Informa��o Para Esse Filtro!', 'Aviso', MB_OK + MB_ICONINFORMATION);
    edtDataInicio.SetFocus;
    Exit;
  end;
end;

procedure TfrmAuditoria.edtIDKeyPress(Sender: TObject; var Key: Char);
begin
  DigitaInteiro(Key);
end;

procedure TfrmAuditoria.rdbPadraoClick(Sender: TObject);
begin
  edtObservacao.Enabled := True;
end;

procedure TfrmAuditoria.rdbTextualClick(Sender: TObject);
begin
  edtObservacao.Clear;
  edtObservacao.Enabled := False;
end;

end.
