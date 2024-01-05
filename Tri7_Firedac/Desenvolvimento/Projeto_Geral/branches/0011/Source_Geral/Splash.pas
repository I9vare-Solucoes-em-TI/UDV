unit Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, cxControls,
  cxContainer, cxEdit, cxLabel, AnimationThread, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, frxClass, DBClient, Vcl.Menus, Data.DB, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxButtons, cxGroupBox, IniFiles, dxGDIPlusClasses;

type
  TfrmSplash = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Progress: TPanel;
    cxLabel19: TcxLabel;
    dtsBases: TDataSource;
    ClientBases: TClientDataSet;
    ClientBasesDescricao: TStringField;
    ClientBasesCaminho: TStringField;
    pnSelecaoBase: TPanel;
    cxGroupBox1: TcxGroupBox;
    lcxBases: TcxLookupComboBox;
    btnConfirmar: TcxButton;
    ClientBasesHistorico: TStringField;
    btnCancelar: TcxButton;
    lblNomeSistema: TcxLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure lcxBasesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure CarregarArquivo(vpNomeArquivo : String; vpClientDataSet : TClientDataSet);
  public
    { Public declarations }
  end;

var
  frmSplash: TfrmSplash;
  ani   : TAnimationThread;
  r     : TRect;
  vgAtivarSelecaoBase : Boolean;
  vgBaseSelecionada, vgHistoricoSelecionado, vgSplashNomeSistema : String;

implementation

uses
  Rotinas;


{$R *.dfm}

procedure TfrmSplash.btnCancelarClick(Sender: TObject);
begin
  vgBaseSelecionada := '';
  Close;
end;

procedure TfrmSplash.btnConfirmarClick(Sender: TObject);
var
  Ini : TIniFile;
begin
  if lcxBases.Text = '' then
  begin
    ShowMessage('Selecione a Base Desejada');
    lcxBases.SetFocus;
    exit;
  end;
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
  Ini.WriteString('GERAL', 'BaseDados', lcxBases.EditValue);
  Ini.Free;
  vgBaseSelecionada      := ClientBasesCaminho.AsString;
  vgHistoricoSelecionado := ClientBasesHistorico.AsString;
  Close;
end;

procedure TfrmSplash.CarregarArquivo(vpNomeArquivo : String;
  vpClientDataSet: TClientDataSet);
var
  arq     : TextFile;
  vilinha : String;

  Function PegandoValorLinha:Variant;
  var
    viPos : Integer;
  begin
    viPos := pos(';', viLinha);
    if viPos > 0 then
         Result := copy(vilinha, 1, viPos-1)
    else Result := vilinha;
    vilinha := copy(vilinha, viPos+1,length(vilinha));
    Application.ProcessMessages;
  end;

  procedure CarregarBase;
  begin
    vpClientDataSet.Append;
    vpClientDataSet.FieldByName('Descricao').AsString  := PegandoValorLinha;
    vpClientDataSet.FieldByName('Caminho').AsString    := PegandoValorLinha;
    vpClientDataSet.FieldByName('Historico').AsString  := PegandoValorLinha;
    vpClientDataSet.Post;
  end;

  procedure VerificarCaminhoAtual;
  var
    Ini : TIniFile;
    viCaminhoAtual : String;
  begin
    Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Config.ini');
    viCaminhoAtual := Ini.ReadString('GERAL', 'BaseDados', '');
    Ini.Free;

    if ClientBases.Locate('CAMINHO', viCaminhoAtual, [loCaseInsensitive]) then
         lcxBases.EditValue := viCaminhoAtual
    else lcxBases.ItemIndex := 0;
  end;

begin
  if not FileExists(ExtractFilePath(Application.ExeName) + vpNomeArquivo+'.txt') then
    Exit;

  AssignFile(arq, ExtractFilePath(Application.ExeName) + vpNomeArquivo+'.txt');
  vpClientDataSet.EmptyDataSet;

  vpClientDataSet.DisableControls;
  Reset ( arq );
  while not Eof ( arq ) do
  begin
    Readln ( arq, vilinha );
    CarregarBase;
  end;
  CloseFile(arq);
  vpClientDataSet.EnableControls;
  VerificarCaminhoAtual;
end;

procedure TfrmSplash.FormActivate(Sender: TObject);
begin
  pnSelecaoBase.Visible := vgAtivarSelecaoBase;
  if vgAtivarSelecaoBase then
  begin
    lcxBases.SetFocus;
    exit;
  end
  else frmSplash.Height := 228;

  Application.ProcessMessages;
  r := Progress.clientrect;
  InflateRect(r, - Progress.bevelwidth, - Progress.bevelwidth);
  ani := TanimationThread.Create(Progress, r, Progress.color, $009D9D00, 20);
  Application.ProcessMessages;
end;

procedure TfrmSplash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if vgAtivarSelecaoBase then
  begin
    Action := caFree;
    frmSplash := nil;
    vgAtivarSelecaoBase := False;
  end
  else ani.Terminate;
end;

procedure TfrmSplash.FormCreate(Sender: TObject);
begin
  lblNomeSistema.Caption := vgSplashNomeSistema;
  CarregarArquivo('Bases', ClientBases);
end;

procedure TfrmSplash.lcxBasesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
    btnConfirmarClick(self);
end;

end.
