unit Usuario;

interface

uses
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
  cxCurrencyEdit, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxPCdxBarPopupMenu, cxNavigator, dxSkinDevExpressDarkStyle;

type
  TfrmUsuario = class(TfrmCadBasico)
    pagPrincipal: TcxPageControl;
    tbsUsuario: TcxTabSheet;
    tbsPermissao: TcxTabSheet;
    grdRotinas: TcxGrid;
    grdRotinasDBTableView1: TcxGridDBTableView;
    grdRotinasLevel1: TcxGridLevel;
    sqlGrupo: TSimpleDataSet;
    sqlGrupoUSUARIO_GRUPO_ID: TFMTBCDField;
    sqlGrupoDESCRICAO: TStringField;
    sqlGrupoSITUACAO: TStringField;
    dsGrupo: TDataSource;
    dsRotina: TDataSource;
    sqlGrupoUsuario: TSimpleDataSet;
    FMTBCDField1: TFMTBCDField;
    StringField1: TStringField;
    StringField2: TStringField;
    dtsGrupoUsuario: TDataSource;
    pnlDadosUsuarios: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
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
    sqlMenu: TSimpleDataSet;
    dtsMenu: TDataSource;
    sqlMenuSISTEMA_MENU_ID: TFMTBCDField;
    sqlMenuDESCRICAO: TStringField;
    sqlMenuSISTEMA_ID: TFMTBCDField;
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
    cxLabel8: TcxLabel;
    chbSituacao: TcxDBCheckBox;
    chbTrocarSenha: TcxDBCheckBox;
    chbAssinar: TcxDBCheckBox;
    ClientAncestralCOMISSAO: TFMTBCDField;
    btnBiometria: TcxButton;
    edtCodigo: TcxDBTextEdit;
    edtNome: TcxDBTextEdit;
    edtLogin: TcxDBTextEdit;
    edtSigla: TcxDBTextEdit;
    edtSenha: TcxDBTextEdit;
    edtFuncao: TcxDBTextEdit;
    cxDBCurrencyEdit1: TcxDBCurrencyEdit;
    lbxGrupoSistema: TcxLookupComboBox;
    btnCadGrupo: TcxButton;
    SpeedButton4: TcxButton;
    btnAtualizaGrupo: TcxButton;
    btnConfirmarCopiaGrupo: TcxButton;
    btnCancelarPesquisarCertidao: TcxButton;
    tabUsuarios: TcxTabControl;
    grdUsuario: TcxGrid;
    grdUsuarioDBTableView1: TcxGridDBTableView;
    grdUsuarioDBTableView1USUARIO_ID: TcxGridDBColumn;
    grdUsuarioDBTableView1NOME_COMPLETO: TcxGridDBColumn;
    grdUsuarioDBTableView1LOGIN: TcxGridDBColumn;
    grdUsuarioDBTableView1SIGLA: TcxGridDBColumn;
    grdUsuarioDBTableView1FUNCAO: TcxGridDBColumn;
    grdUsuarioDBTableView1ASSINA: TcxGridDBColumn;
    grdUsuarioDBTableView1SITUACAO: TcxGridDBColumn;
    grdUsuarioLevel1: TcxGridLevel;
    PopPermissaoUsuario: TPopupMenu;
    MenuItem1: TMenuItem;
    cxDBCheckBox1: TcxDBCheckBox;
    ClientAncestralALERTA_SELO_MINIMO: TStringField;
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
    procedure btnCancelarPesquisarCertidaoClick(Sender: TObject);
    procedure MarcarEste1Click(Sender: TObject);
    procedure DesmarcarEste1Click(Sender: TObject);
    procedure MarcarTodos1Click(Sender: TObject);
    procedure DesmarcarTodos1Click(Sender: TObject);
    procedure grdRotinasDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure btnBiometriaClick(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure tabUsuariosChange(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
  private
    { Private declarations }
    vg_Verifica      : Boolean;
    vg_sistema_rotina_id : String;
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
  RotinasFingkey, PermissaoUsuario;

{$R *.dfm}

procedure TfrmUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  vg_Verifica := True;
  sqlRotina.Connection       := dtmControles.DB;
  sqlGrupo.Connection        := dtmControles.DB;
  sqlGrupoUsuario.Connection := dtmControles.DB;
  sqlMenu.Connection         := dtmControles.DB;

  tabUsuarios.TabIndex := 0;
  ClientAncestral.Open;

  sqlGrupo.Close;
  sqlGrupo.DataSet.Params[0].AsInteger := vgId;
  sqlGrupo.Open;

  sqlMenu.Close;
  sqlMenu.DataSet.Params[0].AsInteger := vgId;
  sqlMenu.Open;

  lcbGrupos.EditValue := sqlGrupoUSUARIO_GRUPO_ID.AsInteger;

  sqlGrupoUsuario.Close;
  sqlGrupoUsuario.Open;

  lcbGrupos.EditValue := sqlGrupoUSUARIO_GRUPO_ID.AsInteger;

  vgChavePrimaria := 'USUARIO_ID';
  vgNomeTabela := 'G_USUARIO';
  pagPrincipal.ActivePage := tbsUsuario;

  grdRotinasDBTableView1DBColumn1.Visible := vgLogin = 'I937';

  btnBiometria.Visible := dtmControles.BuscarConfig('PRINCIPAL','GERAL','USAR_BIOMETRIA','S') = 'S';
  tabUsuariosChange(Self);
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
  grdUsuario.Enabled  := State = dsBrowse;
  pnlDadosUsuarios.Enabled := not (State = dsBrowse);
  pagPrincipal.Pages[1].TabVisible := grdUsuario.Enabled;
end;

procedure TfrmUsuario.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  dtmControles.ExecSQL('DELETE FROM G_USUARIO_SISTEMA '+
                       'WHERE SISTEMA_ID = ' + IntToStr(vgId) +
                       '  AND USUARIO_ID = ' + ClientAncestralUSUARIO_ID.AsString);
  lbxGrupoSistema.EditValue := null;
end;

procedure TfrmUsuario.ExecuteGravarExecute(Sender: TObject);
var Sql, IDGrupo : String;
begin
  Validar;
  
  if Trim(lbxGrupoSistema.Text) <> '' then
     IDGrupo := IntToStr(lbxGrupoSistema.EditValue)
  else IDGrupo := '';
  inherited;

  Sql := 'DELETE FROM G_USUARIO_SISTEMA '+
         'WHERE SISTEMA_ID = ' + IntToStr(vgId) +
          '  AND USUARIO_ID = ' + ClientAncestralUSUARIO_ID.AsString;
  dtmControles.ExecSQL(Sql);

  if Trim(IDGrupo) <> '' then
  begin
     Sql := 'INSERT INTO G_USUARIO_SISTEMA ( SISTEMA_ID, USUARIO_ID, USUARIO_GRUPO_ID) '+
            'VALUES ( ' + IntToStr(vgId) + ', ' + ClientAncestralUSUARIO_ID.AsString + ', ' +
                          IdGrupo + ')';
     dtmControles.ExecSQL(Sql);
     lbxGrupoSistema.EditValue := StrToInt(IDGrupo)
  end;

end;

procedure TfrmUsuario.Validar;
var Sql, ID : String;
begin
  if Trim(edtNome.Text) = '' then
  begin
    Application.MessageBox('Nome deve ser infomado!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtNome.SetFocus;
    Abort;
  end;

  if Trim(edtLogin.Text) = '' then
  begin
    Application.MessageBox('Login deve ser infomado!', 'Atenção', MB_OK + MB_ICONWARNING);
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
         Application.MessageBox('Sigla já cadastrada para outro usuário!', 'Atenção', MB_OK + MB_ICONWARNING);
         edtSigla.SetFocus;
         Abort;
       end
       else if State = dsEdit then
               if ID <> ClientAncestralUSUARIO_ID.AsString then
               begin
                 Application.MessageBox('Sigla já cadastrada para outro usuário!', 'Atenção', MB_OK + MB_ICONWARNING);
                 edtSigla.SetFocus;
                 Abort;
               end;
  end;

end;

procedure TfrmUsuario.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString := 'A';
  chbSituacao.SetFocus;
end;

procedure TfrmUsuario.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  pagPrincipal.ActivePage := tbsUsuario;
  chbSituacao.SetFocus;
end;

procedure TfrmUsuario.ExecutePesquisaExecute(Sender: TObject);
begin
  inherited;
  vgChave := PesqUsuario;
  LoadData;
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

  Aux    := ' usuario_grupo_id = ' + IntToStr(lcbGrupos.EditValue) +
            ' and sistema_rotina_id = ' + vg_sistema_rotina_id;

  if Trim(vg_sistema_rotina_id) <> '' then
  begin
    if AuxPer = '000000' then
    begin
      Sql := ' Delete from g_permissao_grupo ' +
             ' Where ' + Aux;
      dtmControles.ExecSQL(Sql);
    end
    else
    begin
      Per := dtmControles.GetStr('SELECT PERMISSAO FROM G_PERMISSAO_GRUPO WHERE ' + Aux);
      if Per = '' then
      begin
        Sql := ' insert into g_permissao_grupo (usuario_grupo_id, sistema_rotina_id, permissao) ' +
               ' values ('+ IntToStr(lcbGrupos.EditValue) + ',' +
                            vg_sistema_rotina_id + ',' +
                            QuotedStr(AuxPer) + ')';
        dtmControles.ExecSQL(Sql);
      end
      else
      if Per <> AuxPer then
      begin
        Sql := ' update g_permissao_grupo set permissao = ' + QuotedStr(AuxPer) +
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

procedure TfrmUsuario.ClientAncestralAfterScroll(DataSet: TDataSet);
var Sql : String;
begin
  inherited;
  if ClientAncestralUSUARIO_ID.AsString <> '' then
  begin
    Sql := 'SELECT USUARIO_GRUPO_ID FROM G_USUARIO_SISTEMA '+
           'WHERE SISTEMA_ID = ' + IntToStr(vgId) +
           '  AND USUARIO_ID = ' + ClientAncestralUSUARIO_ID.AsString;
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
var Aux, AuxPer, Sql : String;
begin
  inherited;
  if Trim(lbxGrupoDestino.Text) <> '' then
  begin
    if lbxGrupoDestino.EditValue <> lcbGrupos.EditValue then
    begin
      if Application.MessageBox('Confirma a copia das permissões para este grupo?', 'Atenção', MB_OK + MB_YESNO) = ID_YES then
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
        Application.MessageBox('Copia realizada com sucesso!', 'Atenção', mb_ok + MB_ICONEXCLAMATION);
        sqlRotina.EnableControls;
      end;
    end
    else Application.MessageBox('Grupo de destino igual ao de origem!', 'Atenção', mb_ok + MB_ICONWARNING);
  end
  else Application.MessageBox('Grupo de destino não selecionado!', 'Atenção', mb_ok + MB_ICONWARNING);

end;

procedure TfrmUsuario.btnCadGrupoClick(Sender: TObject);
var Aux : String;
begin
  inherited;
  Aux :=  vgPermissaoRotina;
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
    sqlRotinapIncluir.AsString   := sqlRotinaPERMISSAO.AsString[1];
    sqlRotinapAlterar.AsString   := sqlRotinaPERMISSAO.AsString[2];
    sqlRotinapExcluir.AsString   := sqlRotinaPERMISSAO.AsString[3];
    sqlRotinapPesquisar.AsString := sqlRotinaPERMISSAO.AsString[4];
    sqlRotinapRelatorio.AsString := sqlRotinaPERMISSAO.AsString[5];
    sqlRotinapEspecial.AsString  := sqlRotinaPERMISSAO.AsString[6];
  end;
end;

procedure TfrmUsuario.tabUsuariosChange(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  ClientAncestral.Filtered := False;
  if tabUsuarios.TabIndex < 2 then
  begin
    if tabUsuarios.TabIndex = 0 then
         ClientAncestral.Filter := 'SITUACAO = '+QuotedStr('A')
    else ClientAncestral.Filter := 'SITUACAO = '+QuotedStr('I');
    ClientAncestral.Filtered := True;
  end;
  Screen.Cursor := crDefault;  
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
begin
  inherited;
  sqlRotina.Close;
  sqlRotina.DataSet.Params[0].AsInteger := sqlGrupoUSUARIO_GRUPO_ID.AsInteger;
  sqlRotina.DataSet.Params[1].AsInteger := sqlMenuSISTEMA_MENU_ID.AsInteger;
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

procedure TfrmUsuario.CopirarPermisso1Click(Sender: TObject);
begin
  inherited;
  pnlCopiarPermissoa.Visible := True;
  Panel1.Enabled := False;
end;

procedure TfrmUsuario.btnCancelarPesquisarCertidaoClick(Sender: TObject);
begin
  inherited;
  pnlCopiarPermissoa.Visible := False;
  Panel1.Enabled := True;
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
  if Application.MessageBox('Deseja MARCAR as permissões de todas as rotinas selecionadas?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
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

procedure TfrmUsuario.MenuItem1Click(Sender: TObject);
begin
  inherited;
  ExibirFormulario(TfrmPermissaousuario, frmPermissaousuario, true);  
end;

procedure TfrmUsuario.DesmarcarTodos1Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Deseja DESMARCAR as permissão de todas as rotinas selecionadas?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
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

end.
