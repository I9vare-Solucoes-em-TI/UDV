unit dmChat;

interface

uses
  I9Query,
  I9Connection,
  SysUtils, Classes, DB, DBClient, SimpleDS, Forms, Windows, ExtCtrls, MSNPopUp,
  FMTBcd, SqlExpr, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TdtmChat = class(TDataModule)
    sqlChat: TI9Query;
    timerChat: TTimer;
    msnChatEmail: TMSNPopUp;
    sqlChatNomeUsuario: TStringField;
    sqlChatCHAT_ID: TBCDField;
    sqlChatDATA: TSQLTimeStampField;
    sqlChatUSUARIO_RECEBEU_ID: TBCDField;
    sqlChatUSUARIO_ENVIOU_ID: TBCDField;
    sqlChatRECEBEU: TStringField;
    sqlChatMENSAGEM_BLOB: TBlobField;
    sqlTimerChat: TI9Query;
    sqlAuxiliarChat: TI9Query;
    SimpleAuxiliarChat: TI9Query;
    procedure EnviarMensagem;
    procedure DataModuleCreate(Sender: TObject);
    procedure sqlChatCalcFields(DataSet: TDataSet);
    procedure timerChatTimer(Sender: TObject);
    procedure AtualizarChat;
    procedure msnChatEmailURLClick(Sender: TObject; URL: String);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmChat: TdtmChat;
  vgNotificarChatAgenda: string;
  
implementation

uses Controles, Chat, Rotinas;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure TdtmChat.DataModuleCreate(Sender: TObject);
begin
  sqlChat.Connection := dtmControles.DB;
  SimpleAuxiliarChat.Connection := dtmControles.DB;
  sqlAuxiliarChat.Connection := dtmControles.DB;
  sqlTimerChat.Connection := dtmControles.DB;
end;

procedure TdtmChat.EnviarMensagem;
var
  i: Integer;

  procedure InserirChat(vPara, vParaNome: string);
  begin
    with sqlAuxiliarChat do
    begin
      Active := False;
      Sql.Clear;
      Sql.Add('INSERT INTO G_CHAT(CHAT_ID, USUARIO_RECEBEU_ID, '+
              '                   RECEBEU, USUARIO_ENVIOU_ID, '+
              '                   MENSAGEM_BLOB, DATA, EXCLUIR)'+
              '            VALUES(:CHAT_ID, :USUARIO_RECEBEU_ID, '+
              '                   :RECEBEU, :USUARIO_ENVIOU_ID, '+
              '                   :MENSAGEM_BLOB, :DATA, :EXCLUIR)');
      Params[0].AsCurrency := dtmControles.GetInt('SELECT GEN_ID(CHAT_SEQ,1) FROM RDB$DATABASE');
      Params[1].AsString := vPara;
      Params[2].AsString := 'N';
      Params[3].AsString := vgUsuarioID;
      Params[4].AsString   := CompressString(frmChat.edtNovaMensagem.Text);
      Params[5].AsDateTime := dtmControles.DataHoraBanco(3);
      Params[6].AsString := 'N';
      ExecSQL;
      Active := False;
    end;

    with frmChat do
    begin
      if not chbTodos.Checked then
      begin
        if edtChat.Lines.Count > 0 then
          edtChat.Lines.Add('');
        edtChat.Lines.Add(dtmControles.DataHoraBanco(5)+ ' - Você enviou Para: '+vParaNome);
        edtChat.Lines.Add(edtNovaMensagem.Text);
      end;
    end;
  end;
begin

  with frmChat do
  begin
    if not chbTodos.Checked then
    begin
      if lstPara.Items.Count > 0 then
      begin
        for i := 0 to lstPara.Items.Count - 1 do
          InserirChat(lstParaCodigo.Items.Strings[i],lstPara.Items.Strings[i]);
      end
      else
      begin
        if Trim(lcxUsuarioChat.EditText) = '' then
          Exit;

        InserirChat(CurrToStr(lcxUsuarioChat.EditValue), lcxUsuarioChat.EditText);
      end;
    end
    else
    begin
      if Application.MessageBox(
           'Tem certeza que deseja enviar a mensagem para Todos?',
           'Pergunta',
           MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION
         ) = IDYES
      then
      begin

        with SimpleAuxiliarChat do
        begin
          Active := False;
          SQL.Text := 'SELECT USUARIO_ID FROM G_USUARIO '+
                                 ' WHERE SITUACAO = ''A''' +
                                 ' AND (NAO_RECEBER_CHAT_TODOS IS NULL '+
                                 ' OR NAO_RECEBER_CHAT_TODOS = ''N'')';
          Active := True;
          First;

          while not Eof do
          begin
            Inserirchat(Fields[0].AsString,'TODOS');
            Next;
          end;

          Active := False;
        end;
      end;
    end;
  end;


end;

procedure TdtmChat.sqlChatCalcFields(DataSet: TDataSet);
begin
  with sqlAuxiliarChat do
  begin
    Active := False;
    Sql.Clear;
    Sql.Add('SELECT LOGIN FROM G_USUARIO '+
            ' WHERE USUARIO_ID = '+ sqlChatUSUARIO_ENVIOU_ID.AsString);
    Active := True;

    sqlChatNomeUsuario.AsString := Fields[0].AsString;

    Active := False;
  end;
end;

procedure TdtmChat.timerChatTimer(Sender: TObject);
begin
  if vgNotificarChatAgenda = 'S' then
  begin
    if frmChat = nil then
      Application.CreateForm(TfrmChat, frmChat);

    AtualizarChat;
  end
  else
  begin
    if frmChat <> nil then
      AtualizarChat;
  end;
end;

procedure TdtmChat.AtualizarChat;
begin
  with sqlChat do
  begin
    Active := False;
    SQL.Text := 'SELECT * FROM R_ATUALIZA_CHAT_NOVO(:USUARIO_ID)';
    Params[0].AsString := vgUsuarioID;
    Active := True;

    First;
  end;

  while not sqlChat.Eof do
  begin
    if (sqlChatRECEBEU.AsString <> 'S') then
    begin

      if vgNotificarChatAgenda = 'S' then
      begin
        msnChatEmail.GradientColor1 := $00C6E3E2;
        msnChatEmail.OnURLClick := msnChatEmailURLClick;

        msnChatEmail.Text := copy(DeCompressString(sqlChatMENSAGEM_BLOB.AsString),1,60)+'...';
        msnChatEmail.URL := sqlChatDATA.AsString;
        msnChatEmail.Title := sqlChatNomeUsuario.AsString;
        msnChatEmail.ShowPopUp;
      end;

      with sqlTimerChat do
      begin
        Active := False;

        Sql.Clear;
        Sql.Add(
          ' UPDATE G_CHAT ' +
          ' SET RECEBEU = ' + QuotedStr('S') +
          ' WHERE CHAT_ID = ' + sqlChatCHAT_ID.AsString
        );

        ExecSQL;
        Active := False;        
      end;

      with frmChat do
      begin
        if edtChat.Lines.Count > 0 then
          edtChat.Lines.Add('');

        edtChat.Lines.Add(
          FormatDateTime('DD/MM/YYYY hh:mm', sqlChatDATA.AsDateTime) +
          ' - ' +
          sqlChatNomeUsuario.AsString +
          ' Escreveu: '
        );
        edtChat.Lines.Add(DeCompressString(sqlChatMENSAGEM_BLOB.AsString));
      end;
    end;
    sqlChat.Next;
    Application.ProcessMessages;
  end;

  sqlChat.Active := False; 
end;

procedure TdtmChat.msnChatEmailURLClick(Sender: TObject; URL: String);
begin
  ExibirFormulario(TfrmChat, frmChat, True, True);
end;

end.
