unit Trava;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, dxSkinsCore,
  dxSkinBlue, cxControls, cxContainer, cxEdit, cxGroupBox, cxTextEdit, cxLabel,
  dxSkinBlack, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue;

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
      vlDataSistema : TDateTime;
      vlCpfCnpjSistema : String;
  end;

var
  frmTrava: TfrmTrava;
  vgDataValidadeSistema : String;
  vgHabilitaValidacao : Boolean;

  procedure ValidarSistema(vpValidar : Boolean = True);
  procedure CheckDataSistema;


implementation

uses
  Controles, Rotinas;

{$R *.dfm}

function FormataData(vfData : String) : String;
begin
  Result := Copy(vfData, 1, 2) + '/' + Copy(vfData, 3, 2) + '/' + Copy(vfData, 5, 4);
end;

procedure ValidarSistema(vpValidar : Boolean = True);
var
  viChave,
  viHabilitar,
  viCpfCnpj,
  viDiasValidade,
  viDataChave,
  viDataValidade : String;
begin
  if frmTrava = nil then
    Application.CreateForm(TfrmTrava, frmTrava);

  //Campos do Sistema
  frmTrava.vlCpfCnpjSistema := RetornaNumerico(dtmControles.BuscarConfig('PRINCIPAL','CARTORIO','CPFCNPJ','S'));//Cadastro do cartório
  frmTrava.vlDataSistema    := dtmControles.DataHoraBanco(3);//Data hora banco
  
  if vpValidar then
  begin
    try
      viChave        := dtmControles.BuscarParametroOutroSistema('TRAVA_SISTEMA', 'GERAL', 'PRINCIPAL', '5');
      //Campos da Chave
      viChave        := dtmControles.Cripto.CriptoHexToText(viChave);

      viHabilitar    := viChave[1];
      vgHabilitaValidacao := viHabilitar = 'S';
      viCpfCnpj      := Copy(viChave, 2, 14);
      viDiasValidade := Copy(viChave, 16, 3);
      viDataChave    := Copy(viChave, 19, 8);
      viDataValidade := Copy(viChave, 27, 8);
      vgDataValidadeSistema := viDataValidade;

      if viHabilitar <> 'N' then
      begin
        if (RetZeros(frmTrava.vlCpfCnpjSistema, 14) <> viCpfCnpj) then
        begin
          frmTrava.vlDias := 0;
          frmTrava.cxLabel1.Caption := 'ATENÇÃO: Sistema bloqueado chave invalida, solicite a liberação junto a empresa.';
          frmTrava.ShowModal;
        end
        else
        if StrToDate(FormataData(viDataChave)) >  frmTrava.vlDataSistema then
        begin
          frmTrava.vlDias := 0;
          frmTrava.cxLabel1.Caption := 'ATENÇÃO: Sistema bloqueado, período de liberação invalido, solicite a liberação junto a empresa.';
          frmTrava.ShowModal;
        end
        else
        begin
          frmTrava.vlDias := Trunc(StrToDate(FormataData(viDataValidade)) -  frmTrava.vlDataSistema);
          if (frmTrava.vlDias <= 10) then
          begin
            if frmTrava.vlDias > 0 then
              frmTrava.cxLabel1.Caption := 'ATENÇÃO: ' + RetZeros(IntToStr(frmTrava.vlDias), 2) + ' dia(s) para que o sistema seja bloqueado, solicite uma nova chave de liberação junto a empresa.'
            else
              frmTrava.cxLabel1.Caption := 'ATENÇÃO: Sistema bloqueado, solicite a chave de liberação junto a empresa.';
            frmTrava.ShowModal;
          end
          else
            frmTrava.Close;
        end;
      end
      else
        frmTrava.Close;
    except
       frmTrava.vlDias := 0;
       frmTrava.cxLabel1.Caption := 'ATENÇÃO: Sistema bloqueado chave invalida, solicite a liberação junto a empresa.';
       frmTrava.ShowModal;
    end;
  end
  else
  begin
    frmTrava.vlDias := 1;
    frmTrava.cxLabel1.Caption := 'ATENÇÃO: Informar nova chave de liberação do sistema!';
    frmTrava.ShowModal;
  end;
end;

procedure CheckDataSistema;
var
  viChave,
  viHabilitar,
  viDataValidade: String;
  viDataSistema : TDateTime;
begin
  if vgHabilitaValidacao and (frmTrava = nil) then
  begin
    //Campos do Sistema
    viDataSistema  := dtmControles.DataHoraBanco(3);//Data hora banco
    viDataValidade := vgDataValidadeSistema;
    
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
  viChave,
  viHabilitar,
  viCpfCnpj,
  viDiasValidade,
  viDataChave,
  viDataValidade,
  viSql : String;
begin
  if Trim(edtChave.Text)  <> '' then
  begin
    try
      viChave := dtmControles.Cripto.CriptoHexToText(edtChave.Text);
    except
      Application.MessageBox('Chave invalida!', 'Atenção', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;
    //Campos da Chave
    viHabilitar    := viChave[1];
    viCpfCnpj      := Copy(viChave, 2, 14);
    viDiasValidade := Copy(viChave, 16, 3);
    viDataChave    := Copy(viChave, 19, 8);
    viDataValidade := Copy(viChave, 27, 8);

    if Pos(viHabilitar, 'NS') <= 0 then
    begin
      Application.MessageBox('Chave invalida!', 'Atenção', MB_OK + MB_ICONINFORMATION);
      Abort;
    end
    else
    if (RetZeros(frmTrava.vlCpfCnpjSistema, 14) <> viCpfCnpj) and (frmTrava.vlCpfCnpjSistema <> '11111111111') then
    begin
      Application.MessageBox('Chave invalida!', 'Atenção', MB_OK + MB_ICONINFORMATION);
      Abort;
    end
    else
    if StrToDate(FormataData(viDataChave)) >  frmTrava.vlDataSistema then
    begin
      Application.MessageBox('Chave invalida!', 'Atenção', MB_OK + MB_ICONINFORMATION);
      Abort;
    end
    else
    if StrToDate(FormataData(viDataValidade)) < frmTrava.vlDataSistema then
    begin
      Application.MessageBox('Chave invalida!', 'Atenção', MB_OK + MB_ICONINFORMATION);
      Abort;
    end;

    try
     if Trim(vlCpfCnpjSistema) = '11111111111' then
     begin
       viSql := ' UPDATE G_CONFIG SET VALOR = ' + QuotedStr(Trim(viCpfCnpj)) +
                ' WHERE NOME  = ''CPFCNPJ'' AND '+
                '       SECAO = ''CARTORIO'' AND '+
                '       CONFIG_GRUPO_ID = (SELECT CONFIG_GRUPO_ID FROM G_CONFIG_GRUPO '+
                '                          WHERE DESCRICAO = ''PRINCIPAL'' AND SISTEMA_ID = 15) ';
       dtmControles.ExecSQL(viSql);
     end;

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
  end
  else
    Application.MessageBox('Chave em branco!', 'Atenção', MB_OK + MB_ICONINFORMATION);
end;

procedure TfrmTrava.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action   := caFree;
  frmTrava := nil;
end;

end.
