unit BackupRestaura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ShlObj, cxControls, cxContainer,
  cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxShellComboBox,
  ExtCtrls, StdCtrls, cxButtons, ZLib,
  cxShellBrowserDialog, Menus,





  cxLabel,
  cxPC, cxStyles, IniFiles,
  cxClasses, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxShellCommon, dxGDIPlusClasses, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxPCdxBarPopupMenu,
  IPPeerClient, Datasnap.DSCommon;

type
  TfrmBackupRestaura = class(TForm)
    Panel2: TPanel;
    memoLog: TMemo;
    cxStyleRepository1: TcxStyleRepository;
    Panel4: TPanel;
    imgPagar: TImage;
    lblInformacaoTitulo: TcxLabel;
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
    btnConfirmarItem: TcxButton;
    btnCancelar: TcxButton;
    DSClientCallbackChannelManager1: TDSClientCallbackChannelManager;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarItemClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnProcurarBackupClick(Sender: TObject);
  private
    Ini : TIniFile;
    function CriarProcessoWindows(cmd: string): boolean;
  public
  end;

var
  frmBackupRestaura: TfrmBackupRestaura;
  vgBackupTipo : Integer;

implementation

uses Math, Controles, Principal;

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

{    with IBBackupService1 do
    begin
      memoLog.Clear;

      Params.Clear;
      BackupFile.Clear;

      Protocol   := Local;
      ServerName := 'LocalHost';

      LoginPrompt := False;
      Params.Add('user_name=SYSDBA');
      Params.Add('password=masterkey');
      Active := True;
      try
        Verbose := True;
        Options := [NonTransportable, IgnoreLimbo];
        viLocalBackup := cbxPasta.AbsolutePath+'\TESOURARIA.FBK';
        DatabaseName := GetCurrentDir+'\BASE\TESOURARIA.FDB';
        viBackup      := viLocalBackup;
        BackupFile.Add(viBackup);
        ServiceStart;
        While not Eof do
          memoLog.Lines.Add(GetNextLine);

//        CopyFile(Pchar(viBackup), Pchar(cbxPasta.AbsolutePath+'\TESOURARIA.FBK'), True);

        // Apaga o Arquivo GBK
//        DeleteFile(viBackup);
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

    Close; }
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

{    with IBRestoreService1 do
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
      Params.Add('password=masterkey');
      Active := True;
      try
        viLocalBackup := copy(GetCurrentDir+'\BASE\TESOURARIA.FDB', 1, (Length(GetCurrentDir+'\BASE\TESOURARIA.FDB')-4));
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
    frmPrincipal.Close;    }
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

function TfrmBackupRestaura.CriarProcessoWindows(cmd: string): boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
begin
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  SUInfo.cb      := SizeOf(SUInfo);
  SUInfo.dwFlags := STARTF_USESHOWWINDOW;
  SUInfo.wShowWindow := SW_HIDE;

  Result := CreateProcess(nil,
                          PChar(cmd),
                          nil,
                          nil,
                          false,
                          CREATE_NEW_CONSOLE or
                          NORMAL_PRIORITY_CLASS,
                          nil,
                          nil,
                          SUInfo,
                          ProcInfo);

  if (Result) then
  begin
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);

    CloseHandle(ProcInfo.hProcess);
    CloseHandle(ProcInfo.hThread);
  end
  else
  begin
    ShowMessage('Problemas na execução do Backup. Verifique!!!');
    abort;
  end;
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

