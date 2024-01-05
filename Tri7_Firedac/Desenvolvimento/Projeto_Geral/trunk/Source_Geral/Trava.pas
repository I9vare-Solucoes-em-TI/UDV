unit Trava;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, cxButtons, cxControls,
  cxContainer, cxEdit, cxGroupBox, cxTextEdit, cxLabel, ECripto, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinMcSkin,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinsDefaultPainters;

type
  TfrmTrava = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtChave: TcxTextEdit;
    cxLabel3: TcxLabel;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      vlDias : Integer;
  end;

var
  frmTrava: TfrmTrava;
  vgChaveTravaSistema : String;

  procedure ValidarSistema;
  procedure CheckDataSistema;


implementation

{$R *.dfm}

uses Rotinas, Controles;

function FormataData(vfData : String) : String;
begin
  Result := Copy(vfData, 1, 2) + '/' + Copy(vfData, 3, 2) + '/' + Copy(vfData, 5, 4);
end;

procedure ValidarSistema;
var
  viChave,
  viHabilitar,
  viCpfCnpj,
  viDataLiberacao,
  viDataBloqueio,
  viCpfCnpjSistema : String;
  viDiasValidade,
  viDiasAvisoVencimento : Integer;
  viDataSistema: TDate;
begin
  if frmTrava = nil then
    Application.CreateForm(TfrmTrava, frmTrava);

  if Trim(frmTrava.edtChave.Text) = '' then
    viChave        := Trim(dtmControles.BuscarParametroOutroSistema('TRAVA_SISTEMA', 'GERAL', 'PRINCIPAL', '5'))
  else
    viChave        := Trim(frmTrava.edtChave.Text);

  if Trim(viChave) = '' then
  begin
    Application.MessageBox('Chave inválida!', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Application.Terminate;
  end; 

  viCpfCnpjSistema := RetornaNumerico(
    dtmControles.BuscarParametroOutroSistema(
      'CNPJ',
      'CARTORIO',
      'PRINCIPAL',
      '5')); //Cadastro do cartório

  viDataSistema := StrToDate(dtmControles.DataHoraBanco(4)); //Data banco

  //Campos da Chave
  viChave             := dtmControles.Cripto.CriptoHexToText(viChave);
  vgChaveTravaSistema := viChave;

  viHabilitar     := viChave[1];
  viCpfCnpj       := Copy(viChave, 2, 14);
  viDiasValidade  := StrToInt(Copy(viChave, 16, 3));
  viDataLiberacao := Copy(viChave, 19, 8);
  viDataBloqueio  := Copy(viChave, 27, 8);

  if viDiasValidade < 7 then
    viDiasValidade := 7;

  viDiasAvisoVencimento := viDiasValidade - 3;

  if (viHabilitar <> 'N') or (Length(vgChaveTravaSistema) <> 34) then
  begin
    if RetZeros(viCpfCnpjSistema, 14) <> viCpfCnpj then
    begin
      frmTrava.vlDias := -1;
      frmTrava.cxLabel1.Caption := 'ATENÇÃO: Sistema bloqueado, chave inválida, solicite a liberação junto à empresa.';

      if not (frmTrava.Showing or (fsShowing in frmTrava.FormState)) then
        frmTrava.ShowModal;
    end
    else
    if StrToDate(FormataData(viDataLiberacao)) > viDataSistema then
    begin
      frmTrava.vlDias := -1;
      frmTrava.cxLabel1.Caption := 'ATENÇÃO: Sistema bloqueado, período de liberação inválido, solicite a liberação junto à empresa.';

      if not (frmTrava.Showing or (fsShowing in frmTrava.FormState)) then
        frmTrava.ShowModal;
    end
    else
    begin
      frmTrava.vlDias := Trunc(StrToDate(FormataData(viDataBloqueio)) - viDataSistema);

      if (frmTrava.vlDias < viDiasValidade) then
      begin
        if (frmTrava.vlDias >= viDiasAvisoVencimento) then
          frmTrava.cxLabel1.Caption := 'ATENÇÃO: Pagamento não identificado, favor enviar o comprovante para o e-mail abaixo.'
        else
        if (frmTrava.vlDias > 0) then
          frmTrava.cxLabel1.Caption := 'ATENÇÃO: Falta(m) ' + RetZeros(IntToStr(frmTrava.vlDias), 2) + ' dia(s) para que o sistema seja bloqueado, solicite a chave de liberação junto à empresa.'
        else
        if (frmTrava.vlDias = 0) then
          frmTrava.cxLabel1.Caption := 'ATENÇÃO: Sistema será bloqueado hoje, solicite a chave de liberação junto à empresa.'
        else
          frmTrava.cxLabel1.Caption := 'ATENÇÃO: Sistema bloqueado, solicite a chave de liberação junto à empresa.';

        if not (frmTrava.Showing or (fsShowing in frmTrava.FormState)) then
          frmTrava.ShowModal;
      end
      else
        frmTrava.Close;
    end;
  end
  else
  begin
    frmTrava.vlDias := 1;
    frmTrava.Close;
  end;
end;

procedure CheckDataSistema;
var
  viChave,
  viHabilitar,
  viDataBloqueio: String;
  viDataSistema : TDateTime;
begin
  viChave        := vgChaveTravaSistema;
  viHabilitar    := viChave[1];

  if viHabilitar = 'S' then
  begin
    //Campos do Sistema
    viDataSistema  := dtmControles.DataHoraBanco(3); //Data hora banco
    viDataBloqueio := Copy(viChave, 27, 8);
    
    if StrToDate(FormataData(viDataBloqueio)) < viDataSistema then
      ValidarSistema;
  end;
end;

procedure TFormfrmTravaCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmTrava.btnCancelarClick(Sender: TObject);
begin
  if vlDias >= 0 then
    Close
  else
    Application.Terminate;  
end;

procedure TfrmTrava.btnConfirmarClick(Sender: TObject);
var
  viSql : string;
begin
  try
    ValidarSistema;

    if (vlDias < 0) then
      Abort;

  except
    Application.MessageBox('Chave inválida! Maiores detalhes na tela de liberação.', 'Atenção', MB_OK + MB_ICONINFORMATION);
    Exit;
  end;

  if (vlDias >= 0) and (Trim(edtChave.Text) <> '') then
  begin
    try
      viSql := ' UPDATE G_CONFIG SET VALOR = ' + QuotedStr(Trim(edtChave.Text)) +
               ' WHERE NOME  = ''TRAVA_SISTEMA'' AND '+
               '       SECAO = ''GERAL'' AND '+
               '       CONFIG_GRUPO_ID = (SELECT CONFIG_GRUPO_ID FROM G_CONFIG_GRUPO '+
               '                          WHERE DESCRICAO = ''PRINCIPAL'' AND SISTEMA_ID = 5) ';
      dtmControles.ExecSQL(viSql);
    except
      Application.MessageBox('Erro ao atribuir a chave, entre em contato com o suporte!', 'Atenção', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;
    Application.MessageBox('Chave atualizada com sucesso!', 'Atenção', MB_OK + MB_ICONEXCLAMATION);
    Close;
  end;
end;

procedure TfrmTrava.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action   := caFree;
  frmTrava := nil;
end;

end.
