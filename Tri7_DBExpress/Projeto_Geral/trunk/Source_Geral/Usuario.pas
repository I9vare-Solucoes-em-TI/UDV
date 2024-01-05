unit Usuario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  cxGraphics,
  cxEdit, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  cxTextEdit, cxDBEdit, cxContainer, cxLabel, cxCheckBox,
  cxMaskEdit, cxDropDownEdit, DBCtrls, SimpleDS,
  cxDBLookupComboBox, cxLookupEdit, cxDBLookupEdit, cxPC,
  ImgList, Menus, Buttons, Grids, DBGrids,
  System.Actions,
  Data.DBXInterBase, cxCurrencyEdit,

  cxGroupBox,
  Vcl.ExtDlgs, cxImage, cxRadioGroup, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, cxDBData, cxImageComboBox, DbxDevartInterBase;

type
  TfrmUsuario = class(TfrmCadBasico)
    pagPrincipal: TcxPageControl;
    tbsUsuario: TcxTabSheet;
    tbsPermissao: TcxTabSheet;
    sqlGrupo: TSimpleDataSet;
    sqlGrupoUSUARIO_GRUPO_ID: TFMTBCDField;
    sqlGrupoDESCRICAO: TStringField;
    sqlGrupoSITUACAO: TStringField;
    dtsGrupo: TDataSource;
    dsRotina: TDataSource;
    sqlGrupoUsuario: TSimpleDataSet;
    FMTBCDField1: TFMTBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    dtsGrupoUsuario: TDataSource;
    ImageList1: TImageList;
    ClientAncestralUSUARIO_ID: TFMTBCDField;
    ClientAncestralTROCARSENHA: TStringField;
    ClientAncestralLOGIN: TStringField;
    ClientAncestralSENHA: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralNOME_COMPLETO: TStringField;
    ClientAncestralFUNCAO: TStringField;
    ClientAncestralASSINA: TStringField;
    ClientAncestralSIGLA: TStringField;
    sqlMenu: TSimpleDataSet;
    dtsMenu: TDataSource;
    sqlMenuSISTEMA_MENU_ID: TFMTBCDField;
    sqlMenuDESCRICAO: TStringField;
    sqlMenuSISTEMA_ID: TFMTBCDField;
    PopupMenu1: TPopupMenu;
    CopirarPermisso1: TMenuItem;
    PopupMenu2: TPopupMenu;
    MarcarTodos1: TMenuItem;
    DesmarcarTodos1: TMenuItem;
    MarcarEste1: TMenuItem;
    DesmarcarEste1: TMenuItem;
    N1: TMenuItem;
    sqlRotina: TSimpleDataSet;
    sqlRotinaCHAVE_ROTINA: TStringField;
    sqlRotinaSISTEMA_MENU_ID: TFMTBCDField;
    sqlRotinaDESCROTINA: TStringField;
    sqlRotinaSISTEMA_ROTINA_ID: TFMTBCDField;
    sqlRotinaPERMISSAO: TStringField;
    sqlRotinapIncluir: TStringField;
    sqlRotinapAlterar: TStringField;
    sqlRotinapExcluir: TStringField;
    sqlRotinapPesquisar: TStringField;
    sqlRotinapRelatorio: TStringField;
    sqlRotinapEspecial: TStringField;
    ClientAncestralCOMISSAO: TFMTBCDField;
    ClientAncestralALERTA_SELO_MINIMO: TStringField;
    ClientAncestralEMAIL: TStringField;
    pnlDadosUsuarios: TPanel;
    sqlUsuariosPesquisa: TSimpleDataSet;
    dtsUsuariosPesquisa: TDataSource;
    sqlUsuariosPesquisaNOME_COMPLETO: TStringField;
    sqlUsuariosPesquisaLOGIN: TStringField;
    sqlUsuariosPesquisaFUNCAO: TStringField;
    sqlUsuariosPesquisaASSINA: TStringField;
    sqlUsuariosPesquisaSITUACAO: TStringField;
    sqlUsuariosPesquisaUSUARIO_ID: TFMTBCDField;
    cxGroupBox2: TcxGroupBox;
    tabUsuarios: TcxTabControl;
    grdUsuario: TcxGrid;
    grdUsuarioDBTableView1: TcxGridDBTableView;
    grdUsuarioDBTableView1NOME_COMPLETO: TcxGridDBColumn;
    grdUsuarioDBTableView1LOGIN: TcxGridDBColumn;
    grdUsuarioDBTableView1FUNCAO: TcxGridDBColumn;
    grdUsuarioDBTableView1ASSINA: TcxGridDBColumn;
    grdUsuarioLevel1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    sqlUsuarioSistema: TSimpleDataSet;
    dtsUsuarioSistema: TDataSource;
    sqlUsuarioSistemaSISTEMA_ID: TFMTBCDField;
    cxGridDBTableView1Column1: TcxGridDBColumn;
    sqlUsuarioSistemaDESCRICAO: TStringField;
    OpenPictureDialog1: TOpenPictureDialog;
    ClientAncestralANDAMENTO_PADRAO: TFMTBCDField;
    ClientAncestralANDAMENTO_PADRAO2: TFMTBCDField;
    ClientAncestralRECEBER_MENSAGEM_ARROLAMENTO: TStringField;
    ClientAncestralASSINA_CERTIDAO: TStringField;
    ClientAncestralRECEBER_EMAIL_PENHORA: TStringField;
    ClientAncestralFOTO: TBlobField;
    ClientAncestralNAO_RECEBER_CHAT_TODOS: TStringField;
    ClientAncestralANALISTA_DOC_DIVERSO: TStringField;
    sqlSistemaUsuario: TSimpleDataSet;
    dtsSistemaUsuario: TDataSource;
    sqlSistemaUsuarioUSUARIO_ID: TFMTBCDField;
    sqlSistemaUsuarioNOME_COMPLETO: TStringField;
    sqlSistemaUsuarioLOGIN: TStringField;
    sqlSistemaUsuarioFUNCAO: TStringField;
    sqlSistemaUsuarioUSUARIO_GRUPO_ID: TFMTBCDField;
    tbcSistemas: TcxTabControl;
    pgcPermissoes: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxGrid2: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBTableView2Column1: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    Panel2: TPanel;
    cxLabel4: TcxLabel;
    lbxUsuarioAdicionar: TcxLookupComboBox;
    lbxGrupoAdicionar: TcxLookupComboBox;
    btnAdicionarUsuario: TcxButton;
    btnRemover: TcxButton;
    btnSalvar: TcxButton;
    btnCancelar: TcxButton;
    chxTodos: TcxCheckBox;
    cxTabSheet2: TcxTabSheet;
    cxGridBasica: TcxGrid;
    gridMenus: TcxGridDBTableView;
    gridMenusDESCRICAO: TcxGridDBColumn;
    cxGridBasicaLevel1: TcxGridLevel;
    grdRotinas: TcxGrid;
    grdRotinasDBTableView1: TcxGridDBTableView;
    grdRotinasDBTableView1DESCROTINA: TcxGridDBColumn;
    grdRotinasDBTableView1pIncluir: TcxGridDBColumn;
    grdRotinasDBTableView1pAlterar: TcxGridDBColumn;
    grdRotinasDBTableView1pExcluir: TcxGridDBColumn;
    grdRotinasDBTableView1pPesquisar: TcxGridDBColumn;
    grdRotinasDBTableView1pRelatorio: TcxGridDBColumn;
    grdRotinasDBTableView1pEspecial: TcxGridDBColumn;
    grdRotinasDBTableView1DBColumn1: TcxGridDBColumn;
    grdRotinasLevel1: TcxGridLevel;
    Panel1: TPanel;
    Panel3: TPanel;
    pnlCadastro: TPanel;
    pnlDadosGerais: TPanel;
    chbSituacao: TcxDBCheckBox;
    chbAssinar: TcxDBCheckBox;
    chbTrocarSenha: TcxDBCheckBox;
    cxDBCheckBox1: TcxDBCheckBox;
    pgcDadosCadastro: TcxPageControl;
    tbcDadosUsuario: TcxTabSheet;
    tbcDadosRegistro: TcxTabSheet;
    pnlFoto: TPanel;
    imgFoto: TcxDBImage;
    btnCapturar: TcxButton;
    btnAbrir: TcxButton;
    pnlDadosCadastro: TPanel;
    cxLabel2: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    edtCodigo: TcxDBTextEdit;
    edtLogin: TcxDBTextEdit;
    edtSenha: TcxDBTextEdit;
    edtSigla: TcxDBTextEdit;
    edtNome: TcxDBTextEdit;
    edtFuncao: TcxDBTextEdit;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    pnlDadosRegistro: TPanel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    lcxAndamentoPadrao: TcxDBLookupComboBox;
    lcxAndamentoPadrao2: TcxDBLookupComboBox;
    cxDBCheckBox2: TcxDBCheckBox;
    chbAnalistaDocDiverso: TcxDBCheckBox;
    cxDBCheckBox3: TcxDBCheckBox;
    chbReceberMensagem: TcxDBCheckBox;
    btnBiometria: TcxButton;
    btnLimparAndPadrao1: TcxButton;
    btnLimparAndPadrao2: TcxButton;
    pnlInforma��o: TPanel;
    pnlPermissao: TPanel;
    lcbGruposUsuario: TcxLookupComboBox;
    btnAtualizaGrupo: TcxButton;
    rdbGrupo: TcxRadioButton;
    rdbUsuario: TcxRadioButton;
    pnlCopiarPermissoa: TPanel;
    cxGroupBox3: TcxGroupBox;
    lbxGrupoDestino: TcxLookupComboBox;
    btnConfirmarCopiaGrupo: TcxButton;
    btnFecharCopia: TcxButton;
    btnCadGrupo: TcxButton;
    N2: TMenuItem;
    actExcluirPermissoDuplicada: TMenuItem;
    Panel4: TPanel;
    cxGroupBox4: TcxGroupBox;
    btnBuscarParametro: TcxButton;
    ListBox1: TListBox;
    EdtBuscar: TcxTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecutePesquisaExecute(Sender: TObject);
    procedure btnAtualizaGrupoClick(Sender: TObject);
    procedure grdRotinasDBTableView1CellClick(
      Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure grdRotinasDBTableView1CustomDrawGroupCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
    procedure ClientAncestralBeforeOpen(DataSet: TDataSet);
    procedure btnConfirmarCopiaGrupoClick(Sender: TObject);
    procedure sqlRotinaCalcFields(DataSet: TDataSet);
    procedure sqlRotinaBeforePost(DataSet: TDataSet);
    procedure sqlRotinaAfterPost(DataSet: TDataSet);
    procedure sqlMenuAfterScroll(DataSet: TDataSet);
    procedure sqlMenuAfterOpen(DataSet: TDataSet);
    procedure sqlMenuBeforeOpen(DataSet: TDataSet);
    procedure lcbGruposPropertiesChange(Sender: TObject);
    procedure CopirarPermisso1Click(Sender: TObject);
    procedure MarcarEste1Click(Sender: TObject);
    procedure DesmarcarEste1Click(Sender: TObject);
    procedure MarcarTodos1Click(Sender: TObject);
    procedure DesmarcarTodos1Click(Sender: TObject);
    procedure grdRotinasDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btnBiometriaClick(Sender: TObject);
    procedure sqlUsuariosPesquisaAfterScroll(DataSet: TDataSet);
    procedure btnCapturarClick(Sender: TObject);
    procedure btnAbrirClick(Sender: TObject);
    procedure tabUsuariosChange(Sender: TObject);
    procedure tbcSistemasChange(Sender: TObject);
    procedure pagPrincipalChange(Sender: TObject);
    procedure btnAdicionarUsuarioClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure sqlSistemaUsuarioAfterEdit(DataSet: TDataSet);
    procedure sqlSistemaUsuarioAfterScroll(DataSet: TDataSet);
    procedure btnRemoverClick(Sender: TObject);
    procedure ExecuteExcluirExecute(Sender: TObject);
    procedure pgcPermissoesChange(Sender: TObject);
    procedure ExecuteCancelarExecute(Sender: TObject);
    procedure rdbGrupoClick(Sender: TObject);
    procedure rdbUsuarioClick(Sender: TObject);
    procedure btnFecharCopiaClick(Sender: TObject);
    procedure btnCadGrupoClick(Sender: TObject);
    procedure actExcluirPermissoDuplicadaClick(Sender: TObject);
    procedure btnBuscarParametroClick(Sender: TObject);
    procedure EdtBuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    vg_Verifica, vlAlterando : Boolean;
    vg_sistema_rotina_id, vlPermissaoTabela, vlPermissaoCampo, vlPermissaoId : String;
    vlRotinaID, vlMenuId : String;
    vlPosicao : Integer;

    procedure Validar;
    procedure SetaPermissaoGrupo;
  public
    { Public declarations }
    vgQuery : TSimpleDataSet;
    function Permissao : String;
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmUsuario: TfrmUsuario;

implementation

uses Cadastro, Controles, Pesquisa, Rotinas, Lookup, CapturarBiometria,
  RotinasFingkey, CapturaFoto;

{$R *.dfm}

procedure TfrmUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  vg_Verifica := True;
  sqlRotina.Connection       := dtmControles.DB;
  sqlGrupo.Connection        := dtmControles.DB;
  sqlGrupoUsuario.Connection      := dtmControles.DB;
  sqlMenu.Connection              := dtmControles.DB;
  sqlUsuariosPesquisa.Connection  := dtmControles.DB;
  sqlUsuarioSistema.Connection    := dtmControles.DB;
  sqlSistemaUsuario.Connection    := dtmControles.DB;


  pgcDadosCadastro.ActivePageIndex := 0;
  pagPrincipal.ActivePage          := tbsUsuario;
  dtmControles.CarregarSistemasTab(tbcSistemas);
  tbcDadosRegistro.TabVisible := vgListaSistemas[0] = 1;
  if tbcDadosRegistro.TabVisible then
    dtmLookup.sqlR_TB_Tipo_Andamento.Open;

  tabUsuarios.TabIndex := 0;
  ClientAncestral.Open;
  sqlGrupoUsuario.Open;

  vgChavePrimaria := 'USUARIO_ID';
  vgNomeTabela := 'G_USUARIO';

  grdRotinasDBTableView1DBColumn1.Visible := vgLogin = 'I937';

  btnBiometria.Visible := dtmControles.BuscarConfig('PRINCIPAL','GERAL','USAR_BIOMETRIA','S') = 'S';
  tabUsuariosChange(Self);

  actExcluirPermissoDuplicada.Visible := vgLogin = 'I937'
end;

procedure TfrmUsuario.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientAncestral.Close;
  sqlRotina.Close;
  sqlGrupoUsuario.Close;
  dtmLookup.sqlUsuarioAssinante.Refresh;
  dtmLookup.sqlUsuarioSistema.Refresh;
  inherited;

  Action     := caFree;
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
  grdUsuario.Enabled       := State = dsBrowse;
  pnlDadosCadastro.Enabled := not (State = dsBrowse);
  pnlDadosRegistro.Enabled := not (State = dsBrowse);
  pnlDadosGerais.Enabled   := not (State = dsBrowse);
  pnlFoto.Enabled          := (State = dsBrowse);
  btnCapturar.Enabled      := (State = dsBrowse);
  btnAbrir.Enabled         := (State = dsBrowse);
  pagPrincipal.Pages[1].TabVisible := grdUsuario.Enabled;
end;

procedure TfrmUsuario.ExecuteGravarExecute(Sender: TObject);
var Sql, IDGrupo : String;
begin
  Validar;
  inherited;
  vlPosicao := ClientAncestralUSUARIO_ID.AsInteger;
  sqlUsuariosPesquisa.Refresh;
  sqlUsuariosPesquisa.Locate('USUARIO_ID', vlPosicao, [loCaseInsensitive]);
  vlAlterando := False;
  sqlUsuariosPesquisa.AfterScroll := sqlUsuariosPesquisaAfterScroll;
  sqlUsuariosPesquisaAfterScroll(sqlUsuariosPesquisa);
end;

procedure TfrmUsuario.Validar;
var Sql, ID : String;
begin
  if Trim(edtNome.Text) = '' then
  begin
    Application.MessageBox('Nome deve ser infomado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtNome.SetFocus;
    Abort;
  end;

  if Trim(edtLogin.Text) = '' then
  begin
    Application.MessageBox('Login deve ser infomado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtLogin.SetFocus;
    Abort;
  end;

  if Trim(edtSigla.Text) <> '' then
  begin
    Sql := 'SELECT USUARIO_ID FROM G_USUARIO WHERE SIGLA = ' + QuotedStr(edtSigla.Text);
    ID := dtmControles.GetStr(Sql);
    if ID <> '' then
       if State = dsInsert then
       begin
         Application.MessageBox('Sigla j� cadastrada para outro usu�rio!', 'Aten��o', MB_OK + MB_ICONWARNING);
         edtSigla.SetFocus;
         Abort;
       end
       else if State = dsEdit then
               if ID <> ClientAncestralUSUARIO_ID.AsString then
               begin
                 Application.MessageBox('Sigla j� cadastrada para outro usu�rio!', 'Aten��o', MB_OK + MB_ICONWARNING);
                 edtSigla.SetFocus;
                 Abort;
               end;
  end;

end;

procedure TfrmUsuario.ExecuteIncluirExecute(Sender: TObject);
begin
  vlAlterando := True;
  tbcSistemasChange(Self);
  pagPrincipal.ActivePageIndex := 0;

  inherited;
  ClientAncestralSITUACAO.AsString := 'A';
  edtLogin.SetFocus;
end;

procedure TfrmUsuario.EdtBuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 13 then
  begin
    btnBuscarParametro.SetFocus;
    btnBuscarParametroClick(self);
  end;
end;

procedure TfrmUsuario.ExecuteAlterarExecute(Sender: TObject);
begin
  vlAlterando := True;
  tbcSistemasChange(Self);
  pagPrincipal.ActivePageIndex := 0;

  inherited;
  pagPrincipal.ActivePage := tbsUsuario;
  edtLogin.SetFocus;
end;

procedure TfrmUsuario.ExecuteCancelarExecute(Sender: TObject);
begin
  inherited;
  vlAlterando := False;
  sqlUsuariosPesquisa.AfterScroll := sqlUsuariosPesquisaAfterScroll;
  sqlUsuariosPesquisaAfterScroll(sqlUsuariosPesquisa);
end;

procedure TfrmUsuario.ExecuteExcluirExecute(Sender: TObject);
begin
  inherited;
  sqlUsuariosPesquisa.AfterScroll := nil;
  sqlUsuariosPesquisa.Refresh;
  sqlUsuariosPesquisa.Locate('USUARIO_ID', vlPosicao, [loCaseInsensitive]);
  sqlUsuariosPesquisa.AfterScroll := sqlUsuariosPesquisaAfterScroll;
  sqlUsuariosPesquisaAfterScroll(sqlUsuariosPesquisa);
end;

procedure TfrmUsuario.ExecutePesquisaExecute(Sender: TObject);
begin
  inherited;
  vgChave := PesqUsuario;
  LoadData;
end;

procedure TfrmUsuario.actExcluirPermissoDuplicadaClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma exclus�o da permiss�o selecionada', 'Aten��o', MB_OK + MB_YESNO) = ID_NO then
    Exit;
  inherited;

  ExecutaSqlAuxiliar(' DELETE FROM G_PERMISSAO_USUARIO '+
                     ' WHERE SISTEMA_ROTINA_ID = '+sqlRotinaSISTEMA_ROTINA_ID.AsString, 1);

  ExecutaSqlAuxiliar(' DELETE FROM G_PERMISSAO_GRUPO '+
                     ' WHERE SISTEMA_ROTINA_ID = '+sqlRotinaSISTEMA_ROTINA_ID.AsString, 1);

  ExecutaSqlAuxiliar(' DELETE FROM G_SISTEMA_ROTINA '+
                     ' WHERE SISTEMA_ROTINA_ID = '+sqlRotinaSISTEMA_ROTINA_ID.AsString, 1);
  sqlRotina.Active := False;
  sqlRotina.Active := True;
end;

procedure TfrmUsuario.btnAbrirClick(Sender: TObject);
begin
  inherited;
  if OpenPictureDialog1.Execute then
    ClientAncestralFOTO.LoadFromFile(OpenPictureDialog1.FileName);
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
var AuxPer, Sql, Aux, Per :String;
begin
  AuxPer := Permissao;
  vg_sistema_rotina_id := sqlRotinaSISTEMA_ROTINA_ID.AsString;

  Aux    := vlPermissaoCampo +' = ' + vlPermissaoId +
           ' and sistema_rotina_id = ' + vg_sistema_rotina_id;

  if Trim(vg_sistema_rotina_id) <> '' then
  begin
    if AuxPer = '000000' then
    begin
      Sql := ' Delete from '+ vlPermissaoTabela +
             ' Where ' + Aux;
      dtmControles.ExecSQL(Sql);
    end
    else
    begin
      Per := dtmControles.GetStr('SELECT PERMISSAO FROM '+vlPermissaoTabela+' WHERE ' + Aux);
      if Per = '' then
      begin
        Sql := ' insert into '+vlPermissaoTabela+' ('+vlPermissaoCampo+', sistema_rotina_id, permissao) ' +
               ' values ('+ vlPermissaoId + ',' +
                            vg_sistema_rotina_id + ',' +
                            QuotedStr(AuxPer) + ')';
        dtmControles.ExecSQL(Sql);
      end
      else
      if Per <> AuxPer then
      begin
        Sql := ' update '+vlPermissaoTabela+' set permissao = ' + QuotedStr(AuxPer) +
               ' where ' + Aux;
        dtmControles.ExecSQL (Sql);
      end;
    end;
  end;
end;


procedure TfrmUsuario.grdRotinasDBTableView1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
  inherited;
  vg_sistema_rotina_id := sqlRotinaSISTEMA_ROTINA_ID.AsString;
end;

procedure TfrmUsuario.grdRotinasDBTableView1CustomDrawGroupCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if vg_sistema_rotina_id <> '' then
  begin
    vg_sistema_rotina_id := '';
  end;
end;

procedure TfrmUsuario.ClientAncestralBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  ClientAncestral.AfterScroll := nil;
end;

procedure TfrmUsuario.btnConfirmarCopiaGrupoClick(Sender: TObject);
var Aux, AuxPer, Sql : String;
begin
  inherited;
  if Trim(lbxGrupoDestino.Text) <> '' then
  begin
    if lbxGrupoDestino.EditValue <> lcbGruposUsuario.EditValue then
    begin
      if Application.MessageBox('Confirma a copia das permiss�es para este grupo?', 'Aten��o', MB_OK + MB_YESNO) = ID_YES then
      begin
        sqlRotina.First;
        sqlRotina.DisableControls;
        while not sqlRotina.Eof do
        begin
          AuxPer := RetZeros(sqlRotinaPERMISSAO.AsString, 6);

          Aux    := ' usuario_grupo_id = ' + IntToStr(lbxGrupoDestino.EditValue) +
                    ' and sistema_rotina_id = ' + sqlRotinaSISTEMA_ROTINA_ID.AsString;

          if AuxPer = '000000' then
          begin
            Sql := ' Delete from g_permissao_grupo ' +
                   ' Where ' + Aux;
          end
          else if dtmControles.GetInt('select usuario_grupo_id from g_permissao_grupo where ' + Aux) <> 0 then
               begin
                 Sql := ' update g_permissao_grupo set permissao = ' + QuotedStr(AuxPer) +
                        ' where ' + Aux;
               end
               else begin
                    Sql := ' insert into g_permissao_grupo (usuario_grupo_id, sistema_rotina_id, permissao) ' +
                           ' values ('+ IntToStr(lbxGrupoDestino.EditValue) + ',' +
                                        sqlRotinaSISTEMA_ROTINA_ID.AsString + ',' +
                                        QuotedStr(AuxPer) + ')';
               end;
          dtmControles.ExecSQL (Sql);
          sqlRotina.Next;
        end;
        Application.MessageBox('Copia realizada com sucesso!', 'Aten��o', mb_ok + MB_ICONEXCLAMATION);
        sqlRotina.EnableControls;
      end;
    end
    else Application.MessageBox('Grupo de destino igual ao de origem!', 'Aten��o', mb_ok + MB_ICONWARNING);
  end
  else Application.MessageBox('Grupo de destino n�o selecionado!', 'Aten��o', mb_ok + MB_ICONWARNING);

end;

procedure TfrmUsuario.btnFecharCopiaClick(Sender: TObject);
begin
  inherited;
  pnlCopiarPermissoa.Visible := False;
  pnlPermissao.Enabled       := True;
end;

procedure TfrmUsuario.btnRemoverClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Remover Acesso do Usuario Selecionado do Sistema?', 'Aten��o', MB_OK + MB_YESNO) = ID_NO then
    Exit;

  ExecutaSqlAuxiliar(' DELETE FROM G_USUARIO_SISTEMA '+
                     ' WHERE USUARIO_ID = '+ sqlSistemaUsuarioUSUARIO_ID.AsString+
                     '   AND USUARIO_GRUPO_ID = '+IntToStr(sqlSistemaUsuarioUSUARIO_GRUPO_ID.OldValue),1);
  sqlSistemaUsuario.Refresh;
end;

procedure TfrmUsuario.btnSalvarClick(Sender: TObject);
begin
  inherited;
  sqlSistemaUsuario.DisableControls;
  vlPosicao := sqlSistemaUsuarioUSUARIO_ID.AsInteger;
  sqlSistemaUsuario.First;
  while not sqlSistemaUsuario.Eof do
  begin
    if sqlSistemaUsuarioUSUARIO_GRUPO_ID.AsInteger <>  sqlSistemaUsuarioUSUARIO_GRUPO_ID.OldValue then
    begin
      ExecutaSqlAuxiliar(' UPDATE G_USUARIO_SISTEMA SET USUARIO_GRUPO_ID = '+ sqlSistemaUsuarioUSUARIO_GRUPO_ID.AsString +
                         ' WHERE USUARIO_ID = '+ sqlSistemaUsuarioUSUARIO_ID.AsString+
                         '   AND USUARIO_GRUPO_ID = '+IntToStr(sqlSistemaUsuarioUSUARIO_GRUPO_ID.OldValue),1);
    end;
    sqlSistemaUsuario.Next;
  end;

  sqlSistemaUsuario.CancelUpdates;
  sqlSistemaUsuario.Refresh;
  sqlSistemaUsuario.Locate('USUARIO_ID', vlPosicao, [loCaseInsensitive]);
  sqlSistemaUsuario.EnableControls;
  btnCancelarClick(self);
end;

procedure TfrmUsuario.btnAdicionarUsuarioClick(Sender: TObject);
var
  viSql : String;

  procedure AdicionarUsuario(vpSistema : string);
  begin
    viSql := ' INSERT INTO G_USUARIO_SISTEMA ( SISTEMA_ID, USUARIO_ID, USUARIO_GRUPO_ID) '+
             ' VALUES ( ' + vpSistema + ', ' +
                            IntToStr(lbxUsuarioAdicionar.EditValue) + ', ' +
                            IntToStr(lbxGrupoAdicionar.EditValue) + ')';
    dtmControles.ExecSQL(viSql);
  end;

  procedure AdicionarUsuarioSistemas;
  var
    viExiste : Boolean;
  begin
    if Application.MessageBox(PChar('Adicionar Usu�rio em Todos os Sistemas. Confirma?'),
                                    'Aten��o', MB_OK + MB_YESNO) = ID_NO then
      Exit;

    with  dtmLookup.sqlSistema do
    begin
      First;
      while not eof do
      begin
        // Verifica se existe o usuario no sistema;
        viExiste := dtmControles.GetInt(' SELECT SISTEMA_ID FROM G_USUARIO_SISTEMA '+
                                        ' WHERE USUARIO_ID = '+ IntToStr(lbxUsuarioAdicionar.EditValue)+
                                        '   AND SISTEMA_ID = '+FieldByName('SISTEMA_ID').AsString) > 0;
        if not viExiste then
          AdicionarUsuario(FieldByName('SISTEMA_ID').AsString);
        Next;
      end;
    end;
  end;

begin
  inherited;
  VerificarPreenchimentoLCX_TX(lbxUsuarioAdicionar.Text, 'Usu�rio', lbxUsuarioAdicionar);
  VerificarPreenchimentoLCX_TX(lbxGrupoAdicionar.Text, 'Grupo', lbxGrupoAdicionar);

  if not chxTodos.Checked then
  begin
    if sqlSistemaUsuario.Locate('USUARIO_ID', lbxUsuarioAdicionar.EditValue, [loCaseInsensitive]) then
    begin
      Application.MessageBox('Usu�rio ja vinculado neste sistema!', 'Aten��o', MB_OK + MB_ICONWARNING);
      lbxUsuarioAdicionar.SetFocus;
      exit;
    end;

    if Application.MessageBox(PChar('Adicionar Usu�rio no Sistema de '+tbcSistemas.Tabs[tbcSistemas.TabIndex].Caption+'. Confirma?'),
                                    'Aten��o', MB_OK + MB_YESNO) = ID_NO then
      Exit;
    AdicionarUsuario(IntToStr(vgListaSistemas[tbcSistemas.TabIndex]));
  end
  else AdicionarUsuarioSistemas;

  sqlSistemaUsuario.Refresh;
  sqlSistemaUsuario.Locate('USUARIO_ID', sqlSistemaUsuarioUSUARIO_ID.AsInteger, [loCaseInsensitive]);
  lbxUsuarioAdicionar.Clear;
  lbxGrupoAdicionar.Clear;
  chxTodos.Checked := False;
  lbxUsuarioAdicionar.SetFocus;
end;

procedure TfrmUsuario.sqlRotinaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if (sqlRotinaPERMISSAO.AsString <> '') then
  begin
    sqlRotinapIncluir.AsString   := sqlRotinaPERMISSAO.AsString[1];
    sqlRotinapAlterar.AsString   := sqlRotinaPERMISSAO.AsString[2];
    sqlRotinapExcluir.AsString   := sqlRotinaPERMISSAO.AsString[3];
    sqlRotinapPesquisar.AsString := sqlRotinaPERMISSAO.AsString[4];
    sqlRotinapRelatorio.AsString := sqlRotinaPERMISSAO.AsString[5];
    sqlRotinapEspecial.AsString  := sqlRotinaPERMISSAO.AsString[6];
  end;
end;

procedure TfrmUsuario.sqlSistemaUsuarioAfterEdit(DataSet: TDataSet);
begin
  inherited;
  btnSalvar.Visible   := True;
  btnCancelar.Visible := True;
  btnRemover.Enabled  := False;
  btnAdicionarUsuario.Enabled := False;
end;

procedure TfrmUsuario.sqlSistemaUsuarioAfterScroll(DataSet: TDataSet);
begin
  inherited;
  btnRemover.Enabled := sqlSistemaUsuario.RecordCount > 0;
end;

procedure TfrmUsuario.sqlUsuariosPesquisaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if vlAlterando then
    exit;

  sqlUsuarioSistema.Active := False;
  sqlUsuarioSistema.DataSet.ParamByName('USUARIO_ID').AsBCD := sqlUsuariosPesquisaUSUARIO_ID.AsInteger;
  sqlUsuarioSistema.Active := True;

  ClientAncestral.Active := False;
  DataSetAncestral.ParamByName('USUARIO_ID').AsBCD := sqlUsuariosPesquisaUSUARIO_ID.AsInteger;
  ClientAncestral.Active := True;
end;

procedure TfrmUsuario.tabUsuariosChange(Sender: TObject);
  procedure SetarParametros(vpSit1, vpSit2 : string);
  begin
    sqlUsuariosPesquisa.DataSet.ParamByName('SITUACAO1').AsString := vpSit1;
    sqlUsuariosPesquisa.DataSet.ParamByName('SITUACAO2').AsString := vpSit2;
  end;
begin
  inherited;
  sqlUsuariosPesquisa.AfterScroll := nil;
  sqlUsuariosPesquisa.Active := False;
  case tabUsuarios.TabIndex of
    0 : SetarParametros('A', 'A');
    1 : SetarParametros('I', 'I');
    2 : SetarParametros('A', 'I');
  end;
  sqlUsuariosPesquisa.Active := True;
  sqlUsuariosPesquisa.AfterScroll := sqlUsuariosPesquisaAfterScroll;
  sqlUsuariosPesquisaAfterScroll(sqlUsuariosPesquisa);
end;

procedure TfrmUsuario.tbcSistemasChange(Sender: TObject);
var
  viSql : String;
begin
  inherited;
  if tbcSistemas.TabIndex = -1 then
    exit;

  if btnSalvar.Visible then
  begin
    if Application.MessageBox('Salvar Altera��es do Usu�rio?', 'Aten��o', MB_OK + MB_YESNO) = ID_NO then
         btnCancelarClick(Self)
    else btnSalvarClick(self);
  end;

  sqlSistemaUsuario.Active := False;
  sqlSistemaUsuario.DataSet.Params[0].AsBCD := vgListaSistemas[tbcSistemas.TabIndex];
  sqlSistemaUsuario.Active := True;

  sqlGrupo.Close;
  sqlGrupo.DataSet.Params[0].AsInteger := vgListaSistemas[tbcSistemas.TabIndex];
  sqlGrupo.Open;

  viSql := ' select * from G_SISTEMA_MENU '+
           ' where SISTEMA_ID = '+ IntToStr(vgListaSistemas[tbcSistemas.TabIndex]);
  if vlMenuId <> '' then
    viSql := viSql + ' AND SISTEMA_MENU_ID IN ('+vlMenuId+')';

  viSql := viSql + ' order by DESCRICAO ';

  sqlMenu.Close;
  sqlMenu.DataSet.CommandText := viSql;
  sqlMenu.Open;

  if (pagPrincipal.ActivePageIndex = 1) and (pgcPermissoes.ActivePageIndex = 1) then
    if (lcbGruposUsuario.Text = '')  then
      lcbGruposUsuario.ItemIndex := 0;
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
var AuxPer : String;
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

  procedure CarregarSql;
  var
    viSql : String;
  begin
    viSql := ' SELECT R.SISTEMA_ROTINA_ID, '+
             '          R.DESCRICAO DESCROTINA, '+
             '          R.SISTEMA_MENU_ID, '+
             '          R.CHAVE_ROTINA, '+
             '          PG.PERMISSAO '+
             '   FROM G_SISTEMA_ROTINA R '+
             '   LEFT JOIN '+vlPermissaoTabela+' PG ON '+
             '        R.SISTEMA_ROTINA_ID = PG.SISTEMA_ROTINA_ID AND '+
             '        PG.'+vlPermissaoCampo+' = '+ vlPermissaoId+
             ' WHERE R.SISTEMA_MENU_ID = '+ sqlMenuSISTEMA_MENU_ID.AsString;

    if vlRotinaID <> '' then
      viSql := viSql + ' AND R.SISTEMA_ROTINA_ID IN ('+vlRotinaID+')';

    viSql := viSql + ' ORDER BY  R.DESCRICAO ';

    sqlRotina.Close;
    sqlRotina.DataSet.CommandText := viSql;
    sqlRotina.Open;
  end;

begin
  inherited;
  if lcbGruposUsuario.Text = '' then
  begin
    sqlRotina.Active := False;
    exit;
  end;

  CarregarSql;
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
  pnlInforma��o.Caption := 'Nenhuma Grupo e/ou Usu�rio Selecionado';
  if lcbGruposUsuario.EditValue = null then
       vlPermissaoId := '0'
  else vlPermissaoId := IntToStr(lcbGruposUsuario.EditValue);

  sqlMenuAfterScroll(sqlMenu);

  if rdbGrupo.Checked then
       pnlInforma��o.Caption := '    Permiss�o do Grupo '+AnsiUpperCase(lcbGruposUsuario.Text) + ' - '+MaiusculoMinusculo(tbcSistemas.Tabs[tbcSistemas.TabIndex].Caption)
  else pnlInforma��o.Caption := '    Permiss�o Individual do Usu�rio '+AnsiUpperCase(lcbGruposUsuario.Text) + ' - '+MaiusculoMinusculo(tbcSistemas.Tabs[tbcSistemas.TabIndex].Caption);
end;

procedure TfrmUsuario.CopirarPermisso1Click(Sender: TObject);
begin
  inherited;
  if rdbUsuario.Checked then
  begin
    Application.MessageBox('Selecione a Permiss�o por Grupo pra realizar esta opera��o!!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  pnlCopiarPermissoa.Visible := True;
  pnlPermissao.Enabled       := False;
end;

procedure TfrmUsuario.rdbGrupoClick(Sender: TObject);
begin
  inherited;
  vlPermissaoTabela := 'G_PERMISSAO_GRUPO';
  vlPermissaoCampo  := 'USUARIO_GRUPO_ID';
  lcbGruposUsuario.Properties.ListFieldNames := '';
  lcbGruposUsuario.Properties.KeyFieldNames  := '';
  lcbGruposUsuario.Properties.ListSource     := dtsGrupo;
  lcbGruposUsuario.Properties.ListFieldNames := 'DESCRICAO';
  lcbGruposUsuario.Properties.KeyFieldNames  := 'USUARIO_GRUPO_ID';
  lcbGruposUsuario.ItemIndex := 0;
end;

procedure TfrmUsuario.rdbUsuarioClick(Sender: TObject);
begin
  inherited;
  vlPermissaoTabela := 'G_PERMISSAO_USUARIO';
  vlPermissaoCampo  := 'USUARIO_ID';
  lcbGruposUsuario.Properties.ListFieldNames := '';
  lcbGruposUsuario.Properties.KeyFieldNames  := '';
  lcbGruposUsuario.Properties.ListSource     := dtsSistemaUsuario;
  lcbGruposUsuario.Properties.ListFieldNames := 'NOME_COMPLETO';
  lcbGruposUsuario.Properties.KeyFieldNames  := 'USUARIO_ID';

  if not sqlUsuarioSistema.IsEmpty then
       lcbGruposUsuario.EditValue := sqlSistemaUsuarioUSUARIO_ID.AsInteger
  else lcbGruposUsuario.ItemIndex := 0;
end;

procedure TfrmUsuario.pgcPermissoesChange(Sender: TObject);
begin
  inherited;
  if pgcPermissoes.ActivePageIndex = 1 then
  begin
    vlRotinaID := '';
    vlMenuId   := '';
    EdtBuscar.Clear;

    rdbGrupo.Checked := true;
    rdbGrupoClick(Self);
    lcbGruposUsuario.EditValue := sqlSistemaUsuarioUSUARIO_GRUPO_ID.AsInteger;
  end;

  if lcbGruposUsuario.Text = '' then
    lcbGruposUsuario.ItemIndex := 0;
end;

procedure TfrmUsuario.btnCadGrupoClick(Sender: TObject);
var
  Aux : String;
begin
  inherited;
  Aux :=  vgPermissaoRotina;
  vgChaveRetorno := 0;
  CadUsuarioGrupo(True);
  sqlGrupoUsuario.Refresh;
  if vgChaveRetorno <> 0 then
     lbxGrupoAdicionar.EditValue := vgChaveRetorno;
  vgPermissaoRotina := Aux;
end;

procedure TfrmUsuario.btnCancelarClick(Sender: TObject);
begin
  inherited;
  btnSalvar.Visible   := False;
  btnCancelar.Visible := False;
  btnRemover.Enabled  := True;
  btnAdicionarUsuario.Enabled := True;
  sqlSistemaUsuario.CancelUpdates;
end;

procedure TfrmUsuario.btnCapturarClick(Sender: TObject);
begin
  inherited;
  if frmCapturaFoto = nil then
    Application.CreateForm(TfrmCapturaFoto, frmCapturaFoto);

  if vgClose then
       frmCapturaFoto.Close
  else frmCapturaFoto.ShowModal;

  if vgImagemCapturada then
  begin
    ClientAncestral.Edit;
    ClientAncestralFOTO.LoadFromFile(extractFilePath(Application.ExeName)+'ImgFoto.jpg');
    ClientAncestral.ApplyUpdates(-1);
  end;
end;

procedure TfrmUsuario.MarcarEste1Click(Sender: TObject);
var Per : String;
begin
  inherited;

  if Pos('CAD_', sqlRotinaCHAVE_ROTINA.AsString) <> 0 then
     Per := '1'
  else Per := '0';

  sqlRotina.Edit;
  sqlRotinapIncluir.AsString   := Per;
  sqlRotinapAlterar.AsString   := Per;
  sqlRotinapExcluir.AsString   := Per;
  sqlRotinapPesquisar.AsString := Per;

  if Pos('REL_', sqlRotinaCHAVE_ROTINA.AsString) <> 0 then
     sqlRotinapRelatorio.AsString := '1'
  else sqlRotinapRelatorio.AsString := '0';

  if Pos('ESP_', sqlRotinaCHAVE_ROTINA.AsString) <> 0 then
     sqlRotinapEspecial.AsString := '1'
  else sqlRotinapEspecial.AsString := '0';

  sqlRotina.Post;

end;

procedure TfrmUsuario.DesmarcarEste1Click(Sender: TObject);
begin
  inherited;
  sqlRotina.Edit;
  sqlRotinapIncluir.AsString   := '0';
  sqlRotinapAlterar.AsString   := '0';
  sqlRotinapExcluir.AsString   := '0';
  sqlRotinapPesquisar.AsString := '0';
  sqlRotinapRelatorio.AsString := '0';
  sqlRotinapEspecial.AsString  := '0';
  sqlRotina.Post;
end;

procedure TfrmUsuario.MarcarTodos1Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja MARCAR as permiss�es de todas as rotinas selecionadas?', 'Aten��o', MB_YESNO + MB_ICONQUESTION) = IDYES then
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

procedure TfrmUsuario.pagPrincipalChange(Sender: TObject);
begin
  inherited;
  if pagPrincipal.ActivePageIndex = 1 then
  begin
    rdbGrupoClick(Self);
    pgcPermissoes.ActivePageIndex := 0;
    lbxUsuarioAdicionar.Clear;
    lbxGrupoAdicionar.Clear;
    tbcSistemas.TabIndex := 0;
    tbcSistemasChange(self);
    lbxUsuarioAdicionar.SetFocus;
  end
  else
  begin
    sqlUsuariosPesquisa.AfterScroll := nil;
    sqlUsuariosPesquisa.Refresh;
    sqlUsuariosPesquisa.AfterScroll := sqlUsuariosPesquisaAfterScroll;
    sqlUsuariosPesquisaAfterScroll(sqlUsuariosPesquisa);
  end;
end;

procedure TfrmUsuario.DesmarcarTodos1Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja DESMARCAR as permiss�o de todas as rotinas selecionadas?', 'Aten��o', MB_YESNO + MB_ICONQUESTION) = IDYES then
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

procedure TfrmUsuario.grdRotinasDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if Pos('REL_',AViewInfo.RecordViewInfo.GridRecord.Values[7]) <> 0 then
  begin
    if (AViewInfo.Item.Caption <> 'Imp.') and (AViewInfo.Item.Caption <> 'Rotina') and (AViewInfo.Item.Caption <> 'Chave Rotina') then
    begin
      ACanvas.Brush.Color    := clGray;
      AviewInfo.item.Editing := False;
    end
  end
  else
  if Pos('ESP_',AViewInfo.RecordViewInfo.GridRecord.Values[7]) <> 0 then
  begin
    if (AViewInfo.Item.Caption <> 'Esp.') and (AViewInfo.Item.Caption <> 'Rotina') and (AViewInfo.Item.Caption <> 'Chave Rotina') then
    begin
      ACanvas.Brush.Color    := clGray;
      AviewInfo.item.Editing := False;
    end;
  end
  else
  begin
    if (AViewInfo.Item.Caption = 'Imp.') or (AViewInfo.Item.Caption = 'Esp.') then
    begin
      ACanvas.Brush.Color    := clGray;
      AviewInfo.item.Editing := False;
    end;
  end;
end;

procedure TfrmUsuario.btnBiometriaClick(Sender: TObject);
begin
  inherited;
  vlVetBiometria.NomeTabela   := 'G_BIOMETRIA_USUARIO';
  vlVetBiometria.NomeIdTabela := 'BIOMETRIA_USUARIO_ID';
  vlVetBiometria.Chave_id     := ClientAncestralUSUARIO_ID.AsInteger;
  ExibirFormulario(TfrmCapturarBiometria, frmCapturarBiometria, True);
end;

procedure TfrmUsuario.btnBuscarParametroClick(Sender: TObject);
begin
  inherited;
  vlMenuId   := '';
  vlRotinaID := '';
  ExecutaSqlAuxiliar(' SELECT SISTEMA_ROTINA_ID, SISTEMA_MENU_ID '+
                     ' FROM G_SISTEMA_ROTINA '+
                     ' WHERE (CHAVE_ROTINA LIKE '+QuotedStr('%'+EdtBuscar.Text+'%')+')'+
                     '    OR (UPPER(DESCRICAO) LIKE '+QuotedStr('%'+EdtBuscar.Text+'%')+')',0);

  if dtmControles.sqlAuxiliar.IsEmpty then
  begin
    Application.MessageBox('Nenhum par�metro encontrado!!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  While not dtmControles.sqlAuxiliar.Eof do
  begin
    if vlMenuId <> '' then
      vlMenuId := vlMenuId+',';
    vlMenuId   := vlMenuId + dtmControles.sqlAuxiliar.FieldByName('SISTEMA_MENU_ID').AsString;

    if vlRotinaID <> '' then
      vlRotinaID := vlRotinaID+',';
    vlRotinaID := vlRotinaID + dtmControles.sqlAuxiliar.FieldByName('SISTEMA_ROTINA_ID').AsString;

    dtmControles.sqlAuxiliar.Next;
  end;

  tbcSistemasChange(SELF);
end;

end.
