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
  viDiasValidade,
  viDataChave,
  viDataValidade,
  viCpfCnpjSistema : String;
  viDataSistema: TDateTime;
begin
  if frmTrava = nil then
    Application.CreateForm(TfrmTrava, frmTrava);

  if Trim(frmTrava.edtChave.Text) = '' then
    viChave        := Trim(dtmControles.BuscarParametroOutroSistema('TRAVA_SISTEMA', 'GERAL', 'PRINCIPAL', '5'))
  else
    viChave        := Trim(frmTrava.edtChave.Text);

  if Trim(viChave) = '' then
  begin
    Application.MessageBox('Chave inv�lida!', 'Aten��o', MB_OK + MB_ICONINFORMATION);
    Application.Terminate;
  end; 

  //Campos do Sistema
  //viCpfCnpjSistema := RetornaNumerico(dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'CNPJ', 'S')); //Cadastro do cart�rio

  viCpfCnpjSistema := RetornaNumerico(
    dtmControles.BuscarParametroOutroSistema(
      'CNPJ',
      'CARTORIO',
      'PRINCIPAL',
      '5')); //Cadastro do cart�rio

  viDataSistema    := dtmControles.DataHoraBanco(3); //Data hora banco

  //Campos da Chave
  viChave             := dtmControles.Cripto.CriptoHexToText(viChave);
  vgChaveTravaSistema := viChave;

  viHabilitar    := viChave[1];
  viCpfCnpj      := Copy(viChave, 2, 14);
  viDiasValidade := Copy(viChave, 16, 3);
  viDataChave    := Copy(viChave, 19, 8);
  viDataValidade := Copy(viChave, 27, 8);

  if (viHabilitar <> 'N') or (Length(vgChaveTravaSistema) <> 34) then
  begin
    if RetZeros(viCpfCnpjSistema, 14) <> viCpfCnpj then
    begin
      frmTrava.vlDias := 0;
      frmTrava.cxLabel1.Caption := 'ATEN��O: Sistema bloqueado, chave inv�lida, solicite a libera��o junto � empresa.';

      if not (frmTrava.Showing or (fsShowing in frmTrava.FormState)) then
        frmTrava.ShowModal;
    end
    else
    if StrToDate(FormataData(viDataChave)) > viDataSistema then
    begin
      frmTrava.vlDias := 0;
      frmTrava.cxLabel1.Caption := 'ATEN��O: Sistema bloqueado, per�odo de libera��o inv�lido, solicite a libera��o junto � empresa.';

      if not (frmTrava.Showing or (fsShowing in frmTrava.FormState)) then
        frmTrava.ShowModal;
    end
    else
    begin
      frmTrava.vlDias := Trunc(StrToDateTime(FormataData(viDataValidade) + ' 23:59:59') - viDataSistema);

      if (frmTrava.vlDias = 0) and ((StrToDateTime(FormataData(viDataValidade) + ' 23:59:59') - viDataSistema) > 0) then
        frmTrava.vlDias := 1;

      if (frmTrava.vlDias <= 7) then
      begin
        if (frmTrava.vlDias > 0) and (frmTrava.vlDias > 4) then
          frmTrava.cxLabel1.Caption := 'ATEN��O: Pagamento n�o identificado, favor enviar o comprovante para o e-mail abaixo.'
        else
        if (frmTrava.vlDias > 0) then
          frmTrava.cxLabel1.Caption := 'ATEN��O: Falta(m) ' + RetZeros(IntToStr(frmTrava.vlDias), 2) + ' dia(s) para que o sistema seja bloqueado, solicite a chave de libera��o junto � empresa.'
        else
          frmTrava.cxLabel1.Caption := 'ATEN��O: Sistema bloqueado, solicite a chave de libera��o junto � empresa.';

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
  viDataValidade: String;
  viDataSistema : TDateTime;
begin
  viChave        := vgChaveTravaSistema;
  viHabilitar    := viChave[1];

  if viHabilitar = 'S' then
  begin
    //Campos do Sistema
    viDataSistema  := dtmControles.DataHoraBanco(3); //Data hora banco
    viDataValidade := Copy(viChave, 27, 8);
    
    if StrToDate(FormataData(viDataValidade)) < viDataSistema then
      ValidarSistema;
  end;
end;

procedure TFormfrmTravaCancelarClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmTrava.btnCancelarClick(Sender: TObject);
begin
  if vlDias > 0 then
    Close
  else
    Application.Terminate;  
end;

procedure TfrmTrava.btnConfirmarClick(Sender: TObject);
var
  viSql : string;
begin
  ValidarSistema;

  if (vlDias <= 0) then
  begin
    Application.MessageBox('Chave inv�lida! Maiores detalhes na tela de libera��o.', 'Aten��o', MB_OK + MB_ICONINFORMATION);
    Abort;
  end;

  if (vlDias > 0) and (Trim(edtChave.Text) <> '') then
  begin
    try
      viSql := ' UPDATE G_CONFIG SET VALOR = ' + QuotedStr(Trim(edtChave.Text)) +
               ' WHERE NOME  = ''TRAVA_SISTEMA'' AND '+
               '       SECAO = ''GERAL'' AND '+
               '       CONFIG_GRUPO_ID = (SELECT CONFIG_GRUPO_ID FROM G_CONFIG_GRUPO '+
               '                          WHERE DESCRICAO = ''PRINCIPAL'' AND SISTEMA_ID = 5) ';
      dtmControles.ExecSQL(viSql);
    except
      Application.MessageBox('Erro ao atribuir a chave, entre em contato com o suporte!', 'Aten��o', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;
    Application.MessageBox('Chave atualizada com sucesso!', 'Aten��o', MB_OK + MB_ICONEXCLAMATION);
    Close;
  end;
end;

procedure TfrmTrava.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action   := caFree;
  frmTrava := nil;
end;

end.