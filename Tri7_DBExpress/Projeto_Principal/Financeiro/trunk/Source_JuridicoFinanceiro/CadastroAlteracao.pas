unit CadastroAlteracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  FrameCadastro;

type
  TfrmCadastroAlteracao = class(TForm)
    fmeCadastro1: TfmeCadastro;
    Panel2: TPanel;
    btnConfirmarItem: TcxButton;
    btnCancelar: TcxButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnConfirmarItemClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroAlteracao: TfrmCadastroAlteracao;

implementation

uses
  ControleRegistroDiario, Lookup;

{$R *.dfm}

procedure TfrmCadastroAlteracao.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastroAlteracao.btnConfirmarItemClick(Sender: TObject);
begin
  if Application.MessageBox(PCHAR('Confirma alteração?'),'Confirmar', MB_ICONQUESTION + MB_YESNO) = IDNO then
    exit;

  with fmeCadastro1 do
  begin
    frmControleRegistroDiario.sqlPesquisa.Edit;
    frmControleRegistroDiario.sqlPesquisaAPRESENTANTE.AsString       := edtApresentante.EditValue;
    frmControleRegistroDiario.sqlPesquisaCAIXA_SERVICO_ID.AsInteger  := lcxTipoServico.EditValue;
    frmControleRegistroDiario.sqlPesquisaDATA.AsDateTime             := edtPesqDtRegIni.EditValue;
    frmControleRegistroDiario.sqlPesquisaPROTOCOLO.AsString          := edtPesqProtocolo.EditValue;
    frmControleRegistroDiario.sqlPesquisaLIVRO.AsString              := edtLivro.EditValue;
    frmControleRegistroDiario.sqlPesquisaFOLHA.AsString              := edtFolha.EditValue;
    frmControleRegistroDiario.sqlPesquisaDESCRICAO.AsString          := edtDescricao.EditValue;
    frmControleRegistroDiario.sqlPesquisaVALOR.AsCurrency            := edtEmolumentos.EditValue;
    frmControleRegistroDiario.sqlPesquisaQTD.AsInteger               := edtQtd.EditValue;
    frmControleRegistroDiario.sqlPesquisaSELO.AsString               := edtSelo.EditValue;
    frmControleRegistroDiario.sqlPesquisa.ApplyUpdates(-1);
  end;
  close;
end;

procedure TfrmCadastroAlteracao.FormActivate(Sender: TObject);
begin
  dtmLookup.CarregarListaSistemas(fmeCadastro1.icxTipoSistema, True, True);

  with fmeCadastro1 do
  begin
    icxTipoSistema.EditValue   := frmControleRegistroDiario.sqlPesquisaSERVENTIA.AsInteger;
    edtApresentante.EditValue  := frmControleRegistroDiario.sqlPesquisaAPRESENTANTE.AsString;
    icxTipoTransacao.EditValue := frmControleRegistroDiario.sqlPesquisaOPERACAO.AsString;
    lcxTipoServico.EditValue   := frmControleRegistroDiario.sqlPesquisaCAIXA_SERVICO_ID.AsInteger;
    edtPesqDtRegIni.EditValue  := frmControleRegistroDiario.sqlPesquisaDATA.AsDateTime;
    edtPesqProtocolo.EditValue := frmControleRegistroDiario.sqlPesquisaPROTOCOLO.AsString;
    edtLivro.EditValue         := frmControleRegistroDiario.sqlPesquisaLIVRO.AsString;
    edtFolha.EditValue         := frmControleRegistroDiario.sqlPesquisaFOLHA.AsString;
    edtDescricao.EditValue     := frmControleRegistroDiario.sqlPesquisaDESCRICAO.AsString;
    edtEmolumentos.EditValue   := frmControleRegistroDiario.sqlPesquisaVALOR.AsCurrency;
    edtQtd.EditValue           := frmControleRegistroDiario.sqlPesquisaQTD.AsInteger;
    edtSelo.EditValue          := frmControleRegistroDiario.sqlPesquisaSELO.AsString;
    btnConfirmarItem.Enabled   := False;
    icxTipoSistema.Enabled     := False;
    icxTipoTransacao.Enabled   := False;
    lcxTipoServico.SetFocus;    
  end;
end;

procedure TfrmCadastroAlteracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmCadastroAlteracao := nil;
end;

end.
