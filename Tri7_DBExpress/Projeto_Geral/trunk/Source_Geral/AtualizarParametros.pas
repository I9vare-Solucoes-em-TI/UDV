unit AtualizarParametros;

interface

uses
  I9Query,
  I9Connection,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxLookAndFeelPainters, cxButtons, ComCtrls, cxProgressBar, DB, DBClient,
  SimpleDS, ExtCtrls, cxMaskEdit, cxDropDownEdit, cxCheckComboBox, FMTBcd,
  SqlExpr, Buttons, Grids, DBGrids, Menus, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DBXpress;

type
  TfrmAtualizarParametros = class(TForm)
    cdsAtualizador: TClientDataSet;
    sqlGravarIni: TI9Query;
    sqlGravarAdaptacoes: TI9Query;
    pnParametros: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cxbtnAtualizarTabelas: TcxButton;
    cxbtn_exportar: TcxButton;
    cxchkTabelas: TcxCheckComboBox;
    cxckSecoes: TcxCheckComboBox;
    cxbtnAtualizarSecoes: TcxButton;
    chkTodas: TCheckBox;
    Panel3: TPanel;
    pagSql: TPageControl;
    tabTexto: TTabSheet;
    tabResultado: TTabSheet;
    dbgResultado: TDBGrid;
    memoSQL: TMemo;
    cxBtnExecutarSql: TcxButton;
    cxBtnAplicarSql: TcxButton;
    cxBtnCancelarSql: TcxButton;
    dtsExecute: TDataSource;
    sqlExecute: TI9Query;
    btnFechar: TBitBtn;
    pgbTabelas: TProgressBar;
    sbnExportar: TSpeedButton;
    Shape1: TShape;
    PopupMenu1: TPopupMenu;
    ExecutarSQL1: TMenuItem;
    Label3: TLabel;
    cxtextBase: TcxTextEdit;
    SpeedButton1: TSpeedButton;
    OpenDialog: TOpenDialog;
    sqlAtualiza: TI9Query;
    DBAuxiliar: TI9Connection;
    sqlGravarMarcacaoTipo: TI9Query;
    btnLimpar: TcxButton;
    sqlModeloNotificacao: TI9Query;
    procedure FormCreate(Sender: TObject);
    procedure cxBtnExecutarSqlClick(Sender: TObject);
    procedure cxBtnAplicarSqlClick(Sender: TObject);
    procedure cxBtnCancelarSqlClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbnExportarClick(Sender: TObject);
    procedure ExecutarSQL1Click(Sender: TObject);
    procedure memoSQLKeyPress(Sender: TObject; var Key: Char);
    procedure sqlExecuteBeforeEdit(DataSet: TDataSet);
    procedure sqlExecuteBeforeInsert(DataSet: TDataSet);
    procedure cxbtn_exportarClick(Sender: TObject);
    procedure cxbtnAtualizarTabelasClick(Sender: TObject);
    procedure chkTodasClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    vgQtdAtualizada : integer;
    procedure AtualizarSQL(vpExportar : Boolean);
    procedure AtualizarTabelaINI;
    procedure AtualizarTabelaAdaptacoes;
    procedure AtualizarTabelaDocumentos;

    procedure AtualizarMarcacaoTipo;
    procedure AtualizarModeloNotificacao;
  public
    { Public declarations }
  end;

var
  frmAtualizarParametros: TfrmAtualizarParametros;

implementation

uses Rotinas, Math, Controles;

{$R *.dfm}

procedure TfrmAtualizarParametros.AtualizarSQL(vpExportar: Boolean);
var
  i : integer;
  viTabela : integer;
  viSelecionados, viArquivos, viMensagem : string;

begin
  viSelecionados := cxchkTabelas.EditValue;
  viTabela       := -1;
  viArquivos     := '';
  memoSQL.Clear;
  for i := 2 to Length(viSelecionados) do
  begin
    if viSelecionados[i] = ',' then
         Continue
    else viTabela := StrToInt(viSelecionados[i]);

    if dtmcontroles.SimpleAuxiliar <> nil then
      dtmcontroles.SimpleAuxiliar.Destroy;

    dtmcontroles.SimpleAuxiliar := TI9Query.Create(nil);
    dtmcontroles.SimpleAuxiliar.DataSet.Connection := DBAuxiliar;

    case viTabela of
      0 : ExecutaSimpleDSAux(' SELECT * FROM G_MARCACAO_TIPO WHERE MARCACAO_TIPO_ID >= 404 ORDER BY MARCACAO_TIPO_ID ',0);
      1 : ExecutaSimpleDSAux(' SELECT * FROM D_MODELO_NOTIFICACAO ORDER BY MODELO_NOTIFICACAO_ID ',0);
    end;

    if vpExportar then // Exporta para XML
    begin
      if not dtmcontroles.SimpleAuxiliar.IsEmpty then
      begin
        if memoSQL.Text = '' then
        begin
          memoSQL.Lines.Add('Lista dos arquivos criados!!!');
          memoSQL.Lines.Add('');
        end;

        dtmcontroles.SimpleAuxiliar.SaveToFile(ExtractFilePath(Application.ExeName) + 'ExpXML_'+cxchkTabelas.Properties.Items.Items[vitabela].Description+'.xml', dfXMLUTF8);
        viArquivos := viArquivos + ' ' + cxchkTabelas.Properties.Items.Items[vitabela].Description+'.xml;';
        memoSQL.Lines.Add(cxchkTabelas.Properties.Items.Items[vitabela].Description+'.xml');
      end;
    end
    else
    begin // Atualiza Tabelas de acordo com os arquivos XML
      vgQtdAtualizada := 0;
      // Carrega o Arquivo XML
      cdsAtualizador.Close;
      cdsAtualizador.LoadFromFile(ExtractFilePath(Application.ExeName)+'ExpXML_'+cxchkTabelas.Properties.Items.Items[vitabela].Description+'.xml');

      if not cdsAtualizador.IsEmpty then
      begin
        pgbTabelas.Max      := cdsAtualizador.RecordCount;
        pgbTabelas.Position := 0;
        cdsAtualizador.First;

        if memoSQL.Text = '' then
          memoSQL.Lines.Add('Atualização da(s) tabela(s) selecionada(s)...');

        memoSQL.Lines.Add('');
        // Executa o Procedimento da Tabela Selecionada
        case viTabela of
          0 : AtualizarMarcacaoTipo;
          1 : AtualizarModeloNotificacao;
        end;
        cdsAtualizador.Close;
      end
      else memoSQL.Lines.Add(' Arquivo da Tabela '+ cxchkTabelas.Properties.Items.Items[vitabela].Description+ ' Está vazio.');
    end;
  end;

  if vpExportar then
       viMensagem := 'A Lista dos Arquivos acima estão na pasta '+ ExtractFilePath(Application.ExeName)
  else viMensagem := 'Termino da Atualização.';

  if viTabela > - 1 then
  begin
    memoSQL.Lines.Add('');
    memoSQL.Lines.Add('Operação concluída!!!');
    memoSQL.Lines.Add(viMensagem);
    ShowMessage('Operação Concluída!!!');
  end
  else ShowMessage('Nenhuma tabela foi selecionada!!!');
end;

procedure TfrmAtualizarParametros.AtualizarTabelaAdaptacoes;
begin
{  memoSQL.Lines.Add('* Tabela "DOCUMENTOS" ');
  while not cdsAtualizador.Eof do
  begin
    try
      if not dtmcontroles.SimpleAuxiliar.Locate('PALAVRA', cdsAtualizador.FieldByName('PALAVRA').AsString, [loCaseInsensitive]) then
      begin
        sqlGravarAdaptacoes.Params[0].AsCurrency  := BuscaSequence('ADAPTACOES_SEQ');
        sqlGravarAdaptacoes.Params[1].AsString    := cdsAtualizador.FieldByName('PALAVRA').AsString;
        sqlGravarAdaptacoes.Params[2].AsString    := cdsAtualizador.FieldByName('BASE').AsString;
        sqlGravarAdaptacoes.Params[3].AsString    := cdsAtualizador.FieldByName('MASC_SING').AsString;
        sqlGravarAdaptacoes.Params[4].AsString    := cdsAtualizador.FieldByName('MASC_PLURAL').AsString;
        sqlGravarAdaptacoes.Params[5].AsString    := cdsAtualizador.FieldByName('FEM_SING').AsString;
        sqlGravarAdaptacoes.Params[6].AsString    := cdsAtualizador.FieldByName('FEM_PLURAL').AsString;
        sqlGravarAdaptacoes.ExecSQL;
        Inc(vgQtdAtualizada);
      end;
      pgbTabelas.Position := cdsAtualizador.RecNo;
      cdsAtualizador.Next;
    except
    end;
  end;
  if vgQtdAtualizada > 0 then
    memoSQL.Lines.Add('--> Final de Atualização de "DICIONÁRIO DE ADAPTAÇÕES"  - '+IntToStr(vgQtdAtualizada) + ' registro(s) atualizados.');}
end;

procedure TfrmAtualizarParametros.AtualizarTabelaDocumentos;
begin
{  memoSQL.Lines.Add('* Tabela "DOCUMENTOS" ');
  while not cdsAtualizador.Eof do
  begin
    try
      if not dtmcontroles.SimpleAuxiliar.Locate('PALAVRA', cdsAtualizador.FieldByName('PALAVRA').AsString, [loCaseInsensitive]) then
      begin
        sqlGravarAdaptacoes.Params[0].AsCurrency  := BuscaSequence('ADAPTACOES_SEQ');
        sqlGravarAdaptacoes.Params[1].AsString    := cdsAtualizador.FieldByName('PALAVRA').AsString;
        sqlGravarAdaptacoes.Params[2].AsString    := cdsAtualizador.FieldByName('BASE').AsString;
        sqlGravarAdaptacoes.Params[3].AsString    := cdsAtualizador.FieldByName('MASC_SING').AsString;
        sqlGravarAdaptacoes.Params[4].AsString    := cdsAtualizador.FieldByName('MASC_PLURAL').AsString;
        sqlGravarAdaptacoes.Params[5].AsString    := cdsAtualizador.FieldByName('FEM_SING').AsString;
        sqlGravarAdaptacoes.Params[6].AsString    := cdsAtualizador.FieldByName('FEM_PLURAL').AsString;
        sqlGravarAdaptacoes.ExecSQL;
        Inc(vgQtdAtualizada);
      end;
      pgbTabelas.Position := cdsAtualizador.RecNo;
      cdsAtualizador.Next;
    except
    end;
  end;
  if vgQtdAtualizada > 0 then
    memoSQL.Lines.Add('--> Final de Atualização de "DOCUMENTOS"  - '+IntToStr(vgQtdAtualizada) + ' registro(s) atualizados.');}
end;

procedure TfrmAtualizarParametros.AtualizarTabelaINI;
begin
{  memoSQL.Lines.Add('* Tabela "INI" ');
  while not cdsAtualizador.Eof do
  begin
    try
      if not dtmcontroles.SimpleAuxiliar.Locate('SECAO;NOME', VarArrayOf([cdsAtualizador.FieldByName('SECAO').AsString, cdsAtualizador.FieldByName('NOME').AsString]), [loCaseInsensitive]) then
      begin
        sqlGravarIni.Params[0].AsCurrency  := BuscaSequence('INI_SEQ');
        sqlGravarIni.Params[1].AsString    := cdsAtualizador.FieldByName('SECAO').AsString;
        sqlGravarIni.Params[2].AsString    := cdsAtualizador.FieldByName('NOME').AsString;
        sqlGravarIni.Params[3].AsString    := cdsAtualizador.FieldByName('ESTACAO').AsString;
        sqlGravarIni.Params[4].AsString    := cdsAtualizador.FieldByName('DESCRICAO').AsString;
        sqlGravarIni.Params[5].AsString    := cdsAtualizador.FieldByName('VALOR').AsString;
        sqlGravarIni.Params[6].AsBlob      := cdsAtualizador.FieldByName('OBSERVACAO').AsString;
        sqlGravarIni.ExecSQL;
        memoSQL.Lines.Add('  - '+cdsAtualizador.FieldByName('SECAO').AsString + ', '+ cdsAtualizador.FieldByName('NOME').AsString);
        Inc(vgQtdAtualizada);
      end;
      pgbTabelas.Position := cdsAtualizador.RecNo;
      cdsAtualizador.Next;
    except
    end;
  end;
  if vgQtdAtualizada > 0 then
    memoSQL.Lines.Add('--> Final de Atualização do "INI"  - '+IntToStr(vgQtdAtualizada) + ' registro(s) atualizados.');}
end;

procedure TfrmAtualizarParametros.FormCreate(Sender: TObject);
begin
  DBAuxiliar.Connected := False;
  DBAuxiliar.Params.Values['DataBase'] := DBAuxiliar.Params.Values['DataBase'];
  DBAuxiliar.Connected := True;
  cxtextBase.Text := dtmControles.DB.Params.Values['DataBase'];

  pagSql.ActivePageIndex := 0;
  sqlExecute.Connection  := DBAuxiliar;

{  // Seleciona as Seções do Ini
  ExecutaSimpleDSAux(' SELECT SECAO FROM INI '+
                     ' GROUP BY SECAO ',0);}

  While not dtmcontroles.SimpleAuxiliar.Eof do
  begin
    cxckSecoes.Properties.Items.AddCheckItem(dtmcontroles.SimpleAuxiliar.FieldByName('SECAO').AsString,'');
    dtmcontroles.SimpleAuxiliar.Next;
  end;

end;

procedure TfrmAtualizarParametros.cxBtnExecutarSqlClick(Sender: TObject);
begin
  if DBAuxiliar.InTransaction then
    dtmControles.Roolback;

  sqlExecute.Active := False;
  try
    dtmControles.StartTransaction;
    Screen.Cursor := crSQLWait;
    if (pos('INSERT', AnsiUpperCase(memoSQL.Text)) > 0) or (pos('UPDATE', AnsiUpperCase(memoSQL.Text)) > 0) or
       (pos('DELETE', AnsiUpperCase(memoSQL.Text)) > 0) then
      with sqlAtualiza do
      begin
        Active := False;
        SQL.Clear;
        sql.Add(memoSQL.Text);
        ExecSQL;
      end
    else
      with sqlExecute do
      begin
        Active := False;
        SQL.Text := '';
        SQL.Text := memoSQL.Text;
        Active := True;
        pagSql.ActivePageIndex := 1;
      end;
    cxBtnCancelarSql.Enabled := True;
    cxBtnAplicarSql.Enabled  := True;
    Screen.Cursor := crDefault;
  except
    on e:exception do
    begin
      Screen.Cursor := crDefault;
      MessageDlg(' Verifique o SQL!!' + #13 + #13+
                 ' Erro = '+E.Message, mtError, [mbOK],0);
      if DBAuxiliar.InTransaction then
         dtmControles.Roolback;
      cxBtnCancelarSql.Enabled := False;
      cxBtnAplicarSql.Enabled  := False;
    end;
  end;
end;

procedure TfrmAtualizarParametros.cxBtnAplicarSqlClick(Sender: TObject);
begin
  dtmControles.Commit;
  cxBtnCancelarSql.Enabled := False;
  cxBtnAplicarSql.Enabled  := False;
end;

procedure TfrmAtualizarParametros.cxBtnCancelarSqlClick(Sender: TObject);
begin
  dtmControles.Roolback;
  cxBtnCancelarSql.Enabled := False;
  cxBtnAplicarSql.Enabled  := False;
end;

procedure TfrmAtualizarParametros.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmAtualizarParametros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if DBAuxiliar.InTransaction then
    dtmControles.Roolback;

  sqlExecute.Active := False;
  Action := caFree;
  frmAtualizarParametros := nil;
end;

procedure TfrmAtualizarParametros.sbnExportarClick(Sender: TObject);
begin
  if sbnExportar.Down then
  begin
    if DBAuxiliar.InTransaction then
      dtmControles.Roolback;
    btnLimparClick(self);
    tabResultado.TabVisible  := False;
    btnLimpar.Enabled      := False;
    cxBtnExecutarSql.Enabled := False;
    cxBtnAplicarSql.Enabled  := False;
    cxBtnCancelarSql.Enabled := False;
    pnParametros.Visible     := True;
  end
  else
  begin
    BtnLimparClick(self);
    tabResultado.TabVisible  := True;
    BtnLimpar.Enabled      := True;
    cxBtnExecutarSql.Enabled := True;
    cxBtnAplicarSql.Enabled  := False;
    cxBtnCancelarSql.Enabled := False;
    pnParametros.Visible     := False;
  end;
end;

procedure TfrmAtualizarParametros.ExecutarSQL1Click(Sender: TObject);
begin
  cxBtnExecutarSqlClick(self);
end;

procedure TfrmAtualizarParametros.memoSQLKeyPress(Sender: TObject;
  var Key: Char);
begin
  if trim(memoSQL.Text) = '' then
       cxBtnExecutarSql.Enabled := False
  else cxBtnExecutarSql.Enabled := True;
end;

procedure TfrmAtualizarParametros.sqlExecuteBeforeEdit(DataSet: TDataSet);
begin
  if not DBAuxiliar.InTransaction then
  begin
    dtmControles.StartTransaction;
    cxBtnCancelarSql.Enabled := True;
    cxBtnAplicarSql.Enabled  := True;
  end;
end;

procedure TfrmAtualizarParametros.sqlExecuteBeforeInsert(
  DataSet: TDataSet);
begin
  if not DBAuxiliar.InTransaction then
  begin
    dtmControles.StartTransaction;
    cxBtnCancelarSql.Enabled := True;
    cxBtnAplicarSql.Enabled  := True;
  end;
end;

procedure TfrmAtualizarParametros.cxbtn_exportarClick(Sender: TObject);
begin
  AtualizarSQL(True);
end;

procedure TfrmAtualizarParametros.cxbtnAtualizarTabelasClick(
  Sender: TObject);
begin
  AtualizarSQL(False);
end;

procedure TfrmAtualizarParametros.chkTodasClick(Sender: TObject);
begin
  if chkTodas.Checked then
       cxchkTabelas.EditValue := ';0,1,2,3,4,5,6,7,8,9,10,11,12,13'
  else cxchkTabelas.EditValue := '';
end;

procedure TfrmAtualizarParametros.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog.Execute;
  if OpenDialog.FileName <> '' then
  begin
    DBAuxiliar.Connected := False;
    DBAuxiliar.Params.Values['DataBase'] := OpenDialog.FileName;
    DBAuxiliar.Connected := True;
    cxtextBase.Text := OpenDialog.FileName;
  end;
end;

procedure TfrmAtualizarParametros.AtualizarMarcacaoTipo;
begin
  memoSQL.Lines.Add('* Tabela "INI" ');
  while not cdsAtualizador.Eof do
  begin
    try
//      if not dtmcontroles.SimpleAuxiliar.Locate('SECAO;NOME', VarArrayOf([cdsAtualizador.FieldByName('SECAO').AsString, cdsAtualizador.FieldByName('NOME').AsString]), [loCaseInsensitive]) then
//      begin
        sqlGravarMarcacaoTipo.Params[0].AsCurrency   := cdsAtualizador.FieldByName('MARCACAO_TIPO_ID').AsCurrency + 24;
        sqlGravarMarcacaoTipo.Params[1].AsString     := cdsAtualizador.FieldByName('DESCRICAO').AsString;
        sqlGravarMarcacaoTipo.Params[2].AsString     := cdsAtualizador.FieldByName('NOME').AsString;
        sqlGravarMarcacaoTipo.Params[3].AsString     := cdsAtualizador.FieldByName('GRUPO').AsString;
        sqlGravarMarcacaoTipo.Params[4].AsString     := cdsAtualizador.FieldByName('SITUACAO').AsString;
        sqlGravarMarcacaoTipo.Params[5].AsString     := cdsAtualizador.FieldByName('SISTEMA_ID').AsString;
        sqlGravarMarcacaoTipo.Params[6].AsString     := cdsAtualizador.FieldByName('GRUPO_TIPO').AsString;
        sqlGravarMarcacaoTipo.Params[7].AsString     := cdsAtualizador.FieldByName('TIPO_QUALIFICACAO').AsString;
        sqlGravarMarcacaoTipo.Params[8].AsString     := cdsAtualizador.FieldByName('CONDICAO_SQL').AsString;
        sqlGravarMarcacaoTipo.Params[9].AsString     := cdsAtualizador.FieldByName('SEPARADOR_1').AsString;
        sqlGravarMarcacaoTipo.Params[10].AsString    := cdsAtualizador.FieldByName('SEPARADOR_2').AsString;
        sqlGravarMarcacaoTipo.Params[11].AsString    := cdsAtualizador.FieldByName('SEPARADOR_3').AsString;
        sqlGravarMarcacaoTipo.Params[12].AsString    := cdsAtualizador.FieldByName('TIPO_VALOR').AsString;
        sqlGravarMarcacaoTipo.Params[13].AsBlob      := cdsAtualizador.FieldByName('TEXTO').AsString;
        sqlGravarMarcacaoTipo.ExecSQL;
        memoSQL.Lines.Add('  - '+cdsAtualizador.FieldByName('NOME').AsString + ', '+ cdsAtualizador.FieldByName('DESCRICAO').AsString);
        Inc(vgQtdAtualizada);
//      end;
      pgbTabelas.Position := cdsAtualizador.RecNo;
      cdsAtualizador.Next;
    except
    end;
  end;
  if vgQtdAtualizada > 0 then
    memoSQL.Lines.Add('--> Final de Atualização do "INI"  - '+IntToStr(vgQtdAtualizada) + ' registro(s) atualizados.');
end;

procedure TfrmAtualizarParametros.btnLimparClick(Sender: TObject);
begin
  memoSQL.Clear;
end;

procedure TfrmAtualizarParametros.AtualizarModeloNotificacao;
begin
  memoSQL.Lines.Add('* Tabela "Modelo Notificacao" ');
  while not cdsAtualizador.Eof do
  begin
    try
//      if not dtmcontroles.SimpleAuxiliar.Locate('SECAO;NOME', VarArrayOf([cdsAtualizador.FieldByName('SECAO').AsString, cdsAtualizador.FieldByName('NOME').AsString]), [loCaseInsensitive]) then
//      begin
        sqlModeloNotificacao.Params[0].AsBlob   := cdsAtualizador.FieldByName('TEXTO').AsString;
        sqlModeloNotificacao.Params[1].AsCurrency      := cdsAtualizador.FieldByName('MODELO_NOTIFICACAO_ID').AsCurrency;
        sqlModeloNotificacao.ExecSQL;
        memoSQL.Lines.Add('  - '+cdsAtualizador.FieldByName('MODELO_NOTIFICACAO_ID').AsString);
        Inc(vgQtdAtualizada);
//      end;
      pgbTabelas.Position := cdsAtualizador.RecNo;
      cdsAtualizador.Next;
    except
    end;
  end;
  if vgQtdAtualizada > 0 then
    memoSQL.Lines.Add('--> Final de Atualização da "Tabela de Notificação"  - '+IntToStr(vgQtdAtualizada) + ' registro(s) atualizados.');
end;

end.

