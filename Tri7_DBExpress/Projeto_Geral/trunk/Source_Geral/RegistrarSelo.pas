unit RegistrarSelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, Menus, FMTBcd,
  cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxMaskEdit, cxCalendar, cxTextEdit,
  cxControls, cxContainer, cxEdit, cxLabel, DB, DBClient, Provider, SqlExpr,
  StdCtrls, cxButtons, ExtCtrls,



  Vcl.ComCtrls, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxCore,
  cxDateUtils, DbxDevartInterBase, SimpleDS;

type
  TfrmSeloRegistrar = class(TfrmCadAuxiliar)
    cxLabel2: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel1: TcxLabel;
    edtSeloSigla: TcxTextEdit;
    edtSeloNumInicial: TcxTextEdit;
    edtQtd: TcxTextEdit;
    edtSeloNumFinal: TcxTextEdit;
    edtSeloData: TcxDateEdit;
    lcxSeloSituacao: TcxLookupComboBox;
    edtSeloDescricao: TcxTextEdit;
    edtSeloObservacao: TcxTextEdit;
    btnPesquisar: TcxButton;
    btnConfirmar: TcxButton;
    lbxUsuario: TcxLookupComboBox;
    lblUsuario: TcxLabel;
    sqlUsuarioSistema: TSimpleDataSet;
    sqlUsuarioSistemaUSUARIO_ID: TFMTBCDField;
    sqlUsuarioSistemaLOGIN: TStringField;
    dtsUsuarioSistema: TDataSource;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure lcxSeloSituacaoPropertiesEditValueChanged(Sender: TObject);
    procedure edtQtdKeyPress(Sender: TObject; var Key: Char);
    procedure edtSeloNumInicialKeyPress(Sender: TObject; var Key: Char);
    procedure edtSeloNumFinalKeyPress(Sender: TObject; var Key: Char);
    procedure edtQtdExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    vlLiberar : Boolean;
  public
    { Public declarations }
  end;

var
  frmSeloRegistrar: TfrmSeloRegistrar;

implementation

uses Controles, Rotinas, CadastroSeloLote, Lookup;

{$R *.dfm}

procedure TfrmSeloRegistrar.btnConfirmarClick(Sender: TObject);
var
  viData, viDataReserva, viUsuarioId : String;
begin
  inherited;
  VerificarPreenchimentoEDT_TX(edtSeloNumInicial.Text, 'N�mero Inicial', edtSeloNumInicial);
  VerificarPreenchimentoEDT_TX(edtSeloNumFinal.Text, 'N�mero Final', edtSeloNumFinal);
  VerificarPreenchimentoDTA_TX(edtSeloData.Text, 'Data', edtSeloData);
  VerificarPreenchimentoLCX_TX(lcxSeloSituacao.Text, 'Situa��o', lcxSeloSituacao);

  if lcxSeloSituacao.EditValue = 6 then
    VerificarPreenchimentoLCX_TX(lbxUsuario.Text, 'Usu�rio', lbxUsuario);

  // **** Valida o Controle de Numera��o
  if edtSeloNumInicial.EditingValue > edtSeloNumFinal.EditingValue then
  begin
    ShowMessage('N�mero Inicial n�o pode ser maior que o N�mero Final!!!');
    edtSeloNumInicial.SetFocus;
    exit;
  end;

  with frmCadSeloLote do
  begin
    // Verifica se a numera��o desejada existe neste lote
    if not sqlSeloLivro.Locate('NUMERO', StrToInt(edtSeloNumInicial.Text), [loCaseInsensitive]) then
    begin
      ShowMessage('N�mero Inicial n�o existe neste lote!!');
      edtSeloNumInicial.SetFocus;
      exit;
    end;

    if not sqlSeloLivro.Locate('NUMERO', StrToInt(edtSeloNumFinal.Text), [loCaseInsensitive]) then
    begin
      ShowMessage('N�mero Final n�o existe neste lote!!');
      edtSeloNumFinal.SetFocus;
      exit;
    end;
  end;

  if Application.MessageBox(Pchar('Confirma registro do(s) selo(s) da sequ�ncia '+
                                   edtSeloNumInicial.Text +' a '+ edtSeloNumFinal.Text+'?'),'Confirma��o', MB_ICONQUESTION + MB_YESNO) = IDNO then
    exit;

  if lcxSeloSituacao.EditValue > 1 then
       viData := QuotedStr(dtmControles.DataParaString(edtSeloData.EditValue))
  else viData := '';

  if lcxSeloSituacao.EditValue = 6 then
  begin
    viUsuarioId   := lbxUsuario.EditValue;
    viDataReserva := viData;
  end
  else
  begin
     viUsuarioId   := vgUsuarioID;
     viDataReserva := '';
  end;

  Screen.Cursor := crHourGlass;
  ExecutaSqlAuxiliar(' UPDATE G_SELO_LIVRO SET SELO_SITUACAO_ID = '+IntToStr(lcxSeloSituacao.EditingValue)+', '+
                     '                        DESCRICAO = '+QuotedStr(edtSeloDescricao.Text)+', '+
                     '                       OBSERVACAO = '+QuotedStr(edtSeloObservacao.Text)+', '+
                     '                       USUARIO_ID = '+viUsuarioId +', '+
                     '                             DATA = '+ RetNull(viData) +', '+
                     '                             DATA_RESERVA = '+ RetNull(viDataReserva) +', '+
                     '                           TABELA = NULL ' +', '+
                     '                         CAMPO_ID = NULL '+
                     ' WHERE SELO_LOTE_ID = '+frmCadSeloLote.ClientAncestralSELO_LOTE_ID.AsString +
                     '   AND NUMERO BETWEEN '+ edtSeloNumInicial.Text + ' AND '+ edtSeloNumFinal.Text,1);
  Screen.Cursor := crDefault;

  frmCadSeloLote.sqlSeloLivro.Refresh;
  frmCadSeloLote.sqlSeloLivro.Locate('NUMERO', StrToInt(edtSeloNumInicial.Text), [loCaseInsensitive]);
  close;
end;

procedure TfrmSeloRegistrar.edtQtdExit(Sender: TObject);
var
  viQtd, viNumeroInicial : Integer;
begin
  inherited;
  if trim(edtQtd.Text) = '' then
    edtQtd.EditValue := '1';
  viQtd := StrToInt(edtQtd.Text);
  
  if edtSeloNumInicial.Text = '' then
    edtSeloNumFinal.Text := ''
  else
  begin
    viNumeroInicial := StrToInt(edtSeloNumInicial.Text);
    edtSeloNumFinal.Text := FormatFloat('000000', (viNumeroInicial + viQtd-1));
  end;

  if StrToInt(edtSeloNumFinal.Text) > frmCadSeloLote.vgSeloUltimo then
  begin
    ShowMessage('Quantidade insuficiente para este Lote!!!');
    edtQtd.SetFocus;
  end;

  if (viQtd > (frmCadSeloLote.vgSeloDisponivel+frmCadSeloLote.vgSeloReservado+frmCadSeloLote.vgSeloUsuario)) and not vlLiberar then
  begin
    ShowMessage('A quantidade m�xima dispon�vel neste lote � '+ IntToStr(frmCadSeloLote.vgSeloDisponivel));
    edtQtd.SetFocus;
  end;

end;

procedure TfrmSeloRegistrar.edtQtdKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  DigitaInteiro(Key);
end;

procedure TfrmSeloRegistrar.edtSeloNumFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  DigitaInteiro(Key);
end;

procedure TfrmSeloRegistrar.edtSeloNumInicialKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  DigitaInteiro(Key);
end;

procedure TfrmSeloRegistrar.FormActivate(Sender: TObject);

  procedure VerificarDisponibilidadeSelo;
  begin
    if frmCadSeloLote.vgSeloDisponivel = 0 then
    begin
      edtQtd.EditValue := 1;
      edtQtd.Enabled   := False;
      vlLiberar        := True;
      edtQtdExit(Self);
    end
    else vlLiberar := False;
  end;

begin
  inherited;
  edtSeloSigla.Clear;
  edtSeloNumInicial.Clear;
  edtSeloNumFinal.Clear;
  edtSeloData.Date := dtmControles.DataHoraBanco(3);
  lcxSeloSituacao.Clear;
  edtSeloDescricao.Clear;
  edtSeloObservacao.Clear;

  with frmCadSeloLote do
  begin
    if not frmCadSeloLote.chxProximoSelo.Checked then
    begin
      edtSeloNumInicial.Text      := FormatFloat('000000', sqlSeloLivroNUMERO.AsCurrency);
      lcxSeloSituacao.EditValue   := sqlSeloLivroSELO_SITUACAO_ID.AsInteger;
      edtSeloDescricao.EditValue  := sqlSeloLivroDESCRICAO.AsString;
      edtSeloObservacao.EditValue := sqlSeloLivroOBSERVACAO.AsString;
      if not sqlSeloLivroDATA.IsNull then
           edtSeloData.EditValue := sqlSeloLivroDATA.AsDateTime
      else edtSeloData.EditValue := dtmControles.DataHoraBanco(3);
    end
    else
    begin
      edtSeloNumInicial.Text    := FormatFloat('000000', vgSeloProximo);
      edtSeloData.EditValue     := dtmControles.DataHoraBanco(3);
      lcxSeloSituacao.EditValue := 2;
    end;

    edtSeloSigla.EditValue := ClientAncestralSIGLA.AsString;
  end;

  lcxSeloSituacaoPropertiesEditValueChanged(Self);
  lcxSeloSituacao.Properties.ListSource := frmCadSeloLote.dtsSeloSituacao;
  lcxSeloSituacaoPropertiesEditValueChanged(lcxSeloSituacao);
  VerificarDisponibilidadeSelo;
  if vlLiberar then
       edtSeloData.SetFocus
  else edtQtd.SetFocus;
end;

procedure TfrmSeloRegistrar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  sqlUsuarioSistema.Active := False;

  Action := caFree;
  frmSeloRegistrar := nil;
end;

procedure TfrmSeloRegistrar.FormCreate(Sender: TObject);
begin
  inherited;
  sqlUsuarioSistema.Connection := dtmControles.DB;
  sqlUsuarioSistema.Active     := True;
end;

procedure TfrmSeloRegistrar.lcxSeloSituacaoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  edtSeloDescricao.Enabled  := lcxSeloSituacao.EditValue > 1;
  edtSeloObservacao.Enabled := lcxSeloSituacao.EditValue > 1;
  lbxUsuario.Enabled        := lcxSeloSituacao.EditValue = 6;
  lblUsuario.Enabled        := lcxSeloSituacao.EditValue = 6;

  if lcxSeloSituacao.EditValue < 6 then
    lbxUsuario.EditValue := null;

  if lcxSeloSituacao.EditValue = 1 then
  begin
    edtSeloDescricao.Clear;
    edtSeloObservacao.Clear;
  end;

end;

end.
