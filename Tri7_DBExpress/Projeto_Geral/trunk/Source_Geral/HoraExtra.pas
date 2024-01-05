unit HoraExtra;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, dxSkinOffice2007Black, dxSkinOffice2007Blue, cxGridExportLink,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinscxPCPainter, dxBarBuiltInMenu, Menus, cxContainer, cxEdit, ComCtrls,
  dxCore, cxDateUtils, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, DB, cxDBData, cxMaskEdit, cxLabel, Buttons, ExtCtrls,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxTextEdit, cxCalendar, StdCtrls, cxGroupBox,
  cxButtons, cxPC, DBClient, SimpleDS, cxTimeEdit, DbxDevartInterBase;

type
  TfrmHoraExtra = class(TForm)
    pagControle: TcxPageControl;
    tbsPesquisa: TcxTabSheet;
    tbsCadastro: TcxTabSheet;
    cxGroupBox2: TcxGroupBox;
    gbxPeriodo: TcxGroupBox;
    Label8: TLabel;
    edtDtPesqIni: TcxDateEdit;
    edtDtPesqFim: TcxDateEdit;
    cxGroupBox4: TcxGroupBox;
    grdPesquisa: TcxGrid;
    gridPesquisa: TcxGridDBTableView;
    grdPesquisaLevel1: TcxGridLevel;
    lcbUsuarioPesquisa: TcxLookupComboBox;
    Panel1: TPanel;
    grdListagem: TcxGrid;
    grdListagemDBTableView1: TcxGridDBTableView;
    grdListagemLevel1: TcxGridLevel;
    Panel2: TPanel;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    pnlGravar: TPanel;
    Panel4: TPanel;
    btnUsuario: TBitBtn;
    cxLabel4: TcxLabel;
    edtDtHoraExtra: TcxDateEdit;
    cxLabel5: TcxLabel;
    edtHoraInicio: TcxMaskEdit;
    cxGroupBox1: TcxGroupBox;
    lcbUsuarioSelecao: TcxLookupComboBox;
    cxGridDBTableView1NOME_COMPLETO: TcxGridDBColumn;
    sqlUsuario: TClientDataSet;
    dtsUsuario: TDataSource;
    sqlUsuarioHorario: TSimpleDataSet;
    dtsUsuarioHorario: TDataSource;
    sqlUsuarioHorarioUSUARIO_ID: TFMTBCDField;
    sqlUsuarioHorarioNOME_COMPLETO: TStringField;
    sqlUsuarioHorarioHORA_FIM: TStringField;
    sqlUsuarioUSUARIO_ID: TFMTBCDField;
    sqlUsuarioNOME_COMPLETO: TStringField;
    sqlUsuarioHORA_FIM: TStringField;
    grdListagemDBTableView1NOME_COMPLETO: TcxGridDBColumn;
    sqlHoraExtra: TSimpleDataSet;
    dtsHoraExtra: TDataSource;
    sqlHoraExtraHORA_EXTRA_ID: TFMTBCDField;
    sqlHoraExtraDATA_HORA_EXTRA: TSQLTimeStampField;
    sqlHoraExtraUSUARIO_ID: TFMTBCDField;
    sqlHoraExtraHORA_INICIO: TStringField;
    sqlHoraExtraHORA_FIM: TStringField;
    gridPesquisaDATA_HORA_EXTRA: TcxGridDBColumn;
    gridPesquisaUSUARIO_ID: TcxGridDBColumn;
    gridPesquisaHORA_INICIO: TcxGridDBColumn;
    gridPesquisaHORA_FIM: TcxGridDBColumn;
    gridPesquisaTOTAL: TcxGridDBColumn;
    PopupMenu1: TPopupMenu;
    EcluirHoraExtraSelecionada1: TMenuItem;
    grdListagemDBTableView1HORA_FIM: TcxGridDBColumn;
    sqlHoraExtraTOTAL: TStringField;
    Label1: TLabel;
    btnPlanilha: TcxButton;
    btnExcel: TcxButton;
    btnFechar: TcxButton;
    btnConfirmar: TcxButton;
    cxLabel1: TcxLabel;
    edtHoraFim: TcxMaskEdit;
    cxLabel2: TcxLabel;
    edtHoraExtra: TcxMaskEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure EcluirHoraExtraSelecionada1Click(Sender: TObject);
    procedure btnUsuarioClick(Sender: TObject);
    procedure sqlUsuarioAfterDelete(DataSet: TDataSet);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnPlanilhaClick(Sender: TObject);
    procedure edtHoraFimExit(Sender: TObject);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function Validar : Boolean;
  public
    { Public declarations }
  end;

var
  frmHoraExtra: TfrmHoraExtra;

implementation

uses Controles, Lookup, Rotinas;

{$R *.dfm}

procedure TfrmHoraExtra.btnConfirmarClick(Sender: TObject);
var
  viSql : String;
begin
  if edtDtHoraExtra.Date <= 0 then
  begin
    Application.MessageBox('Data hora extra deve ser informada!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtDtHoraExtra.SetFocus;
    Abort;
  end;

  if edtHoraInicio.Text = '  :  :  ' then
  begin
    Application.MessageBox('Horário inicio deve ser informada!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtHoraInicio.SetFocus;
    Abort;
  end;

  if edtHoraFim.Text = '  :  :  ' then
  begin
    Application.MessageBox('Horário fim deve ser informada!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtHoraFim.SetFocus;
    Abort;
  end;

  if edtHoraExtra.Text = '  :  :  ' then
  begin
    Application.MessageBox('Hora extra deve ser informada!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtDtHoraExtra.SetFocus;
    Abort;
  end;

  if Application.MessageBox('Confirma gravar hora extra?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    dtmControles.StartTransaction;
    try
      sqlUsuario.First;
      while not sqlUsuario.Eof do
      begin
        if Validar then
        begin
          viSql := 'INSERT INTO G_HORA_EXTRA ( ' +
                   '    HORA_EXTRA_ID, ' +
                   '    DATA_HORA_EXTRA, ' +
                   '    USUARIO_ID, ' +
                   '    HORA_INICIO, ' +
                   '    HORA_FIM, ' +
                   '    TOTAL) ' +
                   '  VALUES (' +
                   IntToStr(dtmControles.GerarSequencia('G_HORA_EXTRA')) + ', ' +
                   QuotedStr(dtmControles.DataParaString(edtDtHoraExtra.Date)) + ', '+
                   sqlUsuarioUSUARIO_ID.AsString + ', ' +
                   QuotedStr(edtHoraInicio.Text) + ', ' +
                   QuotedStr(edtHoraFim.Text) + ', ' +
                   QuotedStr(edtDtHoraExtra.Text) + ') ';

          dtmControles.ExecSQL(viSql);
        end;
        sqlUsuario.Next;
      end;
      dtmControles.Commit;
      ShowMessage('Hora extra gravada com sucesso!');
    Except
      dtmControles.Roolback;
      ShowMessage('Erro ao tentar gravar hora extra!');
    end;
  end;

end;

procedure TfrmHoraExtra.btnExcelClick(Sender: TObject);
begin
  try
    ExportGridToExcel('C:\temp\RelTemp.xls', grdPesquisa);
    AbrirPlanilha();
  except

  end;
end;

procedure TfrmHoraExtra.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmHoraExtra.btnUsuarioClick(Sender: TObject);
var
  i : integer;
begin
  if not sqlUsuario.Locate('USUARIO_ID', sqlUsuarioHorarioUSUARIO_ID.AsInteger, []) then
  begin
    sqlUsuario.Insert;
    for i := 0 to sqlUsuario.FieldCount - 1 do
       sqlUsuario.Fields[i].Value := sqlUsuarioHorario.Fields[i].Value;
    sqlUsuario.Post;
  end
  else Application.MessageBox('Usuário já foi informado!', 'Atenção', MB_OK + MB_ICONWARNING);

  if (edtHoraInicio.Text = '  :  :  ') then
    edtHoraInicio.Text := sqlUsuarioHORA_FIM.AsString;

  pnlGravar.Visible := not sqlUsuario.IsEmpty;

  lcbUsuarioSelecao.EditValue := null;
end;

procedure TfrmHoraExtra.cxGridDBTableView1DblClick(Sender: TObject);
begin
  btnUsuarioClick(nil);
end;

procedure TfrmHoraExtra.btnPlanilhaClick(Sender: TObject);
var
  viSql : String;
begin
  if edtDtPesqIni.Date <= 0 then
  begin
    Application.MessageBox('Data inicio deve ser informada!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtDtPesqIni.SetFocus;
    Abort;
  end;

  if edtDtPesqFim.Date <= 0 then
  begin
    Application.MessageBox('Data final deve ser informada!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtDtPesqFim.SetFocus;
    Abort;
  end;

  if edtDtPesqIni.Date > edtDtPesqFim.Date then
  begin
    Application.MessageBox('Data Inicial não pode ser maior que a Data Final!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtDtPesqIni.SetFocus;
    Abort;
  end;

  viSql := ' SELECT * FROM G_HORA_EXTRA ' +
           ' WHERE DATA_HORA_EXTRA ' + MontarSqlData(edtDtPesqIni.Date, edtDtPesqFim.Date);

  if lcbUsuarioPesquisa.EditValue <> Null then
    viSql := viSql + ' AND USUARIO_ID = ' + IntToStr(lcbUsuarioPesquisa.EditValue);

  viSql := viSql + ' ORDER BY DATA_HORA_EXTRA, USUARIO_ID ';

  sqlHoraExtra.Close;
  sqlHoraExtra.DataSet.CommandText := viSql;
  sqlHoraExtra.Open;

  btnExcel.Enabled := not sqlHoraExtra.IsEmpty;

end;

procedure TfrmHoraExtra.EcluirHoraExtraSelecionada1Click(Sender: TObject);
var
  viSql : String;
begin
  if Application.MessageBox('Confirma excluir hora extra?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    try
      viSql := 'DELETE FROM G_HORA_EXTRA WHERE HORA_EXTRA_ID = ' + sqlHoraExtraHORA_EXTRA_ID.AsString;
      dtmControles.ExecSQL(viSql);
      sqlHoraExtra.Delete;
    Except
      ShowMessage('Erro ao tentar excluir hora extra!');
    end;
  end;
end;

procedure TfrmHoraExtra.edtHoraFimExit(Sender: TObject);
begin
 if edtHoraInicio.Text = '  :  :  ' then
  begin
    Application.MessageBox('Horário inicio deve ser informada!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtHoraInicio.SetFocus;
    Exit;
  end;

  if edtHoraFim.Text = '  :  :  ' then
  begin
    Application.MessageBox('Horário fim deve ser informada!', 'Atenção', MB_OK + MB_ICONWARNING);
    edtHoraFim.SetFocus;
    Exit;
  end;

 edtHoraExtra.Text := TimeToStr(StrToTime(edtHoraFim.Text) - StrToTime(edtHoraInicio.Text));
end;

procedure TfrmHoraExtra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sqlUsuario.EmptyDataSet;
  sqlHoraExtra.Close;
  sqlUsuarioHorario.Close;
  
  Action := CaFree;
  frmHoraExtra := Nil;
end;

procedure TfrmHoraExtra.FormCreate(Sender: TObject);
begin
  pagControle.ActivePage := tbsPesquisa;
  sqlUsuarioHorario.Connection := dtmControles.DB;
  sqlHoraExtra.Connection := dtmControles.DB;

  sqlUsuarioHorario.Open;

  edtDtPesqIni.Date := Date;
  edtDtPesqFim.Date := Date;
  edtDtHoraExtra.Date := Date;

  btnPlanilhaClick(nil);
end;

procedure TfrmHoraExtra.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #27 : begin
            Key := #0;
            if Application.MessageBox('Deseja fechar este formulário?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
              Close;
          end;
    #13 : begin
            if (not (ActiveControl is TMemo)) and (not (ActiveControl is TcxGridSite)) then
            begin
              Key := #0;
              PostMessage (Handle, WM_NEXTDLGCTL, 0, 0);
            end;
          end;
  end; {case}
end;

procedure TfrmHoraExtra.sqlUsuarioAfterDelete(DataSet: TDataSet);
begin
  pnlGravar.Visible := not sqlUsuario.IsEmpty;
end;

function TfrmHoraExtra.Validar: Boolean;
var
  viSql : String;
begin
  viSql := ' SELECT HORA_EXTRA_ID FROM G_HORA_EXTRA ' +
           ' WHERE DATA_HORA_EXTRA ' + MontarSqlData(edtDtHoraExtra.Date, edtDtHoraExtra.Date) +
           ' AND USUARIO_ID = ' + sqlUsuarioUSUARIO_ID.AsString;
  Result := dtmControles.GetStr(viSql) = '';
end;

end.
