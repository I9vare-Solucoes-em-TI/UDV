unit CadEnvioEmailFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  Menus, FMTBcd,
  DB, DBClient, Provider, SqlExpr, StdCtrls, cxButtons, cxTextEdit, cxDBEdit,
  cxCheckBox, cxContainer, cxEdit, cxLabel, ExtCtrls, cxPC, cxControls,
  cxMaskEdit, cxSpinEdit, OleCtrls,
  CHILKATMAILLib2_TLB,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Vcl.ComCtrls, WPCTRRich, SimpleDS, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, DbxDevartInterBase,
  mxExport, FrameEditorSimples, WPRTEDefs, dxSkinsCore, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinscxPCPainter;

type
  TRetornoCompromisso = record
    cliente: Integer;
    emailPrimario: string;
    caminhoArquivo: string;
    compromissoId: array of Integer;
  end;
  TArrayOfRetornoCompromisso = array of TRetornoCompromisso;

  TRetornoEnvioEmail = record
    houveErro: Boolean;
    enviarEmail : Boolean;
    compromisso: TArrayOfRetornoCompromisso;
  end;

  TfrmCadEnvioEmailFinanceiro = class(TForm)
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
    edtAssuntoPadrao: TcxDBTextEdit;
    tabTextoPadrao: TcxTabSheet;
    Panel3: TPanel;
    tabRodape: TcxTabSheet;
    memTextoRodape: TMemo;
    Panel1: TPanel;
    DataSetAncestral: TSQLDataSet;
    ProviderAncestral: TDataSetProvider;
    ClientAncestral: TClientDataSet;
    SourceAncestral: TDataSource;
    Panel4: TPanel;
    cxLabel7: TcxLabel;
    pnlEnvio: TPanel;
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
    mxStringsExport1: TmxStringsExport;
    memTextoPadrao: TRichEdit;
    chxAssinaturaUsuario: TcxDBCheckBox;
    ClientAncestralEMAIL_CONFIG_ID: TFMTBCDField;
    ClientAncestralTEXTO_EMAIL: TBlobField;
    ClientAncestralHOST_SMTP: TStringField;
    ClientAncestralPORTA: TStringField;
    ClientAncestralUSER_NAME: TStringField;
    ClientAncestralPASSWORD: TStringField;
    ClientAncestralAUTENTICAR_SERVIDOR: TStringField;
    ClientAncestralTEXTO_RODAPE: TBlobField;
    ClientAncestralESPACO_TEXTO_RODAPE: TFMTBCDField;
    ClientAncestralASSUNTO_PADRAO: TStringField;
    ClientAncestralEMAIL_PADRAO: TStringField;
    ClientAncestralUSAR_EMAIL_USUARIO: TStringField;
    ClientAncestralADICIONAR_ASSINATURA_USUARIO: TStringField;
    ClientAncestralEMAIL_TEXTO_PADRAO_ID: TFMTBCDField;
    sqlBoletos: TSimpleDataSet;
    sqlPessoa: TSimpleDataSet;
    sqlPessoaPESSOA_ID: TFMTBCDField;
    sqlBoletosBOLETO_ID: TFMTBCDField;
    sqlBoletosDATA_BOLETA: TSQLTimeStampField;
    sqlBoletosNOSSO_NUMERO: TFMTBCDField;
    sqlBoletosBOLETO_DESCRICAO: TStringField;
    sqlBoletosNOME: TStringField;
    sqlBoletosEMAIL1: TStringField;
    sqlBoletosBOLETO_EMAIL: TStringField;
    sqlBoletosCALC_EMAIL: TStringField;
    Panel5: TPanel;
    cxLabel9: TcxLabel;
    lcxEmailTextoPadrao: TcxLookupComboBox;
    sqlBoletosPATH_GERARPDF: TStringField;
    procedure btnCancelarClick(Sender: TObject);
    procedure pgcConfigChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure chxAutenticarClick(Sender: TObject);
    procedure chxEmailPadraoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEnviarClick(Sender: TObject);
    procedure chxCCClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure sqlBoletosCalcFields(DataSet: TDataSet);
    procedure lcxEmailTextoPadraoPropertiesEditValueChanged(Sender: TObject);
  private
    vgNovo : Boolean;
    vgCaminhoArquivo : String;
  public
  end;

var
  frmCadEnvioEmailFinanceiro: TfrmCadEnvioEmailFinanceiro;
  vgRetornoEmail: TRetornoEnvioEmail;

implementation

uses Controles, Lookup, Rotinas, ControleVariaveis, LookupFinanceiro;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure TfrmCadEnvioEmailFinanceiro.btnCancelarClick(Sender: TObject);
begin
  if vgRetornoEmail.enviarEmail then
    ClientAncestral.CancelUpdates
  else begin
    FreeAndNil(vgEmailConfig.TextoEmail);
    FreeAndNil(vgEmailConfig.TextoRodape);
  end;
  Close;
end;

procedure TfrmCadEnvioEmailFinanceiro.btnConfirmarClick(Sender: TObject);
begin
  if vgNovo then
    ClientAncestralEMAIL_CONFIG_ID.AsCurrency := dtmControles.GerarSequencia('G_EMAIL_CONFIG');

  ClientAncestralTEXTO_EMAIL.AsString          := CompressString(memTextoPadrao.Text);
  ClientAncestralTEXTO_RODAPE.AsString         := memTextoRodape.Text;
  ClientAncestralESPACO_TEXTO_RODAPE.AsInteger := edtLinhas.EditValue;
  ClientAncestral.ApplyUpdates(0);
  Close;
end;

procedure TfrmCadEnvioEmailFinanceiro.btnEnviarClick(Sender: TObject);
var
  viArquivo, viNomeDescricao, viBoleto : string;
  viTexto: TStringList;
  viAnexo: TStringList;

  {$REGION 'Validar Dados'}
  procedure Validar;
  begin
    if Length(Trim(memTextoPadrao.Lines.Text)) = 0 then
    begin
      Application.MessageBox('O corpo da mensagem deve ser informado!','Informa��o', MB_OK + MB_ICONINFORMATION);
      pgcConfig.ActivePage  := tabTextoPadrao;
      memTextoPadrao.SetFocus;
      Abort;
    end;

    VerificarPreenchimentoEDT_TX(edtAssuntoEmail.Text, 'Assunto', edtAssuntoEmail);

    if Application.MessageBox('Confirma o envio do email?','Pergunta', MB_YESNO + MB_ICONQUESTION) = IDNO then
      Abort;

    sqlPessoa.Active := False;
    sqlPessoa.Active := True;

    if sqlPessoa.IsEmpty then
    begin
      Application.MessageBox('N�o existe email para ser enviado!','Informa��o', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;
  end;
  {$ENDREGION}

  {$REGION 'CarregarAnexo'}
  procedure CarregarAnexo;
  begin
    sqlBoletos.First;
    viAnexo := TStringList.Create;
    viBoleto := '';
    while not sqlBoletos.Eof do
    begin
      viArquivo := sqlBoletosPATH_GERARPDF.AsString;

      if not FileExists(viArquivo) then
      begin
        sqlBoletos.Next;
        Continue;
      end;

      viBoleto := viBoleto +', '+sqlBoletosNOSSO_NUMERO.AsString;
      viAnexo.Add(viArquivo);
      sqlBoletos.Next;
    end;

    if viBoleto <> '' then
      Delete(viBoleto,1,1);
  end;
  {$ENDREGION}

  {$REGION 'MontarMensagem'}
  procedure MontarMensagem;
  var
    i : Integer;
  begin
    viTexto := TStringList.Create;

    for i := 0 to memTextoPadrao.Lines.Count-1 do
    begin
      if trim(memTextoPadrao.Lines.Strings[i]) = '' then
           viTexto.Add('<br />')
      else viTexto.Add(memTextoPadrao.Lines.Strings[i]+'<br />');
    end;

    for i := 1 to vgEmailConfig.EspacoAssinatura do
      viTexto.Add('<br />');

    for i := 0 to memTextoRodape.Lines.Count-1 do
    begin
      if trim(memTextoRodape.Lines.Strings[i]) = '' then
           viTexto.Add('<br />')
      else viTexto.Add(memTextoRodape.Lines.Strings[i]+'<br />');
    end;
  end;
  {$ENDREGION}

  {$REGION 'GravarEnvioBoleto'}
  procedure GravarEnvioBoleto;
  var
    viSql : String;
  begin
    ExecutaSqlAuxiliar('INSERT INTO G_EMAIL_ENVIADO ( '+
                       '            EMAIL_ENVIADO_ID, '+
                       '            DATA, '+
                       '            USUARIO_ID, '+
                       '            ASSUNTO, '+
                       '            MENSAGEM, '+
                       '            PARA, '+
                       '            PESSOA_DESCRICAO, '+
                       '            PESSOA_ID, '+
                       '            BOLETOS) '+
                       'VALUES ( '+
                       '             :EMAIL_ENVIADO_ID, '+
                       '             :DATA, '+
                       '             :USUARIO_ID, '+
                       '             :ASSUNTO, '+
                       '             :MENSAGEM, '+
                       '             :PARA, '+
                       '             :PESSOA_DESCRICAO, '+
                       '             :PESSOA_ID, '+
                       '             :BOLETOS)',2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('EMAIL_ENVIADO_ID').AsInteger := dtmControles.GerarSequencia('G_EMAIL_ENVIADO');
      ParamByName('DATA').AsString              := dtmControles.DataHoraBanco(5);
      ParamByName('USUARIO_ID').AsString        := vgUsuarioID;
      ParamByName('ASSUNTO').AsString           := edtAssuntoEmail.Text;
      ParamByName('MENSAGEM').AsString          := viTexto.Text;
      ParamByName('PARA').AsString              := Trim(sqlBoletosCALC_EMAIL.AsString);
      ParamByName('PESSOA_DESCRICAO').AsString  := sqlBoletosNOME.AsString;
      ParamByName('PESSOA_ID').AsInteger        := sqlPessoaPESSOA_ID.AsInteger;
      ParamByName('BOLETOS').AsString           := viBoleto;
      ExecSQL(FALSE);
    end;
  end;
  {$ENDREGION}

begin
  Validar;

  sqlPessoa.First;
  while not sqlPessoa.Eof do begin

    sqlBoletos.Active := False;
    sqlBoletos.DataSet.ParamByName('PESSOA_ID').AsString := sqlPessoaPESSOA_ID.AsString;
    sqlBoletos.Active := True;

    if sqlBoletos.IsEmpty then
    begin
      sqlPessoa.Next;
      Continue;
    end;

    CarregarAnexo;
    MontarMensagem;

    lblEnviando.Visible := True;
    frmCadEnvioEmailFinanceiro.Refresh;

    DeleteFile('c:\Temp\Body.html');
    DeleteFile('c:\Temp\Body.txt');

    mxStringsExport1.Strings    := viTexto;
    mxStringsExport1.ExportType := xtHTML;
    mxStringsExport1.Execute;
    mxStringsExport1.ExportType := xtTXT;
    mxStringsExport1.Execute;

    try
      dtmControles.EnviarEmailIndy(
       vgEmailConfig.EmailEnvio,
       edtAssuntoEmail.Text,
       Trim(sqlBoletosCALC_EMAIL.AsString),  // Email de destino
       'c:\Temp\Body.txt',             // Corpo html
       edtCC.Text,                      // Email CC
       '',                              // Attachment
       '',                              // Attachment
       viAnexo                          // Anexo
      );

      vgRetornoEmail.houveErro := not vgEmailConfig.Transmitido;
      if vgEmailConfig.Transmitido then
      begin
        sqlBoletos.First;
        while not sqlBoletos.Eof do
        begin
          ExecutaSqlAuxiliar('update J_BOLETO set ENVIO_EMAIL = ' + QuotedStr('S') +
          ' where BOLETO_ID = ' + sqlBoletosBOLETO_ID.AsString, 1);
          sqlBoletos.Next;
        end;
        GravarEnvioBoleto;
      end;
      FreeAndNil(viTexto);
    except
      if viTexto <> nil then
        FreeAndNil(viTexto);
      Application.MessageBox('Falha ao enviar e-mail!' + #13#10 +
        ' Verifique as configura��es do e-mail/Conex�o com a internet.',
        'Informa��o', MB_OK + MB_ICONINFORMATION);
    end;

    FreeAndNil(viAnexo);
    sqlPessoa.Next;
  end;
  close;
end;

procedure TfrmCadEnvioEmailFinanceiro.chxAutenticarClick(Sender: TObject);
begin
  edtPorta.Enabled := chxAutenticar.Checked;
end;

procedure TfrmCadEnvioEmailFinanceiro.chxCCClick(Sender: TObject);
begin
  edtCC.Enabled := chxCC.Checked;
  if chxCC.Checked then
    edtCC.EditValue := vgEmailConfig.EmailEnvio;
end;

procedure TfrmCadEnvioEmailFinanceiro.chxEmailPadraoClick(Sender: TObject);
begin
  edtEmailPadrao.Enabled := not chxEmailPadrao.Checked;
end;

procedure TfrmCadEnvioEmailFinanceiro.FormActivate(Sender: TObject);
begin
  if not vgRetornoEmail.enviarEmail then
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
  vgRetornoEmail.enviarEmail := False;
end;

procedure TfrmCadEnvioEmailFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  sqlBoletos.Close;
  sqlPessoa.Close;
  Action := caFree;
  frmCadEnvioEmailFinanceiro := nil;
end;

procedure TfrmCadEnvioEmailFinanceiro.FormCreate(Sender: TObject);
var
  vpUsuario : TStringList;
begin
  sqlBoletos.Connection := dtmControles.DB;
  sqlPessoa.Connection := dtmControles.DB;

  btnEnviar.Visible             := vgRetornoEmail.enviarEmail;
  pnlEnvio.Visible              := vgRetornoEmail.enviarEmail;
  edtAssuntoEmail.Visible       := vgRetornoEmail.enviarEmail;
  edtCC.Visible                 := vgRetornoEmail.enviarEmail;
  btnConfirmar.Visible          := not vgRetornoEmail.enviarEmail;
  chxAssinaturaUsuario.Visible  := not vgRetornoEmail.enviarEmail;

  ClientAncestral.Open;

  if not vgRetornoEmail.enviarEmail then begin
    vgNovo         := ClientAncestral.IsEmpty;
    pnlEnvio.Color := clSilver;
    if ClientAncestral.IsEmpty then begin
      ClientAncestral.Insert;
      ClientAncestralAUTENTICAR_SERVIDOR.AsString  := 'N';
      ClientAncestralUSAR_EMAIL_USUARIO.AsString   := 'N';
      edtLinhas.EditValue := 1;
      memTextoPadrao.Lines.Clear;
    end
    else begin
      ClientAncestral.Edit;
      memTextoRodape.Text  := ClientAncestralTEXTO_RODAPE.AsString;
      memTextoPadrao.Text  := DecompressString(ClientAncestralTEXTO_EMAIL.AsString);
      edtLinhas.EditValue  := ClientAncestralESPACO_TEXTO_RODAPE.AsInteger;
    end;
  end
  else
  begin
    dtmLookup.LerDadadosConfigEmail(vgEmailConfig.Tabela);

    lcxEmailTextoPadrao.ItemIndex := 0;
    if lcxEmailTextoPadrao.EditValue = null then
         memTextoPadrao.Text := DecompressString(vgEmailConfig.TextoEmail.Text)
    else lcxEmailTextoPadraoPropertiesEditValueChanged(self);

    edtLinhas.EditValue       := vgEmailConfig.EspacoAssinatura;
    edtAssuntoEmail.EditValue := vgEmailConfig.AssuntoPadrao;

    vpUsuario := dtmControles.GetFields(' SELECT EMAIL, NOME_COMPLETO, FUNCAO FROM G_USUARIO WHERE USUARIO_ID = '+vgUsuarioID);
    vgEmailConfig.EmailEnvio := vpUsuario.Values['EMAIL'];
    if vgEmailConfig.EmailEnvio = '' then
      vgEmailConfig.EmailEnvio := ClientAncestralEMAIL_PADRAO.AsString;

    if vgEmailConfig.EmailEnvio = '' then begin
      Application.MessageBox(PChar('Email do usu�rio e/ou padr�o n�o configurado!' + #13 + #13 +
                                   'Op��o de envio desativada.'),'Informa��o', MB_ICONINFORMATION + MB_OK);
      btnEnviar.Enabled := False;
      Exit;
    end;

    if vgEmailConfig.AdAssinaturaUsuario then begin
      memTextoRodape.Lines.Add(MaiusculoMinusculo(vpUsuario.Values['NOME_COMPLETO']));
      memTextoRodape.Lines.Add(MaiusculoMinusculo(vpUsuario.Values['FUNCAO']));
      memTextoRodape.Text := memTextoRodape.Text + vgEmailConfig.TextoRodape.Text;
    end
    else memTextoRodape.Text := vgEmailConfig.TextoRodape.Text;
  end;
end;

procedure TfrmCadEnvioEmailFinanceiro.lcxEmailTextoPadraoPropertiesEditValueChanged(
  Sender: TObject);
var
  viWptTexto: TWPRichText;
begin
  viWptTexto := TWPRichText.Create(nil);
  viWptTexto.AsString       := DeCompressString(dtmLookup.sqlEmailTextoPadraoTEXTO.AsString);
  memTextoPadrao.Text       := viWptTexto.text;
  edtAssuntoEmail.EditValue := dtmLookup.sqlEmailTextoPadraoASSUNTO.AsString;
  FreeAndNil(viWptTexto);
end;

procedure TfrmCadEnvioEmailFinanceiro.pgcConfigChange(Sender: TObject);
begin
  if pgcConfig.ActivePage = tabConexao then
    edtHostSMTP.SetFocus
  else
    if pgcConfig.ActivePage = tabTextoPadrao then
         memTextoPadrao.SetFocus
    else memTextoRodape.SetFocus;
end;

procedure TfrmCadEnvioEmailFinanceiro.sqlBoletosCalcFields(DataSet: TDataSet);
begin
  if sqlBoletosBOLETO_EMAIL.AsString = '' then
       sqlBoletosCALC_EMAIL.AsString := sqlBoletosEMAIL1.AsString
  else sqlBoletosCALC_EMAIL.AsString := sqlBoletosBOLETO_EMAIL.AsString;
end;

end.
