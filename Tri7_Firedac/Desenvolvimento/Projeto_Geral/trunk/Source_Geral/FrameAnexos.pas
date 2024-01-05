unit FrameAnexos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Winapi.ShlObj, cxShellCommon, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxListView,
  Vcl.Menus, Vcl.StdCtrls, Vcl.FileCtrl, FlCtrlEx, Vcl.ImgList, cxButtons,
  Vcl.ExtCtrls, Winapi.ShellAPI, cxGroupBox;

type
  TfmeAnexos = class(TFrame)
    pnlControle: TPanel;
    btnAnexar: TcxButton;
    OpenDialog1: TOpenDialog;
    btnAbrir: TcxButton;
    btnExcluir: TcxButton;
    PopupMenu1: TPopupMenu;
    Abrir1: TMenuItem;
    N1: TMenuItem;
    Excluir1: TMenuItem;
    Anexar1: TMenuItem;
    N2: TMenuItem;
    ImageList1: TImageList;
    Exportar1: TMenuItem;
    N3: TMenuItem;
    btnExportar: TcxButton;
    SaveDialog1: TSaveDialog;
    cxGroupBox1: TcxGroupBox;
    Panel1: TPanel;
    flbAnexos: TFileListBoxEx;
    procedure btnAnexarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAbrirClick(Sender: TObject);
    procedure Anexar1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Excluir1Click(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure Exportar1Click(Sender: TObject);
    procedure flbAnexosDblClick(Sender: TObject);
  private
    { Private declarations }
    FDirAnexos, FPathAnexo: string;
    FIDAnexo: Integer;

    function GetFileSelected: string;
    function GetCountItens: Integer;
    procedure SetIndex(const vpIdx: Integer);
    procedure SetPath(const vpPath: string);
    procedure Update;
    procedure Visible(const vpHblt: Boolean);
    function Validar: Boolean;

    procedure Anexar;
    procedure Abrir;
    procedure Excluir;
    procedure Exportar;
    procedure Auditoria(const vpTipo: string; const vpInfo: string; const vpFile: string);
  public
    { Public declarations }
    procedure LoadAnexos(const vpNumero: Integer; const vpServico: string);
    constructor Create(AOwner: TComponent); override;
  end;

implementation

uses
  Controles;

{$R *.dfm}

{ TfmeAnexos }

procedure TfmeAnexos.SetIndex(const vpIdx: Integer);
begin
  flbAnexos.ItemIndex := vpIdx;
end;

procedure TfmeAnexos.SetPath(const vpPath: string);
begin
  flbAnexos.Directory := vpPath;
end;

function TfmeAnexos.GetCountItens: Integer;
begin
  Result := flbAnexos.Items.Count;
end;

function TfmeAnexos.GetFileSelected: string;
begin
  Result := flbAnexos.FileName;
end;

procedure TfmeAnexos.Update;
begin
  flbAnexos.Update;
end;

procedure TfmeAnexos.Abrir;
begin
  try
    if Validar then
      ShellExecute(Application.Handle, 'Open', PWideChar(GetFileSelected), '', '', SW_SHOWNORMAL);
  except
    on E: exception do
    begin
      Application.MessageBox(Pchar('Error - '+ E.Message), 'Erro', MB_ICONERROR);
    end;
  end;
end;

procedure TfmeAnexos.Abrir1Click(Sender: TObject);
begin
  Abrir;
end;

procedure TfmeAnexos.Anexar;
var
  viFileOrigem, viFileDestino: string;
begin
  if OpenDialog1.Execute then
  begin
    if not DirectoryExists(FPathAnexo) then
    begin
      ForceDirectories(FPathAnexo);
      SetPath(FPathAnexo);
      Visible(True);
    end;

    viFileOrigem := OpenDialog1.FileName;
    viFileDestino := IncludeTrailingPathDelimiter(FPathAnexo) + ExtractFileName(viFileOrigem);

    if FileExists(viFileDestino) then
      if Application.MessageBox('Anexo já existe, deseja substituir o mesmo?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDNO then
        Exit
      else
        Auditoria('A', 'Arquivo substituido por um com mesmo nome', viFileDestino);

    if not CopyFile(PWideChar(viFileOrigem), PWideChar(viFileDestino), False) then
      Application.MessageBox('Não fui possivel incluir o anexo!', 'Erro', MB_OK + MB_ICONERROR)
    else
      Update;
  end;
end;

procedure TfmeAnexos.Anexar1Click(Sender: TObject);
begin
  Anexar
end;

procedure TfmeAnexos.Auditoria(const vpTipo: string; const vpInfo: string; const vpFile: string);
begin
  dtmControles.Auditoria('ANEXOS', vpInfo, vpTipo, ExtractFileName(vpFile), FIDAnexo.ToString, 'Arquivo em: ' + vpFile);
end;

procedure TfmeAnexos.btnAbrirClick(Sender: TObject);
begin
  Abrir;
end;

procedure TfmeAnexos.btnAnexarClick(Sender: TObject);
begin
  Anexar;
end;

procedure TfmeAnexos.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TfmeAnexos.btnExportarClick(Sender: TObject);
begin
  Exportar;
end;

constructor TfmeAnexos.Create(AOwner: TComponent);
begin
  inherited;
  FDirAnexos := IncludeTrailingPathDelimiter(dtmControles.BuscarParametroOutroSistema('LOCAL_ANEXOS', 'GERAL', 'PRINCIPAL', '5'));
end;

procedure TfmeAnexos.Excluir;
var
  viFile: string;
begin
  if Validar then
  begin
    if Application.MessageBox('Confirma excluir o anexo?', 'Confirmação', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      viFile := GetFileSelected;

      if not DeleteFile(viFile) then
        Application.MessageBox('Arquivo não pode ser excluído!', 'Atenção', MB_OK + MB_ICONWARNING)
      else
      begin
        Auditoria('E', 'Arquivo Anexo Excluido', viFile);
        Update;
      end;
    end;
  end;
end;

procedure TfmeAnexos.Excluir1Click(Sender: TObject);
begin
  Excluir;
end;

procedure TfmeAnexos.Exportar;
var
  viFileOrigem, viFileDestino: string;
begin
  if Validar then
  begin
    viFileOrigem := GetFileSelected;
    SaveDialog1.FileName := ExtractFileName(viFileOrigem);

    if SaveDialog1.Execute then
    begin
      viFileDestino := SaveDialog1.FileName;
      if not CopyFile(PWideChar(viFileOrigem), PWideChar(viFileDestino), False) then
        Application.MessageBox('Não fui possivel exportar o anexo!', 'Erro', MB_OK + MB_ICONERROR);
    end;
  end;
end;

procedure TfmeAnexos.Exportar1Click(Sender: TObject);
begin
  Exportar;
end;

procedure TfmeAnexos.flbAnexosDblClick(Sender: TObject);
begin
  Abrir;
end;

procedure TfmeAnexos.LoadAnexos(const vpNumero: Integer; const vpServico: string);
begin
  FIDAnexo := vpNumero;
  FPathAnexo := IncludeTrailingPathDelimiter(FDirAnexos + FormatFloat('000', vgId)) + vpServico;
  FPathAnexo := IncludeTrailingPathDelimiter(FPathAnexo) + FormatFloat('00000000', vpNumero);

  if not DirectoryExists(FPathAnexo) then
  begin
    Visible(False);
    SetPath(FDirAnexos);
    Exit;
  end;

  SetPath(FPathAnexo);
  Visible(True);
  SetIndex(0);
end;

function TfmeAnexos.Validar: Boolean;
begin
  Result := True;

  if (not flbAnexos.Visible) or (GetCountItens = 0) then
  begin
    Application.MessageBox('Não exite arquivo anexo!', 'Atenção', MB_OK + MB_ICONWARNING);
    Result := False;
  end
  else if not FileExists(GetFileSelected) then
  begin
    Application.MessageBox('Arquivo não localizado no diretório!', 'Atenção', MB_OK + MB_ICONWARNING);
    Result := False;
  end;
end;

procedure TfmeAnexos.Visible(const vpHblt: Boolean);
begin
  flbAnexos.Visible := vpHblt;
end;

end.

