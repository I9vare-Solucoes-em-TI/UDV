unit Usuario;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxSplitter, cxTextEdit, cxDBEdit, cxContainer, cxLabel, cxCheckBox,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, DBCtrls, SimpleDS,
  cxDBLookupComboBox, cxGroupBox, cxLookupEdit, cxDBLookupEdit, cxPC,
  ImgList, Menus, Buttons, Grids, DBGrids, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter,
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxNavigator, dxSkinDevExpressDarkStyle, dxBarBuiltInMenu, DbxDevartInterBase,
  System.Actions;

type
  TfrmUsuario = class(TfrmCadBasico)
    pagPrincipal: TcxPageControl;
    tbsUsuario: TcxTabSheet;
    tbsPermissao: TcxTabSheet;
    grdRotinas: TcxGrid;
    grdRotinasDBTableView1: TcxGridDBTableView;
    grdRotinasLevel1: TcxGridLevel;
    sqlGrupo: TI9Query;
    sqlGrupoUSUARIO_GRUPO_ID: TBCDField;
    sqlGrupoDESCRICAO: TStringField;
    sqlGrupoSITUACAO: TStringField;
    dsGrupo: TDataSource;
    dsRotina: TDataSource;
    sqlGrupoUsuario: TI9Query;
    FMTBCDField1: TBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    dtsGrupoUsuario: TDataSource;
    ImageList1: TImageList;
    ClientAncestralUSUARIO_ID: TBCDField;
    ClientAncestralTROCARSENHA: TStringField;
    ClientAncestralLOGIN: TStringField;
    ClientAncestralSENHA: TStringField;
    ClientAncestralSITUACAO: TStringField;
    grdRotinasDBTableView1DESCROTINA: TcxGridDBColumn;
    grdRotinasDBTableView1pIncluir: TcxGridDBColumn;
    grdRotinasDBTableView1pAlterar: TcxGridDBColumn;
    grdRotinasDBTableView1pExcluir: TcxGridDBColumn;
    grdRotinasDBTableView1pPesquisar: TcxGridDBColumn;
    grdRotinasDBTableView1pRelatorio: TcxGridDBColumn;
    grdRotinasDBTableView1pEspecial: TcxGridDBColumn;
    cxGridBasica: TcxGrid;
    gridMenus: TcxGridDBTableView;
    cxGridBasicaLevel1: TcxGridLevel;
    sqlMenu: TI9Query;
    dtsMenu: TDataSource;
    sqlMenuSISTEMA_MENU_ID: TBCDField;
    sqlMenuDESCRICAO: TStringField;
    sqlMenuSISTEMA_ID: TBCDField;
    gridMenusDESCRICAO: TcxGridDBColumn;
    Panel1: TPanel;
    Label1: TLabel;
    lcbGrupos: TcxLookupComboBox;
    pnlCopiarPermissoa: TPanel;
    Label4: TLabel;
    lbxGrupoDestino: TcxLookupComboBox;
    PopupMenu1: TPopupMenu;
    CopirarPermisso1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MarcarTodos1: TMenuItem;
    DesmarcarTodos1: TMenuItem;
    MarcarEste1: TMenuItem;
    DesmarcarEste1: TMenuItem;
    N1: TMenuItem;
    grdRotinasDBTableView1DBColumn1: TcxGridDBColumn;
    sqlRotina: TI9Query;
    sqlRotinaCHAVE_ROTINA: TStringField;
    sqlRotinaSISTEMA_MENU_ID: TBCDField;
    sqlRotinaDESCROTINA: TStringField;
    sqlRotinaSISTEMA_ROTINA_ID: TBCDField;
    sqlRotinaPERMISSAO: TStringField;
    sqlRotinapIncluir: TStringField;
    sqlRotinapAlterar: TStringField;
    sqlRotinapExcluir: TStringField;
    sqlRotinapPesquisar: TStringField;
    sqlRotinapRelatorio: TStringField;
    sqlRotinapEspecial: TStringField;
    ClientAncestralPESSOA_ID: TBCDField;
    grdUsuario: TcxGrid;
    grdUsuarioDBTableView1: TcxGridDBTableView;
    grdUsuarioDBTableView1NOME_COMPLETO: TcxGridDBColumn;
    grdUsuarioDBTableView1LOGIN: TcxGridDBColumn;
    grdUsuarioDBTableView1SITUACAO: TcxGridDBColumn;
    grdUsuarioLevel1: TcxGridLevel;
    Panel2: TPanel;
    pnlDadosUsuarios: TPanel;
    cxLabel7: TcxLabel;
    lblUsuario: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxLabel24: TcxLabel;
    cxLabel4: TcxLabel;
    edtLogin: TcxDBTextEdit;
    edtSenha: TcxDBTextEdit;
    chbTrocarSenha: TcxDBCheckBox;
    lcxClientePrincipal: TcxDBLookupComboBox;
    lbxGrupoSistema: TcxLookupComboBox;
    btnCadGrupo: TcxButton;
    btnExcluir: TcxButton;
    chbSituacao: TcxDBCheckBox;
    btnAtualizaGrupo: TcxButton;
    btnCancelarCopia: TcxButton;
    btnConfirmarCopiaGrupo: TcxButton;
    sqlPessoaVinculada: TI9Query;
    dtsPessoaVinculada: TDataSource;
    SimpleDataSet1: TI9Query;
    FMTBCDField3: TBCDField;
    StringField5: TStringField;
    StringField6: TStringField;
    DataSource1: TDataSource;
    sqlPessoaVinculadaNOME: TStringField;
    sqlPessoaVinculadaPESSOA_ID: TBCDField;
    ClientAncestralPESSOAS_VINCULADAS: TStringField;
    btnAdicionarPessoa: TcxButton;
    btnLimparPessoa: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecutePesquisaExecute(Sender: TObject);
    procedure btnAtualizaGrupoClick(Sender: TObject);
    procedure grdRotinasDBTableView1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure grdRotinasDBTableView1CustomDrawGroupCell
      (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure ClientAncestralAfterOpen(DataSet: TDataSet);
    procedure ClientAncestralBeforeOpen(DataSet: TDataSet);
    procedure pagPrincipalChange(Sender: TObject);
    procedure btnConfirmarCopiaGrupoClick(Sender: TObject);
    procedure btnCadGrupoClick(Sender: TObject);
    procedure sqlRotinaCalcFields(DataSet: TDataSet);
    procedure sqlRotinaBeforePost(DataSet: TDataSet);
    procedure sqlRotinaAfterPost(DataSet: TDataSet);
    procedure sqlMenuAfterScroll(DataSet: TDataSet);
    procedure sqlMenuAfterOpen(DataSet: TDataSet);
    procedure sqlMenuBeforeOpen(DataSet: TDataSet);
    procedure lcbGruposPropertiesChange(Sender: TObject);
    procedure CopirarPermisso1Click(Sender: TObject);
    procedure btnCancelarCopiaClick(Sender: TObject);
    procedure MarcarEste1Click(Sender: TObject);
    procedure DesmarcarEste1Click(Sender: TObject);
    procedure MarcarTodos1Click(Sender: TObject);
    procedure DesmarcarTodos1Click(Sender: TObject);
    procedure grdRotinasDBTableView1CustomDrawCell
      (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btnExcluirClick(Sender: TObject);
    procedure ExecuteCancelarExecute(Sender: TObject);
    procedure btnAdicionarPessoaClick(Sender: TObject);
    procedure btnLimparPessoaClick(Sender: TObject);
    procedure lcxClientePrincipalPropertiesEditValueChanged(Sender: TObject);
    procedure chbTrocarSenhaClick(Sender: TObject);
  private
    { Private declarations }
    vlAlterando: Boolean;
    vg_sistema_rotina_id: String;
    procedure Validar;
    procedure SetaPermissaoGrupo;
    procedure VerificarPessoasVinculadas(vpPessoasId: String);
  public
    { Public declarations }
    vgQuery: TI9Query;
    function Permissao: String;
    procedure SetState(AState: TDataSetState); override;
    procedure LoadData; override;
  end;

var
  frmUsuario: TfrmUsuario;

implementation

uses Cadastro, Controles, Pesquisa, Rotinas, Lookup, CapturarBiometria,
  RotinasFingkey, PessoaPreCadastro, Pessoa;

{$R *.dfm}

procedure TfrmUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  vlAlterando := False;
  sqlRotina.Connection := dtmControles.DB;
  sqlGrupo.Connection := dtmControles.DB;
  sqlGrupoUsuario.Connection := dtmControles.DB;
  sqlMenu.Connection := dtmControles.DB;
  sqlPessoaVinculada.Connection := dtmControles.DB;

  ClientAncestral.Open;

  sqlGrupo.Close;
  sqlGrupo.Params[0].AsInteger := vgId;
  sqlGrupo.Open;

  sqlMenu.Close;
  sqlMenu.Params[0].AsInteger := vgId;
  sqlMenu.Open;

  lcbGrupos.EditValue := sqlGrupoUSUARIO_GRUPO_ID.AsInteger;

  sqlGrupoUsuario.Close;
  sqlGrupoUsuario.Open;

  lcbGrupos.EditValue := sqlGrupoUSUARIO_GRUPO_ID.AsInteger;

  vgChavePrimaria := 'USUARIO_ID';
  vgNomeTabela := 'G_USUARIO';
  pagPrincipal.ActivePage := tbsUsuario;

  grdRotinasDBTableView1DBColumn1.Visible := vgLogin = 'I937';
end;

procedure TfrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientAncestral.Close;
  sqlRotina.Close;
  sqlGrupoUsuario.Close;
  sqlPessoaVinculada.Close;

  inherited;

  Action := caFree;
  frmUsuario := nil;
  ExecGravar := nil;
end;

procedure TfrmUsuario.LoadData;
begin
  inherited;
  if Trim(vgChave) <> '' then
    ClientAncestral.Locate('USUARIO_ID', vgChave, [loCaseInsensitive]);
end;

procedure TfrmUsuario.SetState(AState: TDataSetState);
begin
  inherited;
  grdUsuario.Enabled := State = dsBrowse;
  pnlDadosUsuarios.Enabled := not(State = dsBrowse);
  pagPrincipal.Pages[1].TabVisible := grdUsuario.Enabled;
end;

procedure TfrmUsuario.btnExcluirClick(Sender: TObject);
begin
  inherited;
  dtmControles.ExecSQL('DELETE FROM G_USUARIO_SISTEMA ' + 'WHERE SISTEMA_ID = '
    + IntToStr(vgId) + '  AND USUARIO_ID = ' +
    ClientAncestralUSUARIO_ID.AsString);
  lbxGrupoSistema.EditValue := null;
end;

procedure TfrmUsuario.btnLimparPessoaClick(Sender: TObject);
begin
  inherited;
  ClientAncestralPESSOA_ID.AsVariant := null;
end;

procedure TfrmUsuario.chbTrocarSenhaClick(Sender: TObject);
begin
  inherited;
  if chbTrocarSenha.Checked then
    ClientAncestralSENHA.AsString := '';
end;

procedure TfrmUsuario.ExecuteGravarExecute(Sender: TObject);
var
  viSql, viIDGrupo: String;
begin
  Validar;

  if Trim(lbxGrupoSistema.Text) <> '' then
    viIDGrupo := IntToStr(lbxGrupoSistema.EditValue)
  else
    viIDGrupo := '';

  vlAlterando := False;

  inherited;

  viSql := ' DELETE FROM G_USUARIO_SISTEMA ' + ' WHERE SISTEMA_ID = ' +
    IntToStr(vgId) + '   AND USUARIO_ID = ' +
    ClientAncestralUSUARIO_ID.AsString;
  dtmControles.ExecSQL(viSql);

  if Trim(viIDGrupo) <> '' then
  begin
    viSql := 'INSERT INTO G_USUARIO_SISTEMA ( SISTEMA_ID, USUARIO_ID, USUARIO_GRUPO_ID) '
      + 'VALUES ( ' + IntToStr(vgId) + ', ' + ClientAncestralUSUARIO_ID.AsString
      + ', ' + viIDGrupo + ')';
    dtmControles.ExecSQL(viSql);
    lbxGrupoSistema.EditValue := StrToInt(viIDGrupo)
  end;
end;

procedure TfrmUsuario.Validar;
begin
  VerificarPreenchimentoEDT_DB(edtLogin.Text, 'Login', edtLogin);

  if ClientAncestralSITUACAO.AsString = 'A' then
    VerificarPreenchimentoLCX_TX(lbxGrupoSistema.Text, 'Grupo',
      lbxGrupoSistema);
end;

procedure TfrmUsuario.VerificarPessoasVinculadas(vpPessoasId: String);
var
  viSql: String;
begin
  sqlPessoaVinculada.Active := False;
  if (vpPessoasId = '') then
    exit;

  viSql := ' SELECT NOME, PESSOA_ID ' + ' FROM J_PESSOA ' +
    ' WHERE (NOT PESSOA_FUNCAO_ID IS NULL) AND (PESSOA_FUNCAO_ID > 0) ';
  if ClientAncestralPESSOA_ID.AsVariant <> null then
    viSql := viSql + ' AND NOT PESSOA_ID = ' +
      ClientAncestralPESSOA_ID.AsString;

  if vpPessoasId <> 'S' then
    viSql := viSql + ' AND PESSOA_ID IN (' + vpPessoasId + ')';

  sqlPessoaVinculada.SQL.Text := viSql;
  sqlPessoaVinculada.Active := True;
end;

procedure TfrmUsuario.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;

  vlAlterando := True;

  ClientAncestralSITUACAO.AsString := 'A';
  ClientAncestralTROCARSENHA.AsString := 'S';
  edtLogin.SetFocus;
end;

procedure TfrmUsuario.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;

  vlAlterando := True;
  pagPrincipal.ActivePage := tbsUsuario;
  edtLogin.SetFocus;
end;

procedure TfrmUsuario.ExecuteCancelarExecute(Sender: TObject);
begin
  vlAlterando := False;
  inherited;
end;

procedure TfrmUsuario.ExecutePesquisaExecute(Sender: TObject);
begin
  inherited;
  vgChave := PesqUsuario;
  LoadData;
end;

procedure TfrmUsuario.btnAdicionarPessoaClick(Sender: TObject);
begin
  inherited;
  vgPessoa.PessoaTipo := 'F';
  vgPessoa.CPF_CNPJ := '';
  vgPessoa.Selecionar := True;
  vgPessoa.PessoaTipoVinculo := '6:Padrão';
  vgPessoa.Nome := '';

  frmPessoaPreCadastro := TfrmPessoaPreCadastro.Create(self);
  frmPessoaPreCadastro.ShowModal;
  if vgPessoa.PessoaId = -1 then
    exit;

  vgCadastrarFuncao := True;
  vgNovoCadastro := True;
  vgPessoa.PessoaId := 0;
  frmCadPessoa := TfrmCadPessoa.Create(self);
  frmCadPessoa.ShowModal;

  if vgPessoa.PessoaId > 0 then
    ClientAncestralPESSOA_ID.AsInteger := vgPessoa.PessoaId;
end;

procedure TfrmUsuario.btnAtualizaGrupoClick(Sender: TObject);
begin
  inherited;
  sqlRotina.Close;
  sqlGrupo.Close;
  sqlRotina.Open;
  sqlGrupo.Open;
end;

procedure TfrmUsuario.SetaPermissaoGrupo;
var
  AuxPer, Sql, Aux, Per: String;
begin
  AuxPer := Permissao;
  vg_sistema_rotina_id := sqlRotinaSISTEMA_ROTINA_ID.AsString;

  Aux := ' usuario_grupo_id = ' + IntToStr(lcbGrupos.EditValue) +
    ' and sistema_rotina_id = ' + vg_sistema_rotina_id;

  if Trim(vg_sistema_rotina_id) <> '' then
  begin
    if AuxPer = '000000' then
    begin
      Sql := ' Delete from g_permissao_grupo ' + ' Where ' + Aux;
      dtmControles.ExecSQL(Sql);
    end
    else
    begin
      Per := dtmControles.GetStr
        ('SELECT PERMISSAO FROM G_PERMISSAO_GRUPO WHERE ' + Aux);
      if Per = '' then
      begin
        Sql := ' insert into g_permissao_grupo (usuario_grupo_id, sistema_rotina_id, permissao) '
          + ' values (' + IntToStr(lcbGrupos.EditValue) + ',' +
          vg_sistema_rotina_id + ',' + QuotedStr(AuxPer) + ')';
        dtmControles.ExecSQL(Sql);
      end
      else if Per <> AuxPer then
      begin
        Sql := ' update g_permissao_grupo set permissao = ' + QuotedStr(AuxPer)
          + ' where ' + Aux;
        dtmControles.ExecSQL(Sql);
      end;
    end;
  end;
end;

procedure TfrmUsuario.grdRotinasDBTableView1CellClick
  (Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  vg_sistema_rotina_id := sqlRotinaSISTEMA_ROTINA_ID.AsString;
end;

procedure TfrmUsuario.grdRotinasDBTableView1CustomDrawGroupCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if vg_sistema_rotina_id <> '' then
  begin
    vg_sistema_rotina_id := '';
  end;
end;

procedure TfrmUsuario.ClientAncestralAfterScroll(DataSet: TDataSet);
var
  Sql: String;
begin
  inherited;
  if ClientAncestralUSUARIO_ID.AsString <> '' then
  begin
    Sql := 'SELECT USUARIO_GRUPO_ID FROM G_USUARIO_SISTEMA ' +
      'WHERE SISTEMA_ID = ' + IntToStr(vgId) + '  AND USUARIO_ID = ' +
      ClientAncestralUSUARIO_ID.AsString;
    lbxGrupoSistema.EditValue := dtmControles.GetInt(Sql);
  end;
end;

procedure TfrmUsuario.ClientAncestralAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
end;

procedure TfrmUsuario.ClientAncestralBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  ClientAncestral.AfterScroll := nil;
end;

procedure TfrmUsuario.pagPrincipalChange(Sender: TObject);
begin
  inherited;
  if pagPrincipal.ActivePage = tbsPermissao then
    lcbGrupos.EditValue := lbxGrupoSistema.EditValue;
end;

procedure TfrmUsuario.btnConfirmarCopiaGrupoClick(Sender: TObject);
var
  Aux, AuxPer, Sql: String;
begin
  inherited;
  if Trim(lbxGrupoDestino.Text) <> '' then
  begin
    if lbxGrupoDestino.EditValue <> lcbGrupos.EditValue then
    begin
      if Application.MessageBox
        ('Confirma a copia das permissões para este grupo?', 'Atenção',
        MB_OK + MB_YESNO) = ID_YES then
      begin
        sqlRotina.First;
        sqlRotina.DisableControls;
        while not sqlRotina.Eof do
        begin
          AuxPer := RetZeros(sqlRotinaPERMISSAO.AsString, 6);

          Aux := ' usuario_grupo_id = ' + IntToStr(lbxGrupoDestino.EditValue) +
            ' and sistema_rotina_id = ' + sqlRotinaSISTEMA_ROTINA_ID.AsString;

          if AuxPer = '000000' then
          begin
            Sql := ' Delete from g_permissao_grupo ' + ' Where ' + Aux;
          end
          else if dtmControles.GetInt
            ('select usuario_grupo_id from g_permissao_grupo where ' + Aux) <> 0
          then
          begin
            Sql := ' update g_permissao_grupo set permissao = ' +
              QuotedStr(AuxPer) + ' where ' + Aux;
          end
          else
          begin
            Sql := ' insert into g_permissao_grupo (usuario_grupo_id, sistema_rotina_id, permissao) '
              + ' values (' + IntToStr(lbxGrupoDestino.EditValue) + ',' +
              sqlRotinaSISTEMA_ROTINA_ID.AsString + ',' +
              QuotedStr(AuxPer) + ')';
          end;
          dtmControles.ExecSQL(Sql);
          sqlRotina.Next;
        end;
        Application.MessageBox('Copia realizada com sucesso!', 'Atenção',
          MB_OK + MB_ICONEXCLAMATION);
        sqlRotina.EnableControls;
      end;
    end
    else
      Application.MessageBox('Grupo de destino igual ao de origem!', 'Atenção',
        MB_OK + MB_ICONWARNING);
  end
  else
    Application.MessageBox('Grupo de destino não selecionado!', 'Atenção',
      MB_OK + MB_ICONWARNING);

end;

procedure TfrmUsuario.btnCadGrupoClick(Sender: TObject);
var
  Aux: String;
begin
  inherited;
  Aux := vgPermissaoRotina;
  vgChaveRetorno := 0;
  CadUsuarioGrupo(True);
  sqlGrupoUsuario.Refresh;
  if vgChaveRetorno <> 0 then
    lbxGrupoSistema.EditValue := vgChaveRetorno;
  vgPermissaoRotina := Aux;
end;

procedure TfrmUsuario.sqlRotinaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if (sqlRotinaPERMISSAO.AsString <> '') then
  begin
    sqlRotinapIncluir.AsString := sqlRotinaPERMISSAO.AsString[1];
    sqlRotinapAlterar.AsString := sqlRotinaPERMISSAO.AsString[2];
    sqlRotinapExcluir.AsString := sqlRotinaPERMISSAO.AsString[3];
    sqlRotinapPesquisar.AsString := sqlRotinaPERMISSAO.AsString[4];
    sqlRotinapRelatorio.AsString := sqlRotinaPERMISSAO.AsString[5];
    sqlRotinapEspecial.AsString := sqlRotinaPERMISSAO.AsString[6];
  end;
end;

procedure TfrmUsuario.sqlRotinaBeforePost(DataSet: TDataSet);
begin
  inherited;
  sqlRotinaPERMISSAO.AsString := Permissao;
end;

procedure TfrmUsuario.sqlRotinaAfterPost(DataSet: TDataSet);
begin
  inherited;
  SetaPermissaoGrupo;
end;

function TfrmUsuario.Permissao: String;
var
  AuxPer: String;
begin
  inherited;
  AuxPer := '';
  AuxPer := concat(AuxPer, RetZeros(sqlRotinapIncluir.AsString, 1));
  AuxPer := concat(AuxPer, RetZeros(sqlRotinapAlterar.AsString, 1));
  AuxPer := concat(AuxPer, RetZeros(sqlRotinapExcluir.AsString, 1));
  AuxPer := concat(AuxPer, RetZeros(sqlRotinapPesquisar.AsString, 1));
  AuxPer := concat(AuxPer, RetZeros(sqlRotinapRelatorio.AsString, 1));
  AuxPer := concat(AuxPer, RetZeros(sqlRotinapEspecial.AsString, 1));
  Result := AuxPer;
end;

procedure TfrmUsuario.sqlMenuAfterScroll(DataSet: TDataSet);
begin
  inherited;
  sqlRotina.Close;
  sqlRotina.Params[0].AsInteger := sqlGrupoUSUARIO_GRUPO_ID.AsInteger;
  sqlRotina.Params[1].AsInteger := sqlMenuSISTEMA_MENU_ID.AsInteger;
  sqlRotina.Open;
end;

procedure TfrmUsuario.sqlMenuAfterOpen(DataSet: TDataSet);
begin
  inherited;
  sqlMenu.AfterScroll := sqlMenuAfterScroll;
end;

procedure TfrmUsuario.sqlMenuBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  sqlMenu.AfterScroll := nil;
end;

procedure TfrmUsuario.lcbGruposPropertiesChange(Sender: TObject);
begin
  inherited;
  sqlMenuAfterScroll(sqlMenu);
end;

procedure TfrmUsuario.lcxClientePrincipalPropertiesEditValueChanged
  (Sender: TObject);
begin
  inherited;
  if vlAlterando then
    ClientAncestralPESSOAS_VINCULADAS.AsString := '';
end;

procedure TfrmUsuario.CopirarPermisso1Click(Sender: TObject);
begin
  inherited;
  pnlCopiarPermissoa.Visible := True;
  Panel1.Enabled := False;
end;

procedure TfrmUsuario.btnCancelarCopiaClick(Sender: TObject);
begin
  inherited;
  pnlCopiarPermissoa.Visible := False;
  Panel1.Enabled := True;
end;

procedure TfrmUsuario.MarcarEste1Click(Sender: TObject);
var
  Per: String;
begin
  inherited;

  if Pos('CAD_', sqlRotinaCHAVE_ROTINA.AsString) <> 0 then
    Per := '1'
  else
    Per := '0';

  sqlRotina.Edit;
  sqlRotinapIncluir.AsString := Per;
  sqlRotinapAlterar.AsString := Per;
  sqlRotinapExcluir.AsString := Per;
  sqlRotinapPesquisar.AsString := Per;

  if Pos('REL_', sqlRotinaCHAVE_ROTINA.AsString) <> 0 then
    sqlRotinapRelatorio.AsString := '1'
  else
    sqlRotinapRelatorio.AsString := '0';

  if Pos('ESP_', sqlRotinaCHAVE_ROTINA.AsString) <> 0 then
    sqlRotinapEspecial.AsString := '1'
  else
    sqlRotinapEspecial.AsString := '0';

  sqlRotina.Post;

end;

procedure TfrmUsuario.DesmarcarEste1Click(Sender: TObject);
begin
  inherited;
  sqlRotina.Edit;
  sqlRotinapIncluir.AsString := '0';
  sqlRotinapAlterar.AsString := '0';
  sqlRotinapExcluir.AsString := '0';
  sqlRotinapPesquisar.AsString := '0';
  sqlRotinapRelatorio.AsString := '0';
  sqlRotinapEspecial.AsString := '0';
  sqlRotina.Post;
end;

procedure TfrmUsuario.MarcarTodos1Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox
    ('Deseja MARCAR as permissões de todas as rotinas selecionadas?', 'Atenção',
    MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    sqlRotina.DisableControls;
    sqlRotina.First;
    while not sqlRotina.Eof do
    begin
      MarcarEste1Click(nil);
      sqlRotina.Next;
    end;
    sqlRotina.EnableControls;
  end;
end;

procedure TfrmUsuario.DesmarcarTodos1Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox
    ('Deseja DESMARCAR as permissão de todas as rotinas selecionadas?',
    'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    sqlRotina.DisableControls;
    sqlRotina.First;
    while not sqlRotina.Eof do
    begin
      DesmarcarEste1Click(nil);
      sqlRotina.Next;
    end;
    sqlRotina.EnableControls;
  end;
end;

procedure TfrmUsuario.grdRotinasDBTableView1CustomDrawCell
  (Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if Pos('REL_', AViewInfo.RecordViewInfo.GridRecord.Values[7]) <> 0 then
  begin
    if (AViewInfo.Item.Caption <> 'Imp.') and
      (AViewInfo.Item.Caption <> 'Rotina') and
      (AViewInfo.Item.Caption <> 'Chave Rotina') then
    begin
      ACanvas.Brush.Color := clGray;
      AViewInfo.Item.Editing := False;
    end
  end
  else if Pos('ESP_', AViewInfo.RecordViewInfo.GridRecord.Values[7]) <> 0 then
  begin
    if (AViewInfo.Item.Caption <> 'Esp.') and
      (AViewInfo.Item.Caption <> 'Rotina') and
      (AViewInfo.Item.Caption <> 'Chave Rotina') then
    begin
      ACanvas.Brush.Color := clGray;
      AViewInfo.Item.Editing := False;
    end;
  end
  else
  begin
    if (AViewInfo.Item.Caption = 'Imp.') or (AViewInfo.Item.Caption = 'Esp.')
    then
    begin
      ACanvas.Brush.Color := clGray;
      AViewInfo.Item.Editing := False;
    end;
  end;
end;

end.
