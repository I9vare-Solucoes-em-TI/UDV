unit VinculoPessoaExposta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, cxCalendar,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, cxContainer, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, cxLabel, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  I9Query, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid;

type
  TfrmVinculoPessoaExposta = class(TForm)
    Panel2: TPanel;
    lblInformaca: TcxLabel;
    Panel4: TPanel;
    imgTitulo: TImage;
    Panel6: TPanel;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    dtsVinculoPessoaExposta: TDataSource;
    sqlVinculoPessoaExposta: TI9Query;
    sqlVinculoPessoaExpostaPESSOA_EXPOSTA_ID: TBCDField;
    sqlVinculoPessoaExpostaNOME: TStringField;
    sqlVinculoPessoaExpostaCPF_AUXILIAR: TStringField;
    sqlVinculoPessoaExpostaFUNCAO: TStringField;
    sqlVinculoPessoaExpostaDATA_INICIO_EXERCICIO: TSQLTimeStampField;
    sqlVinculoPessoaExpostaDATA_FIM_EXERCICIO: TSQLTimeStampField;
    sqlVinculoPessoaExpostaDATA_FIM_CARENCIA: TSQLTimeStampField;
    sqlVinculoPessoaExpostaNOME_ORGAO: TStringField;
    gridPessoaExposta: TcxGrid;
    PessoaExpostaTv1: TcxGridDBTableView;
    PessoaExpostaTv1NOME: TcxGridDBColumn;
    PessoaExpostaTv1CPF_AUXILIAR: TcxGridDBColumn;
    PessoaExpostaTv1FUNCAO: TcxGridDBColumn;
    PessoaExpostaTv1NOME_ORGAO: TcxGridDBColumn;
    PessoaExpostaTv1DATA_INICIO_EXERCICIO: TcxGridDBColumn;
    PessoaExpostaTv1DATA_FIM_EXERCICIO: TcxGridDBColumn;
    PessoaExpostaTv1DATA_FIM_CARENCIA: TcxGridDBColumn;
    PessoaExpostaLv1: TcxGridLevel;
    sqlVinculoPessoaExpostaCPF: TStringField;
    procedure btnConfirmarClick(Sender: TObject);
    procedure PessoaExpostaTv1DblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    vlCPF: string;
    procedure Selecionar;
  public
    { Public declarations }
    procedure MontarTela(
      const vpCPF: string;
      const vpCPFAuxiliar: string);
  end;

var
  frmVinculoPessoaExposta: TfrmVinculoPessoaExposta;

implementation

uses
  Controles;

{$R *.dfm}

{ TfrmVinculoPessoaExposta }

procedure TfrmVinculoPessoaExposta.btnCancelarClick(Sender: TObject);
begin
  ModalResult := mrCancel;
  Close;
end;

procedure TfrmVinculoPessoaExposta.btnConfirmarClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmVinculoPessoaExposta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlVinculoPessoaExposta.Close;
end;

procedure TfrmVinculoPessoaExposta.FormCreate(Sender: TObject);
begin
  sqlVinculoPessoaExposta.Connection := dtmControles.DB;
end;

procedure TfrmVinculoPessoaExposta.MontarTela(
  const vpCPF: string;
  const vpCPFAuxiliar: string);
begin
  vlCPF := vpCPF;

  sqlVinculoPessoaExposta.Close;
  sqlVinculoPessoaExposta.ParamByName('CPF_AUXILIAR').AsString := vpCPFAuxiliar;
  sqlVinculoPessoaExposta.Open;
end;

procedure TfrmVinculoPessoaExposta.PessoaExpostaTv1DblClick(Sender: TObject);
begin
  Selecionar;
end;

procedure TfrmVinculoPessoaExposta.Selecionar;
begin
  if sqlVinculoPessoaExposta.IsEmpty then
    Exit;

  sqlVinculoPessoaExposta.Edit;
  sqlVinculoPessoaExpostaCPF.AsString := vlCPF;
  sqlVinculoPessoaExposta.Post;

  ModalResult := mrOk;
end;

end.
