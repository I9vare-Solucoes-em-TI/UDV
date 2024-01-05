unit BackupRestaura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ShlObj, cxShellCommon, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxShellComboBox,
  ExtCtrls, StdCtrls, cxLookAndFeelPainters, cxButtons, IBServices, ZLib,
  cxShellBrowserDialog, Menus, dxSkinsCore, dxSkinsDefaultPainters, dxSkinBlack,
  dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxLabel,
  dxGDIPlusClasses, cxPC, cxStyles, IniFiles;

type
  TfrmBackupRestaura = class(TForm)
    Panel2: TPanel;
    IBBackupService1: TIBBackupService;
    IBRestoreService1: TIBRestoreService;
    btnCancelar: TcxButton;
    memoLog: TMemo;
    cxStyleRepository1: TcxStyleRepository;
    Panel4: TPanel;
    imgPagar: TImage;
    lblInformacaoTitulo: TcxLabel;
    btnConfirmarItem: TcxButton;
    cxShellBrowserDialog1: TcxShellBrowserDialog;
    pgcBackup: TcxPageControl;
    tabBAckup: TcxTabSheet;
    lblLocalArquivo: TLabel;
    cxLabel1: TcxLabel;
    cbxPasta: TcxShellComboBox;
    Restaura: TcxTabSheet;
    Label4: TLabel;
    edtNomeArquivoRestaura: TcxTextEdit;
    Label5: TLabel;
    btnProcurarBackup: TcxButton;
    OpenDialog1: TOpenDialog;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarItemClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnProcurarBackupClick(Sender: TObject);
  private
    Ini : TIniFile;
  public
  end;

var
  frmBackupRestaura: TfrmBackupRestaura;
  vgBackupTipo : Integer;

implementation

uses Math, principal, Controles;

{$R *.dfm}

procedure TfrmBackupRestaura.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmBackupRestaura.btnConfirmarItemClick(Sender: TObject);
var
  viBackup, viLocalBackup : string;

  Procedure RealizarBackup;
  begin
    if MessageDlg('Confirma realização do backup?!', mtConfirmation,[mbYes, mbNo],0) = mrNo then
      exit;

    Screen.Cursor := crHourGlass;

    // Fecha a Base de Dados
    dtmControles.DB.Connected := False;

    with IBBackupService1 do
    begin
      memoLog.Clear;

      Params.Clear;
      BackupFile.Clear;

      Protocol   := Local;
      ServerName := 'localhost';

      LoginPrompt := False;
      Params.Add('user_name=SYSDBA');
      Params.Add('password='+vgDadosBase.Senha);
      Active := True;
      try
        Verbose := True;
        Options := [NonTransportable, IgnoreLimbo];
        DatabaseName := vgDadosBase.Local;
        viLocalBackup := copy(vgDadosBase.Local, 1, (Length(vgDadosBase.Local)-4));
        viBackup      := viLocalBackup + '.FBK';
        BackupFile.Add(viBackup);
        ServiceStart;
        While not Eof do
          memoLog.Lines.Add(GetNextLine);

        CopyFile(Pchar(viBackup), Pchar(cbxPasta.AbsolutePath+'\'+vgDadosBase.NomeBase+'.FBK'), True);

        // Apaga o Arquivo GBK
        DeleteFile(viBackup);
      finally
        Screen.Cursor := crDefault;
        Active := False;
      end;
    end;
    Screen.Cursor := crDefault;

    // Abrir a Base de Dados
    dtmControles.DB.Connected := True;
    Application.MessageBox('Backup executado com sucesso!!!', 'Informação', MB_Ok + MB_ICONWARNING);

    Ini.WriteString('BACKUP', 'LocalBackup', dtmControles.Cripto.TextToCriptoHex(cbxPasta.AbsolutePath));

    Close;
  end;

  procedure RestaurarBackup;
  begin
    if trim(edtNomeArquivoRestaura.Text) = '' then
    begin
      Showmessage('Indique onde esta o seu Arquivo de Backup');
      btnProcurarBackup.SetFocus;
      exit;
    end;

    if MessageDlg('Confirma restauração do backup?!', mtConfirmation,[mbYes, mbNo],0) = mrNo then
      exit;

    dtmControles.DB.Connected := False;

    with IBRestoreService1 do
    begin
      // Fecha a Base de Dados

      memoLog.Clear;
      Screen.Cursor := crHourGlass;
      Params.Clear;
      BackupFile.Clear;

      Protocol   := Local;
      ServerName := 'localhost';

      LoginPrompt := False;
      Params.Add('user_name=SYSDBA');
      Params.Add('password='+vgDadosBase.Senha);
      Active := True;
      try
        viLocalBackup := copy(vgDadosBase.Local, 1, (Length(vgDadosBase.Local)-4));
        viBackup      := viLocalBackup + '.FDB';

        // Descompactar Arquivo
        memoLog.Lines.Add('');
        memoLog.Lines.Add('RESTAURANDO BASE DE DADOS!!!');
        memoLog.Lines.Add('');

        // Rotina de Restauração
        Verbose := True;
        Options := [Replace, UseAllSpace];
        PageBuffers := 3000;
        PageSize := 8192;
        DatabaseName.Add(viBackup);
        BackupFile.Add(edtNomeArquivoRestaura.Text);
        ServiceStart;
        While not Eof do
          memoLog.Lines.Add(GetNextLine);
      except
        on E: exception do
          Application.MessageBox(Pchar(E.Message), 'Aviso', mb_IconExclamation);
      end;
    end;

    memoLog.Lines.Add('');
    memoLog.Lines.Add('RESTAURAÇÃO DO BACKUP EFETUADA COM SUCESSO!!!');
    memoLog.Lines.Add('');

    ShowMessage('Restauração Efetuada com Sucesso. O Sistema Fechará automaticamente para ativar as configurações!!!');
    vgFecharAutomatico := True;
    frmPrincipal.Close;
  end;

begin
  if vgBackupTipo = 0 then
       RealizarBackup
  else RestaurarBackup;
end;

procedure TfrmBackupRestaura.btnProcurarBackupClick(Sender: TObject);
var
  viExtensao : string;
begin
  OpenDialog1.Execute;
  viExtensao := ExtractFileExt(OpenDialog1.FileName);
  if UpperCase(viExtensao) <> '.FBK' then
    if UpperCase(viExtensao) <> '.GBK' then
    begin
      Showmessage('Arquivo inválido!!!');
      exit;
    end;
  edtNomeArquivoRestaura.Text := OpenDialog1.FileName;
end;

procedure TfrmBackupRestaura.FormActivate(Sender: TObject);
var
  viLocalBackup : String;
begin
  //Busca Valores para variáveis de acesso ao banco
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  viLocalBackup := dtmControles.Cripto.CriptoHexToText(Ini.ReadString('BACKUP', 'LocalBackup', ''));

  if viLocalBackup <> '' then
    cbxPasta.AbsolutePath := viLocalBackup;

  pgcBackup.ActivePageIndex := vgBackupTipo;
  if vgBackupTipo = 0 then
       lblInformacaoTitulo.Caption := '>> Realizar Backup'
  else lblInformacaoTitulo.Caption := '>> Restaurar Backup';

  pgcBackup.HideTabs := True;
end;

procedure TfrmBackupRestaura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Ini.Free;

  Action := caFree;
  frmBackupRestaura := nil;
end;

end.

