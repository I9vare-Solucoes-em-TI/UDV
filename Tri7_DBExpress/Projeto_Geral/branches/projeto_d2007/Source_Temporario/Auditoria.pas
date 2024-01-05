unit Auditoria;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxDBLookupComboBox, cxImageComboBox,
  ExtCtrls, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxDropDownEdit, cxCalendar, StdCtrls, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxTextEdit, cxContainer, cxGroupBox,
  cxLookAndFeelPainters, cxButtons, DBClient, SimpleDS, ComCtrls,
  cxSplitter, WPRTEDefs, WPCTRMemo, WPCTRRich, FrameEditorSimples, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, Menus;

type
  TfrmAuditoria = class(TForm)
    grdAuditoria: TcxGrid;
    grdAuditoriaDBTableView1: TcxGridDBTableView;
    grdAuditoriaLevel1: TcxGridLevel;
    Panel1: TPanel;
    Shape1: TShape;
    cxGroupBox1: TcxGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cxGroupBox3: TcxGroupBox;
    sqlFuncionario: TI9Query;
    sqlFuncionarioUSUARIO_ID: TBCDField;
    sqlFuncionarioLOGIN: TStringField;
    dtsFuncionario: TDataSource;
    sqlAuditoria: TI9Query;
    dsAuditoria: TDataSource;
    grdAuditoriaDBTableView1TABELA: TcxGridDBColumn;
    grdAuditoriaDBTableView1CAMPO: TcxGridDBColumn;
    grdAuditoriaDBTableView1OPERACAO: TcxGridDBColumn;
    grdAuditoriaDBTableView1DATA: TcxGridDBColumn;
    grdAuditoriaDBTableView1USUARIO_ID: TcxGridDBColumn;
    grdAuditoriaDBTableView1ID: TcxGridDBColumn;
    grdAuditoriaDBTableView1OBSERVACAO: TcxGridDBColumn;
    sqlAuditoriaHISTORICO_ID: TBCDField;
    sqlAuditoriaTABELA: TStringField;
    sqlAuditoriaCAMPO: TStringField;
    sqlAuditoriaOPERACAO: TStringField;
    sqlAuditoriaNEW_VALUE: TBlobField;
    sqlAuditoriaDATA: TSQLTimeStampField;
    sqlAuditoriaUSUARIO_ID: TBCDField;
    sqlAuditoriaID: TBCDField;
    cxSplitter4: TcxSplitter;
    sqlAuditoriaOBSERVACAO: TStringField;
    cxGroupBox2: TcxGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edtDataInicio: TcxDateEdit;
    edtDataFim: TcxDateEdit;
    lcxUsuario: TcxLookupComboBox;
    edtObservacao: TcxTextEdit;
    edtID: TcxTextEdit;
    fmeEditorSimples1: TfmeEditorSimples;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    btnFechar: TcxButton;
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

procedure TfrmAuditoria.sqlAuditoriaAfterScroll(DataSet: TDataSet);
begin
  if vgControle then
     fmeEditorSimples1.wptTexto.AsString := DeCompressString(sqlAuditoriaNEW_VALUE.AsString);
end;

procedure TfrmAuditoria.sqlAuditoriaBeforeOpen(DataSet: TDataSet);
begin
  vgControle := False;
end;

procedure TfrmAuditoria.sqlAuditoriaAfterOpen(DataSet: TDataSet);
begin
  vgControle := True;;
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
  edtDataInicio.Clear;
  edtDataFim.Clear;
  lcxUsuario.EditValue := Null;
  edtObservacao.Clear;
  edtID.Clear;
end;

procedure TfrmAuditoria.FormCreate(Sender: TObject);
begin
  sqlFuncionario.Connection := dtmControles.DB;
  sqlAuditoria.Connection   := dtmControles.DB;
  sqlFuncionario.Close;
  sqlFuncionario.Params[0].AsInteger := vgId;
  sqlFuncionario.Open;
end;

procedure TfrmAuditoria.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #27 : begin
            Key := #0;
            if Application.MessageBox('Deseja fechar este formulário?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
               Close;
          end;
    #13 : begin
            Key := #0;
            PostMessage (Handle, WM_NEXTDLGCTL, 0, 0);
          end;
  end; {case}
end;

procedure TfrmAuditoria.btnPesquisarClick(Sender: TObject);
var Sql, SqlAux, Tabela  : String;
begin
  if edtDataInicio.Date > edtDataFim.Date then
  begin
    Application.MessageBox('Período inicial maior que o final!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtDataInicio.SetFocus;
    Abort;
  end;

  case vgId of
    1: Tabela := 'R_HISTORICO';
    2: Tabela := 'T_HISTORICO';
    5: Tabela := 'C_HISTORICO';
    7: Tabela := 'D_HISTORICO';
  end;

  SqlAux := '';
  if (edtDataInicio.Text <> '  /  /    ') and (edtDataFim.Text <> '  /  /    ') then
     SqlAux := ' WHERE DATA ' +  MontarSqlData(edtDataInicio.Date , edtDataFim.Date);

  if lcxUsuario.EditValue <> null then
  begin
    if SqlAux = '' then
       SqlAux := ' WHERE USUARIO_ID = ' + IntToStr(lcxUsuario.EditValue)
    else SqlAux := SqlAux +  ' AND USUARIO_ID = ' + IntToStr(lcxUsuario.EditValue);
  end;

  if Trim(edtObservacao.Text) <> '' then
  begin
    if SqlAux = '' then
       SqlAux := ' WHERE OBSERVACAO like ' + QuotedStr('%' + edtObservacao.Text + '%')
    else SqlAux :=  SqlAux + ' AND OBSERVACAO LIKE ' + QuotedStr('%' + edtObservacao.Text + '%');
  end;

  if Trim(edtID.Text) <> '' then
  begin
    if SqlAux = '' then
       SqlAux := ' WHERE ID = ' + edtID.Text
    else SqlAux :=  SqlAux + ' AND ID = ' + edtID.Text;
  end;

  if SqlAux = '' then
  begin
    Application.MessageBox('Deve ser informado pelo menos um parâmetro para pesquisa!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtDataInicio.SetFocus;
    Abort;
  end;

  Sql := ' SELECT * FROM ' + Tabela + ' ' + SqlAux + ' ORDER BY DATA';

  sqlAuditoria.Close;
  sqlAuditoria.SQL.Text := Sql;
  sqlAuditoria.Open;
end;

procedure TfrmAuditoria.edtIDKeyPress(Sender: TObject; var Key: Char);
begin
  DigitaInteiro(Key);
end;

procedure TfrmAuditoria.FormShow(Sender: TObject);
begin
  edtDataInicio.SetFocus;
end;

end.
