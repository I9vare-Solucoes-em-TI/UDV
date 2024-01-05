unit CadEnvioEmail;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  Menus, FMTBcd,
  DB, DBClient, Provider, SqlExpr, StdCtrls, cxButtons, cxTextEdit, cxDBEdit,
  cxCheckBox, cxContainer, cxEdit, cxLabel, ExtCtrls, cxPC, cxControls,
  cxMaskEdit, cxSpinEdit, OleCtrls,
  CHILKATMAILLib2_TLB,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Vcl.ComCtrls, WPCTRRich, SimpleDS, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, DbxDevartInterBase,
  mxExport, FrameEditorSimples, WPRTEDefs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView,
  cxGrid;

type
  TfrmCadEnvioEmail = class(TForm)
    pgcConfig: TcxPageControl;
    tabConexao: TcxTabSheet;
    Panel2: TPanel;
    cxLabel3: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    chxAutenticar: TcxDBCheckBox;
    chxEmailPadrao: TcxDBCheckBox;
    edtHostSMTP: TcxDBTextEdit;
    edtUsuario: TcxDBTextEdit;
    edtSenha: TcxDBTextEdit;
    edtEmailPadrao: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    tabTextoPadrao: TcxTabSheet;
    Panel3: TPanel;
    tabRodape: TcxTabSheet;
    memTextoRodape: TMemo;
    Panel1: TPanel;
    SourceAncestral: TDataSource;
    Panel4: TPanel;
    cxLabel7: TcxLabel;
    pnlEnvio: TPanel;
    chxAssinaturaUsuario: TcxDBCheckBox;
    lblEnviando: TcxLabel;
    edtLinhas: TcxSpinEdit;
    cxLabel8: TcxLabel;
    chxCC: TcxCheckBox;
    edtPorta: TcxDBTextEdit;
    edtAssuntoEmail: TcxTextEdit;
    edtCC: TcxTextEdit;
    btnEnviar: TcxButton;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    Panel5: TPanel;
    cxLabel9: TcxLabel;
    lcxEmailTextoPadrao: TcxLookupComboBox;
    cbxAnexarArquivo: TcxCheckBox;
    dtsAtoAcompanhamento: TDataSource;
    sqlAtoAcompanhamento: TI9Query;
    sqlAtoAcompanhamentoATO_ACOMPANHAMENTO_ID: TBCDField;
    sqlAtoAcompanhamentoDATA: TSQLTimeStampField;
    sqlAtoAcompanhamentoHORA: TSQLTimeStampField;
    sqlAtoAcompanhamentoCONTATO: TStringField;
    sqlAtoAcompanhamentoOBSERVACAO: TStringField;
    sqlAtoAcompanhamentoTIPO_CONTATO: TStringField;
    sqlAtoAcompanhamentoUSUARIO_ID: TBCDField;
    sqlAtoAcompanhamentoATO_ID: TBCDField;
    mxStringsExport1: TmxStringsExport;
    sqlAtoAcompanhamentoCORPO_EMAIL: TBlobField;
    sqlAtoAcompanhamentoSTATUS: TStringField;
    sqlAtoAcompanhamentoASSUNTO: TStringField;
    sqlAtoAcompanhamentoORDEM_ENVIO: TBCDField;
    sqlAtoAcompanhamentoSITUACAO: TStringField;
    sqlAtoAcompanhamentoMOSTRAR_MSG: TStringField;
    memTextoPadrao: TRichEdit;
    sqlQualifica: TI9Query;
    sqlQualificaDESCRICAO: TStringField;
    sqlQualificaSITUACAO: TStringField;
    DataSetAncestral: TI9Query;
    DataSetAncestralEMAIL_CONFIG_ID: TBCDField;
    DataSetAncestralTEXTO_EMAIL: TBlobField;
    DataSetAncestralHOST_SMTP: TStringField;
    DataSetAncestralPORTA: TStringField;
    DataSetAncestralUSER_NAME: TStringField;
    DataSetAncestralPASSWORD: TStringField;
    DataSetAncestralAUTENTICAR_SERVIDOR: TStringField;
    DataSetAncestralTEXTO_RODAPE: TBlobField;
    DataSetAncestralESPACO_TEXTO_RODAPE: TBCDField;
    DataSetAncestralASSUNTO_PADRAO: TStringField;
    DataSetAncestralEMAIL_PADRAO: TStringField;
    DataSetAncestralUSAR_EMAIL_USUARIO: TStringField;
    DataSetAncestralADICIONAR_ASSINATURA_USUARIO: TStringField;
    DataSetAncestralEMAIL_TEXTO_PADRAO_ID: TBCDField;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    grdBasicaLevel1: TcxGridLevel;
    grdBasicaDBTableView1EMAIL_CONFIG_ID: TcxGridDBColumn;
    grdBasicaDBTableView1HOST_SMTP: TcxGridDBColumn;
    grdBasicaDBTableView1PORTA: TcxGridDBColumn;
    grdBasicaDBTableView1USER_NAME: TcxGridDBColumn;
    grdBasicaDBTableView1ASSUNTO_PADRAO: TcxGridDBColumn;
    grdBasicaDBTableView1EMAIL_PADRAO: TcxGridDBColumn;
    chxUsarTSLSSL: TcxDBCheckBox;
    DataSetAncestralUSAR_TSL_SSL: TStringField;
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure pgcConfigChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chxAutenticarClick(Sender: TObject);
    procedure chxEmailPadraoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEnviarClick(Sender: TObject);
    procedure chxCCClick(Sender: TObject);
    procedure lcxEmailTextoPadraoPropertiesChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    vgNovo : Boolean;
    procedure SendMail(vBodyHtml : String; vEmailCC: string; vAttachment: String; vAnexo: TStrings);
    procedure QualificaCorpoMensagem(vpAtoId: Integer);
  public
    vgAtoId: Integer;
    procedure InserirAcompanhamento(
      vpChaveAto: Integer;
      vpTipoContato: string;
      vpObsHistorico: string;
      vpCorpoEmail: string;
      vpEtapaProcesso: string = ''
    );
  end;

var
  frmCadEnvioEmail: TfrmCadEnvioEmail;
  vgEnviarEmail : Boolean;


implementation

uses Controles, Lookup, Rotinas, ControleVariaveis;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure TfrmCadEnvioEmail.btnCancelarClick(Sender: TObject);
begin
  if vgEnviarEmail then
    DataSetAncestral.CancelUpdates
  else
  begin
    FreeAndNil(vgEmailConfig.TextoEmail);
    FreeAndNil(vgEmailConfig.TextoRodape);
  end;
  Close;
end;

procedure TfrmCadEnvioEmail.btnConfirmarClick(Sender: TObject);
begin
//  if Length(Trim(memTextoPadrao.Lines.Text)) = 0 then begin
//    Application.MessageBox('O corpo da mensagem deve ser informado!','Informação', MB_OK + MB_ICONINFORMATION);
//    pgcConfig.ActivePage  := tabTextoPadrao;
//    memTextoPadrao.SetFocus;
//    Exit;
//  end;

  if vgNovo then
    DataSetAncestralEMAIL_CONFIG_ID.AsCurrency := dtmControles.GerarSequencia('G_EMAIL_CONFIG');

  DataSetAncestralTEXTO_RODAPE.AsString := memTextoRodape.Text;
  DataSetAncestralTEXTO_EMAIL.AsString  := CompressString(memTextoPadrao.Text);
  DataSetAncestralESPACO_TEXTO_RODAPE.AsInteger := edtLinhas.EditValue;
  DataSetAncestralEMAIL_TEXTO_PADRAO_ID.AsInteger := dtmlookup.sqlEmailTextoPadraoEMAIL_TEXTO_PADRAO_ID.asInteger;
  DataSetAncestral.Post;

  Self.Close;
end;

procedure TfrmCadEnvioEmail.btnEnviarClick(Sender: TObject);
var
  vlAttachmentFile : String;
  viTexto: TStringList;
begin
  if Length(Trim(memTextoPadrao.Lines.Text)) = 0 then begin
    Application.MessageBox('O corpo da mensagem deve ser informado!','Informação', MB_OK + MB_ICONINFORMATION);
    pgcConfig.ActivePage  := tabTextoPadrao;
    memTextoPadrao.SetFocus;
    Exit;
  end;

  VerificarPreenchimentoEDT_TX(edtAssuntoEmail.Text, 'Assunto', edtAssuntoEmail);

  if Application.MessageBox('Confirma o envio do email?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    Exit;

  viTexto := TStringList.Create;
  try
    viTexto.Text := memTextoPadrao.text;

    lblEnviando.Visible := True;
    frmCadEnvioEmail.Refresh;

    DeleteFile('c:\Temp\Body.html');
    DeleteFile('c:\Temp\Body.txt');

    mxStringsExport1.Strings := viTexto;
    mxStringsExport1.ExportType := xtHTML;
    mxStringsExport1.Execute;
    mxStringsExport1.ExportType := xtTXT;
    mxStringsExport1.Execute;
  finally
    FreeAndNil(viTexto);
  end;

  vlAttachmentFile := '';
  if cbxAnexarArquivo.Checked then
    vlAttachmentFile := 'c:\Temp\AtoRascunho.pdf';

  dtmControles.EnviarEmailIndy(
    vgEmailConfig.EmailEnvio,               // Email de origem
    edtAssuntoEmail.Text + ' - Pedido nº ' + IntToStr(vgAtoId), // Assunto
    vgEmailConfig.EmailDestino,             // Email de destino
    'c:\Temp\Body.html',                    // Corpo html
    edtCC.Text,                             // Email CC
    '',                                     // Email CCO
    vlAttachmentFile,                       // Attachment
    nil                                     // Anexo
  );

  if vgEmailConfig.Transmitido then begin
    Application.MessageBox('E-mail Transmitido com sucesso!!!', 'Informação', MB_ICONINFORMATION + MB_OK);
    vgEmailConfig.AssuntoPadrao :=  edtAssuntoEmail.Text;
  end
  else begin
    Application.MessageBox(PChar('E-mail não transmitido!!!' + #13 + #13 +
      'Verifique a Conexão coma Internet e/ou Dados do email.'),
      'Informação', MB_ICONINFORMATION + MB_OK);
  end;
  close;
end;

procedure TfrmCadEnvioEmail.chxAutenticarClick(Sender: TObject);
begin
  edtPorta.Enabled := chxAutenticar.Checked;
end;

procedure TfrmCadEnvioEmail.chxCCClick(Sender: TObject);
begin
  edtCC.Enabled := chxCC.Checked;
  if chxCC.Checked then
    edtCC.EditValue := vgEmailConfig.EmailEnvio;
end;

procedure TfrmCadEnvioEmail.chxEmailPadraoClick(Sender: TObject);
begin
  edtEmailPadrao.Enabled := not chxEmailPadrao.Checked;
end;

procedure TfrmCadEnvioEmail.FormActivate(Sender: TObject);
begin
  if not vgEnviarEmail then
  begin
    pgcConfig.ActivePageIndex := 0;
    chxAutenticarClick(Self);
    chxEmailPadraoClick(Self);
    edtHostSMTP.SetFocus;
  end
  else
  begin
    tabConexao.TabVisible := False;
    pgcConfig.ActivePage  := tabTextoPadrao;
    pgcConfigChange(Self);
  end;
  vgEnviarEmail := False;
end;

procedure TfrmCadEnvioEmail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlQualifica.Close;
  sqlAtoAcompanhamento.Close;
  Action := caFree;
  frmCadEnvioEmail := nil;
end;

procedure TfrmCadEnvioEmail.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DestruirComponentes;
end;

procedure TfrmCadEnvioEmail.FormCreate(Sender: TObject);
var
  vpUsuario : TStringList;
begin
  sqlQualifica.Connection := dtmControles.DB;
  sqlAtoAcompanhamento.Connection := dtmControles.DB;
  sqlAtoAcompanhamento.Active     := True;

  btnEnviar.Visible             := vgEnviarEmail;
  pnlEnvio.Visible              := vgEnviarEmail;
  edtAssuntoEmail.Visible       := vgEnviarEmail;
  edtCC.Visible                 := vgEnviarEmail;
  btnConfirmar.Visible          := not vgEnviarEmail;
  chxAssinaturaUsuario.Visible  := not vgEnviarEmail;

  DataSetAncestral.Open;

  if not vgEnviarEmail then
  begin
    vgNovo         := DataSetAncestral.IsEmpty;
    pnlEnvio.Color := clSilver;
    if DataSetAncestral.IsEmpty then
    begin
      DataSetAncestral.Insert;
      DataSetAncestralAUTENTICAR_SERVIDOR.AsString  := 'N';
      DataSetAncestralUSAR_EMAIL_USUARIO.AsString   := 'N';
      edtLinhas.EditValue := 1;
      memTextoPadrao.Lines.Clear;
    end
    else
    begin
      DataSetAncestral.Edit;
      memTextoRodape.Text  := DataSetAncestralTEXTO_RODAPE.AsString;
      memTextoPadrao.Text  := DecompressString(DataSetAncestralTEXTO_EMAIL.AsString);
      edtLinhas.EditValue  := DataSetAncestralESPACO_TEXTO_RODAPE.AsInteger;
      lcxEmailTextoPadrao.EditValue := DataSetAncestralEMAIL_TEXTO_PADRAO_ID.AsInteger;
    end;
  end
  else
  begin
    dtmLookup.LerDadadosConfigEmail(vgEmailConfig.Tabela);

    memTextoPadrao.Text       := DecompressString(vgEmailConfig.TextoEmail.Text);
    edtLinhas.EditValue       := vgEmailConfig.EspacoAssinatura;
    edtAssuntoEmail.EditValue := vgEmailConfig.AssuntoPadrao;

    vpUsuario := dtmControles.GetFields(' SELECT EMAIL, NOME_COMPLETO, FUNCAO FROM G_USUARIO WHERE USUARIO_ID = '+vgUsuarioID);
    try
      vgEmailConfig.EmailEnvio := vpUsuario.Values['EMAIL'];
      if vgEmailConfig.EmailEnvio = '' then
        vgEmailConfig.EmailEnvio := DataSetAncestralEMAIL_PADRAO.AsString;

      if vgEmailConfig.EmailEnvio = '' then
      begin
        Application.MessageBox(PChar('Email do usuário e/ou padrão não configurado!!!'+#13+#13+
                                     'Opção de envio desativada.'),'Informação', MB_ICONINFORMATION + MB_OK);
        btnEnviar.Enabled := False;
        Exit;
      end;

      if vgEmailConfig.AdAssinaturaUsuario then
      begin
        memTextoRodape.Lines.Add(MaiusculoMinusculo(vpUsuario.Values['NOME_COMPLETO']));
        memTextoRodape.Lines.Add(MaiusculoMinusculo(vpUsuario.Values['FUNCAO']));
        memTextoRodape.Text := memTextoRodape.Text + vgEmailConfig.TextoRodape.Text;
      end
      else memTextoRodape.Text := vgEmailConfig.TextoRodape.Text;
    finally
       FreeAndNil(vpUsuario);
    end;
  end;
end;

procedure TfrmCadEnvioEmail.FormShow(Sender: TObject);
begin
  QualificaCorpoMensagem(vgAtoId);
end;

procedure TfrmCadEnvioEmail.InserirAcompanhamento(
  vpChaveAto: Integer;
  vpTipoContato: string;
  vpObsHistorico: string;
  vpCorpoEmail: string;
  vpEtapaProcesso: string = '');
var
  viObs: string;
  viTexto: TStringList;
begin

  sqlAtoAcompanhamento.Insert;
  sqlAtoAcompanhamentoATO_ACOMPANHAMENTO_ID.AsInteger := dtmControles.GerarSequencia('T_ATO_ACOMPANHAMENTO');
  sqlAtoAcompanhamentoATO_ID.AsInteger                := vpChaveAto;
  sqlAtoAcompanhamentoDATA.AsString                   := dtmControles.DataHoraBanco(4);
  sqlAtoAcompanhamentoHORA.AsString                   := dtmControles.DataHoraBanco(2);
  sqlAtoAcompanhamentoCONTATO.AsString                := vgEmailConfig.DadosEmail[1,1];
  sqlAtoAcompanhamentoTIPO_CONTATO.AsString           := vpTipoContato;
  sqlAtoAcompanhamentoOBSERVACAO.AsString             := vgEmailConfig.AssuntoPadrao;
  sqlAtoAcompanhamentoORDEM_ENVIO.AsInteger           := dtmControles.GetInt('select count(*) from T_ATO_ACOMPANHAMENTO where ATO_ID = ' + IntToStr(vpChaveAto)) + 1;
  sqlAtoAcompanhamentoSTATUS.AsString := 'A';
  sqlAtoAcompanhamentoMOSTRAR_MSG.AsString := 'N';
  sqlAtoAcompanhamentoASSUNTO.AsString := vgEmailConfig.AssuntoPadrao + ' - Pedido nº ' + IntToStr(vpChaveAto);

  viObs := '';
  if vpEtapaProcesso <> '' then
    viObs := vpEtapaProcesso + #13;

  if cbxAnexarArquivo.Checked then
    viObs := viObs + 'Encaminhado Arquivo com o Rascunho do Ato' + #13;

  viObs := viObs + #13 + ' Histórico de Envio ' + #13 +
    ' Assunto:          ' + sqlAtoAcompanhamentoOBSERVACAO.AsString + #13 +
    ' Origem:           ' + vgEmailConfig.EmailEnvio + #13 +
    ' Destino:          ' + vgEmailConfig.EmailDestino;

  if vgEmailConfig.EmailCopiaOculto <> '' then
    viObs := viObs + ' Encaminhado:  ' + vgEmailConfig.EmailCopiaOculto;

  if vpCorpoEmail = '' then
  begin
    viTexto := TStringList.Create;
    try
      viTexto.Text := memTextoPadrao.Text;

      sqlAtoAcompanhamentoCORPO_EMAIL.AsString := CompressString(viTexto.Text);
    finally
      FreeAndNil(viTexto);
    end;
  end
  else sqlAtoAcompanhamentoCORPO_EMAIL.AsString := CompressString(vpCorpoEmail);

  sqlAtoAcompanhamentoOBSERVACAO.AsString  := Trim(viObs);
  sqlAtoAcompanhamentoUSUARIO_ID.AsString  := vgUsuarioID;
  sqlAtoAcompanhamento.Post;
end;

procedure TfrmCadEnvioEmail.lcxEmailTextoPadraoPropertiesChange(Sender: TObject);
begin
  QualificaCorpoMensagem(vgAtoId);
end;

procedure TfrmCadEnvioEmail.pgcConfigChange(Sender: TObject);
begin
  if pgcConfig.ActivePage = tabConexao then
    edtHostSMTP.SetFocus
  else
    if pgcConfig.ActivePage = tabTextoPadrao then
         memTextoPadrao.SetFocus
    else memTextoRodape.SetFocus;
end;

procedure TfrmCadEnvioEmail.QualificaCorpoMensagem(vpAtoId: Integer);
var
  viWptTexto: TWPRichText;
  viSituacaoAberta: string;
  viSituacaoConcluida: string;
begin
  viSituacaoAberta := '';
  viSituacaoConcluida := '';

  if vgQualificar.StlLista <> nil then
    FreeAndNil(vgQualificar.StlLista);

  vgQualificar.StlLista := TStringList.Create;

  try
    sqlQualifica.Active := False;
    sqlQualifica.ParamByName('ATO_ID').AsInteger := vpAtoId;
    sqlQualifica.Active := True;

    while not sqlQualifica.Eof do
    begin
      if sqlQualificaSITUACAO.AsString = 'A' then
        viSituacaoAberta := Trim(viSituacaoAberta + #13#10 + sqlQualificaDESCRICAO.AsString)
      else if sqlQualificaSITUACAO.AsString = 'F' then
        viSituacaoConcluida := Trim(viSituacaoConcluida + #13#10 + sqlQualificaDESCRICAO.AsString);
      sqlQualifica.Next;
    end;

    if viSituacaoAberta = '' then
      vgQualificar.StlLista.Add('LISTA_PENDENCIA_ABERTA=' + 'Não existe pendência em aberto!')
    else vgQualificar.StlLista.Add('LISTA_PENDENCIA_ABERTA=' + 'Pendência Aberta ' + #13 + viSituacaoAberta);

    if viSituacaoConcluida = '' then
      vgQualificar.StlLista.Add('LISTA_PENDENCIA_CONCLUIDA=' + 'Não existe pendência concluida!')
    else vgQualificar.StlLista.Add('LISTA_PENDENCIA_CONCLUIDA=' + 'Pendência Concluida ' + #13 + viSituacaoConcluida);

    viWptTexto := TWPRichText.Create(nil);
    try

      viWptTexto.AsString  := DeCompressString(dtmLookup.sqlEmailTextoPadraoTEXTO.AsString);
      edtAssuntoEmail.Text := dtmLookup.sqlEmailTextoPadraoASSUNTO.AsString;

      PrepararQualificarPadrao(viWptTexto,'',True,False,False);
      viWptTexto.ReformatAll(True, True);

      memTextoPadrao.Clear;
      memTextoPadrao.Text := viWptTexto.text;
    finally
      FreeAndNil(viWptTexto);
    end;
  finally

    FreeAndNil(vgQualificar.StlLista);
    FreeAndNil(vgQualificar.StlPrincipal);
    FreeAndNil(vgQualificar.StlCampos);
  end;
end;

procedure TfrmCadEnvioEmail.SendMail(vBodyHtml, vEmailCC, vAttachment: String;
  vAnexo: TStrings);
var
  mailman: TChilkatMailMan2;
  success: Integer;
  email  : CHILKATMAILLib2_TLB.IChilkatEmail2;

  Procedure AddEmail(vpLista : String);
  var
    viPos : Integer;
  begin
    repeat
      viPos := pos(';', vpLista);
      if viPos > 0 then
        email.AddTo('', Copy(vpLista,1,viPos-1))
      else
      begin
        email.AddTo('', vpLista);
        vpLista := '';
      end;
      Delete(vpLista,1,viPos);
    until vpLista = '';
  end;

begin
  //  The mailman object is used for sending and receiving email.
  mailman := TChilkatMailMan2.Create(Self);

  //  Any string argument automatically begins the 30-day trial.
  success := mailman.UnlockComponent('MAIL12345678_1D8C95A8G82H');
  if (success <> 1) then
  begin
    Screen.Cursor := crDefault;
    ShowMessage('Component unlock failed');
    exit;
  end;

  //  Set the SMTP server.
  mailman.SmtpHost     := vgEmailConfig.HostSmtp;
  mailman.SmtpUsername := vgEmailConfig.UserName;
  mailman.SmtpPassword := vgEmailConfig.PassWord;
  mailman.SmtpSsl      := 1;
  mailman.SmtpPort     := StrToInt(vgEmailConfig.Porta);

  //  Create a new email object
  email := CoChilkatEmail2.Create();

  email.Subject := vgEmailConfig.AssuntoPadrao;
  email.SetHtmlBody(vBodyHtml);
  email.From    := vgEmailConfig.EmailEnvio;
  AddEmail(vgEmailConfig.EmailDestino);
  email.AddCC('',vEmailCC);

  if vAttachment <> '' then
    email.AddFileAttachment2(vAttachment, 'application/pdf');

  success := mailman.SendEmail(email As CHILKATMAILLib2_TLB.IChilkatEmail2);
  if (success <> 1) then
  begin
    Screen.Cursor := crDefault;
    ShowMessage(mailman.LastErrorText);
    Abort;
  end;

  success := mailman.CloseSmtpConnection();
  if (success <> 1) then
  begin
    Screen.Cursor := crDefault;
    ShowMessage('Connection to SMTP server not closed cleanly.');
  end;
end;

end.
