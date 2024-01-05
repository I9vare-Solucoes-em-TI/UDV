unit InserirImagemTexto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, cxImageComboBox, cxDropDownEdit,
  cxCalendar, cxDBEdit, cxCurrencyEdit, cxMaskEdit, cxTextEdit, cxGroupBox,
  dxGDIPlusClasses, Vcl.ExtCtrls, Vcl.Menus, Vcl.StdCtrls, cxButtons,
  Vcl.ExtDlgs, WPRTEDefs, WPCTRRich, cxCheckBox, dxSkinsCore,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, Vcl.ComCtrls, ieview,
  imageenview, cxLabel;

type
  TfrmInserirImagemTexto = class(TForm)
    Panel1: TPanel;
    imgPagar: TImage;
    pnlApresentante: TPanel;
    OpenPictureDialog1: TOpenPictureDialog;
    chxSaveConfig: TcxCheckBox;
    Panel3: TPanel;
    cxGroupBox6: TcxGroupBox;
    icbPosicaoTexto: TcxImageComboBox;
    cxGroupBox2: TcxGroupBox;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    cxGroupBox5: TcxGroupBox;
    cbxTamanhoImagem: TcxComboBox;
    btnArquivo: TcxButton;
    cxLabel1: TcxLabel;
    edtFileName: TcxTextEdit;
    btnAtualizar: TcxButton;
    Panel2: TPanel;
    ImageEnView1: TImageEnView;
    StatusBar1: TStatusBar;
    btnCrop: TcxButton;
    procedure FormCreate(Sender: TObject);
    procedure chxSaveConfigClick(Sender: TObject);
    procedure btnArquivoClick(Sender: TObject);
    procedure btnAtualizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCropClick(Sender: TObject);
  private
    FFileImagem: string;
    FFileSize: Integer;

    function Imagem(vpArquivo: string): string;
    procedure ExibirImagem;
    procedure GetConfigSalvo;
    { Private declarations }
  public
    { Public declarations }

    class procedure InserirImagemTexto(
      const vpWptTexto: TWPRichText);
  end;

//var
//  frmInserirImagemTexto: TfrmInserirImagemTexto;

implementation

uses
  Controles,
  Rotinas,
  FormatImageWPtools,
  MensagemUtils,
  System.IOUtils,
  Atualizacao,
  CropImagemTexto;

{$R *.dfm}

procedure DadosRegistro(vpChave, vpValor : String);
begin
  GravaRegistro(HKEY_CURRENT_USER, 'Software\Tri7 Software\'+vgId.ToString+'\'+vgLogin, vpChave, vpValor);
end;

procedure TfrmInserirImagemTexto.btnArquivoClick(Sender: TObject);
begin
  if not OpenPictureDialog1.Execute then
    Abort;

  if FileExists(FFileImagem) then
    DeleteFile(FFileImagem);

  edtFileName.Text := OpenPictureDialog1.FileName;

  FFileImagem := Imagem(edtFileName.Text);

  ExibirImagem;

  btnCrop.Enabled := True;
end;

procedure TfrmInserirImagemTexto.btnAtualizarClick(Sender: TObject);
begin
  if FileExists(FFileImagem) then
    DeleteFile(FFileImagem);

  if not Trim(edtFileName.Text).IsEmpty then
  begin
    FFileImagem := Imagem(edtFileName.Text);
    ExibirImagem;
  end;
end;

procedure TfrmInserirImagemTexto.btnCancelarClick(Sender: TObject);
begin
  if FileExists(FFileImagem) then
    DeleteFile(FFileImagem);
  FFileImagem := EmptyStr;
end;

procedure TfrmInserirImagemTexto.btnConfirmarClick(Sender: TObject);
begin
  if (FFileSize > 700) then
  begin
    Application.MessageBox('Não é permitido inserir imagens maiores que 700 KB no texto, redimensione a mesma por favor!', 'Atenção', MB_OK + MB_ICONWARNING);
    Exit;
  end
  else
  if (FFileSize > 200) then
   if Application.MessageBox(PWideChar('Para melhor performance recomendamos inserir no texto imagens menores que 200 KB!' + #10#13 +
                                       'Deseja continuar?'),
                                       'Confirmação',
                                       MB_YESNO + MB_ICONQUESTION) = IDNO then
    Exit;

  ModalResult := mrOk;
end;

procedure TfrmInserirImagemTexto.btnCropClick(Sender: TObject);
begin
  if TfrmCropImagemTexto.CropImagemTexto(FFileImagem) then
    ExibirImagem;
end;

procedure TfrmInserirImagemTexto.chxSaveConfigClick(Sender: TObject);
begin
  if chxSaveConfig.Tag = 0 then
    if chxSaveConfig.Checked then
    begin
      DadosRegistro('Posicao', IntToStr(icbPosicaoTexto.EditValue));
      DadosRegistro('Tamanho', cbxTamanhoImagem.ItemIndex.ToString);
    end
    else
    begin
      DadosRegistro('Posicao', '1');
      DadosRegistro('Tamanho', '0');
    end;
end;

procedure TfrmInserirImagemTexto.ExibirImagem;
begin
  if not FileExists(FFileImagem) then
    Abort;

  FFileSize := Trunc(TamanhoArquivo(FFileImagem)/1024);

  ImageEnView1.IO.LoadFromFile( FFileImagem );
  ImageEnView1.Zoom := 100;

  StatusBar1.Panels[1].Text := IntToStr(ImageEnView1.IEBitmap.Width);
  StatusBar1.Panels[3].Text := IntToStr(ImageEnView1.IEBitmap.Height);
  StatusBar1.Panels[5].Text := 'Tamanho: ' + IntToStr(FFileSize) + ' KB';
end;

procedure TfrmInserirImagemTexto.FormCreate(Sender: TObject);
begin
  FFileImagem := string.Empty;
  FFileSize   := 0;

  GetConfigSalvo;
end;

procedure TfrmInserirImagemTexto.GetConfigSalvo;
var
  viPosicao,
  viTamanho: Integer;
  viRetorno: string;
begin
  viPosicao := 1;
  viTamanho := 0;

  try
    //Posição
    viRetorno := LerRegistro(HKEY_CURRENT_USER, 'Software\Tri7 Software\'+vgId.ToString+'\'+vgLogin, 'Posicao');
    if not viRetorno.IsEmpty then
      viPosicao := viRetorno.ToInteger;

    //Tamanho
    viRetorno := LerRegistro(HKEY_CURRENT_USER, 'Software\Tri7 Software\'+vgId.ToString+'\'+vgLogin, 'Tamanho');
    if not viRetorno.IsEmpty then
      viTamanho := viRetorno.ToInteger;

  finally
    icbPosicaoTexto.EditValue  := viPosicao;
    cbxTamanhoImagem.ItemIndex := viTamanho;
    chxSaveConfig.Tag := 1;
    chxSaveConfig.Checked := (viPosicao <> 1) or (viTamanho <> 0);
    chxSaveConfig.Tag := 0;
  end;
end;

function TfrmInserirImagemTexto.Imagem(vpArquivo: string): string;
{$REGION 'Variáveis'}
var
  viAltura: Integer;
{$ENDREGION}
begin
  Result      := EmptyStr;

  if not FileExists(vpArquivo) then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      string.Format(
        'Arquivo %s não existe.',
        [vpArquivo]));

    Abort;
  end;

  case cbxTamanhoImagem.ItemIndex of
    0 : viAltura := 10;
    1 : viAltura := 20;
    2 : viAltura := 30;
    3 : viAltura := 40;
    4 : viAltura := 50;
    5 : viAltura := 60;
    6 : viAltura := 70;
    7 : viAltura := 80;
    else
      viAltura  := 0;
  end;

  Result := ExtractFilePath(
    vpArquivo) + TPath.GetRandomFileName + '.jpeg';

  try
      if frmAtualizacao <> nil then
        FreeAndNil(frmAtualizacao);

      frmAtualizacao := TfrmAtualizacao.Create(nil);
      frmAtualizacao.Visible           := True;
      frmAtualizacao.Show;
      frmAtualizacao.lblTexto.Caption  := 'Processando Imagem!';
      frmAtualizacao.Refresh;
    try
      FormatImageWPtools.ImageConverteTo(
        vpArquivo,
        Result,
        viAltura);
    except
      Result := '';
    end;
  finally
    FreeAndNil(frmAtualizacao);
  end;
end;

class procedure TfrmInserirImagemTexto.InserirImagemTexto(
  const vpWptTexto: TWPRichText);
var
  vifrmInserirImagemTexto: TfrmInserirImagemTexto;
  viFileImagem: string;
  viObjectModes : TWPTextObjModes;
begin
  viFileImagem := string.Empty;

  Application.CreateForm(
    Self,
    vifrmInserirImagemTexto);

  try
    if vifrmInserirImagemTexto.ShowModal = mrOk  then
    begin
      viFileImagem := vifrmInserirImagemTexto.FFileImagem;

      if not viFileImagem.IsEmpty then
      begin
        case vifrmInserirImagemTexto.icbPosicaoTexto.EditValue of
          1 : viObjectModes := [wpobjLockedPos];
          2 : viObjectModes := [wpobjRelativeToParagraph];
          3 : viObjectModes := [wpobjRelativeToPage];
        end;

        try
          vpWptTexto.InsertGraphic(
               viFileImagem,
               false,
               viObjectModes);
        finally
          DeleteFile(viFileImagem);
        end;
      end;
    end;
  finally
    vifrmInserirImagemTexto.Free;
  end;

end;

end.
