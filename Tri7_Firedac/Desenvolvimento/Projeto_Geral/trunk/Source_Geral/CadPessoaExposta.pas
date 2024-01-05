unit CadPessoaExposta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, I9Query, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit,
  cxCalendar, cxDBEdit, cxTextEdit, cxGroupBox, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, cxLabel;

type
  TfrmCadPessoaExposta = class(TForm)
    sqlG_PESSOA_EXPOSTA: TI9Query;
    dtsG_PESSOA_EXPOSTA: TDataSource;
    sqlG_PESSOA_EXPOSTAPESSOA_EXPOSTA_ID: TBCDField;
    sqlG_PESSOA_EXPOSTANOME: TStringField;
    sqlG_PESSOA_EXPOSTASIGLA: TStringField;
    sqlG_PESSOA_EXPOSTAFUNCAO: TStringField;
    sqlG_PESSOA_EXPOSTANIVEL_FUNCAO: TStringField;
    sqlG_PESSOA_EXPOSTADATA_INICIO_EXERCICIO: TSQLTimeStampField;
    sqlG_PESSOA_EXPOSTADATA_FIM_EXERCICIO: TSQLTimeStampField;
    sqlG_PESSOA_EXPOSTADATA_FIM_CARENCIA: TSQLTimeStampField;
    sqlG_PESSOA_EXPOSTACPF_AUXILIAR: TStringField;
    sqlG_PESSOA_EXPOSTANOME_ORGAO: TStringField;
    sqlG_PESSOA_EXPOSTAUSUARIO_ID: TBCDField;
    sqlG_PESSOA_EXPOSTADATA_REGISTRO: TSQLTimeStampField;
    sqlG_PESSOA_EXPOSTACPF: TStringField;
    Panel2: TPanel;
    lblInformaca: TcxLabel;
    Panel4: TPanel;
    imgTitulo: TImage;
    Panel6: TPanel;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    grbDadosPEP: TcxGroupBox;
    edtNome: TcxDBTextEdit;
    edtFuncao: TcxDBTextEdit;
    edtOrgao: TcxDBTextEdit;
    edtSigla: TcxDBTextEdit;
    edtDataIniExercicio: TcxDBDateEdit;
    edtDataFimExercicio: TcxDBDateEdit;
    edtDataCarencia: TcxDBDateEdit;
    lblDataIniExercicio: TcxLabel;
    lblDataFimExercicio: TcxLabel;
    lblDataCarencia: TcxLabel;
    lblFuncao: TcxLabel;
    lbNome: TcxLabel;
    lblOrgao: TcxLabel;
    lblSigla: TcxLabel;
    sqlG_PESSOA_EXPOSTATIPO_REGISTRO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ValidarDados;
  public
    { Public declarations }
    procedure MontarTela(
      const vpNome: string;
      const vpCPF: string);
  end;

var
  frmCadPessoaExposta: TfrmCadPessoaExposta;

implementation

uses
  Controles;

{$R *.dfm}
{$REGION 'Constantes'}
const
  vcManual = 'M';
{$ENDREGION}

{ TfrmCadPessoaExposta }

procedure TfrmCadPessoaExposta.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmCadPessoaExposta.btnConfirmarClick(Sender: TObject);
{$REGION 'Variáveis'}
var
  viPessoaExpostaId: Integer;
{$ENDREGION}
begin
  ValidarDados;

  viPessoaExpostaId := dtmControles.GerarSequencia('G_PESSOA_EXPOSTA');

  sqlG_PESSOA_EXPOSTAPESSOA_EXPOSTA_ID.AsInteger := viPessoaExpostaId;
  sqlG_PESSOA_EXPOSTAUSUARIO_ID.AsInteger        := StrToInt(vgUsuarioID);
  sqlG_PESSOA_EXPOSTADATA_REGISTRO.AsDateTime    := dtmControles.DataHoraBanco(3);
  sqlG_PESSOA_EXPOSTATIPO_REGISTRO.AsString      := vcManual;
  sqlG_PESSOA_EXPOSTA.Post;
  sqlG_PESSOA_EXPOSTA.ApplyUpdates(-1);

  ModalResult := mrOk;
end;

procedure TfrmCadPessoaExposta.FormActivate(Sender: TObject);
begin
  edtNome.SetFocus;
end;

procedure TfrmCadPessoaExposta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlG_PESSOA_EXPOSTA.Close;
end;

procedure TfrmCadPessoaExposta.FormCreate(Sender: TObject);
begin
  sqlG_PESSOA_EXPOSTA.Connection := dtmControles.DB;
end;

procedure TfrmCadPessoaExposta.MontarTela(
  const vpNome: string;
  const vpCPF: string);
begin
  sqlG_PESSOA_EXPOSTA.Active := False;
  sqlG_PESSOA_EXPOSTA.ParamByName('CPF').AsString := vpCPF;
  sqlG_PESSOA_EXPOSTA.Active := True;

  sqlG_PESSOA_EXPOSTA.Edit;
  sqlG_PESSOA_EXPOSTANOME.AsString         := vpNome;
  sqlG_PESSOA_EXPOSTACPF.AsString          := vpCPF;
  sqlG_PESSOA_EXPOSTACPF_AUXILIAR.AsString := Copy(vpCPF, 4, 6);
end;

procedure TfrmCadPessoaExposta.ValidarDados;
begin
  VerificarPreenchimentoDTA_DB(edtDataIniExercicio.Text, 'Data de Inicio de Exercício', edtDataIniExercicio);
  VerificarPreenchimentoDTA_DB(edtDataFimExercicio.Text, 'Data de Fim de Exercício', edtDataFimExercicio);

  {$REGION 'Data de Inicio de Exercício'}
  if not sqlG_PESSOA_EXPOSTADATA_INICIO_EXERCICIO.IsNull then
  begin
    if edtDataIniExercicio.Date > edtDataFimExercicio.Date then
    begin
      Application.MessageBox('Data de inicio de exercício não pode ser maior que a data de fim de exercício!', 'Atenção', MB_OK + MB_ICONWARNING);
      edtDataIniExercicio.SetFocus;
      Abort;
    end;

    if edtDataIniExercicio.Date > edtDataCarencia.Date then
    begin
      Application.MessageBox('Data de Inicio de exercício não pode ser maior que a data de carência!', 'Atenção', MB_OK + MB_ICONWARNING);
      edtDataIniExercicio.SetFocus;
      Abort;
    end;
  end;
  {$ENDREGION}

  {$REGION 'Data de Fim de Exercício'}
  if not sqlG_PESSOA_EXPOSTADATA_FIM_EXERCICIO.IsNull then
  begin
    if edtDataFimExercicio.Date < edtDataIniExercicio.Date then
    begin
      Application.MessageBox('Data de fim de exercício não pode ser menor que a data de inicio de exercício!', 'Atenção', MB_OK + MB_ICONWARNING);
      edtDataFimExercicio.SetFocus;
      Abort;
    end;

    if edtDataFimExercicio.Date > edtDataCarencia.Date then
    begin
      Application.MessageBox('Data de fim de exercício não pode ser maior que a data de carência!', 'Atenção', MB_OK + MB_ICONWARNING);
      edtDataFimExercicio.SetFocus;
      Abort;
    end;
  end;
  {$ENDREGION}

  {$REGION 'Data de Carência'}
  if not sqlG_PESSOA_EXPOSTADATA_FIM_CARENCIA.IsNull then
  begin
    if edtDataCarencia.Date < dtmControles.DataHoraBanco(4) then
    begin
      Application.MessageBox('Data de carência não pode ser inferior a data atual!', 'Atenção', MB_OK + MB_ICONWARNING);
      edtDataCarencia.SetFocus;
      Abort;
    end;

    if edtDataCarencia.Date < edtDataFimExercicio.Date then
    begin
      Application.MessageBox('Data de carência não pode ser menor que a data de fim de exercício!', 'Atenção', MB_OK + MB_ICONWARNING);
      edtDataCarencia.SetFocus;
      Abort;
    end;

    if edtDataCarencia.Date < edtDataIniExercicio.Date then
    begin
      Application.MessageBox('Data de carência não pode ser menor que a data de inicio de exercício!', 'Atenção', MB_OK + MB_ICONWARNING);
      edtDataCarencia.SetFocus;
      Abort;
    end;
  end;
  {$ENDREGION}
end;

end.
