unit PesquisaImagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, Menus,
  ComCtrls, ShlObj, cxShellCommon, cxListView, cxShellListView, StdCtrls,
  cxButtons, cxMaskEdit, cxDropDownEdit,
  cxTextEdit, cxLabel, ExtCtrls,
  FrameImagem, cxPC, IniFiles, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxBarBuiltInMenu,
  {$WARN UNIT_PLATFORM OFF}
  Vcl.FileCtrl, dxSkinsCore, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinscxPCPainter, cxRadioGroup
  {$WARN UNIT_PLATFORM ON};

type
  TfrmPesquisaImagem = class(TForm)
    pnlImagemGeral: TPanel;
    Panel1: TPanel;
    PanelBotaoFechar: TPanel;
    cxBtnFechar: TcxButton;
    pgcPesquisa: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel4: TcxLabel;
    edtPesqLivro: TcxTextEdit;
    edtPesqFolha: TcxTextEdit;
    cbxNaturezaPesquisa: TcxComboBox;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    cxTabSheet2: TcxTabSheet;
    cxLabel1: TcxLabel;
    cbxNaturezaGeral: TcxComboBox;
    lblInfoPesquisaDireta: TcxLabel;
    lblInfoPesquisaPersonalizada: TcxLabel;
    pnLeft: TPanel;
    pnPrincipal: TPanel;
    Panel2: TPanel;
    cxShellListViewPastas: TcxShellListView;
    cxLabelsomenteVisualizacao: TcxLabel;
    FileListBox1: TFileListBox;
    fmeImagem1: TfmeImagem;
    btnPrior: TcxButton;
    btnNext: TcxButton;
    procedure cxBtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxShellListViewPastasClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure pgcPesquisaChange(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtPesqFolhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbxNaturezaPesquisaPropertiesEditValueChanged(Sender: TObject);
    procedure cbxNaturezaGeralPropertiesChange(Sender: TObject);
    procedure cxShellListViewPastasChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure FormActivate(Sender: TObject);
    procedure FileListBox1Change(Sender: TObject);
    procedure btnPriorClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);

  private
    vlConfigFrenteVerso, vlConfigInicial, vlConfigPasta,
    vlDirSelecionado, vlPastaAtual, vlArquivoAtual : String;
    vlLocalOK, vlCriandoForm, vlFrente, vlAtualizandoDir1  : Boolean;
    vlLivro, vlFolha : Integer;
    vlLetra,
    vlPasta : String;
    procedure CarregarPastas;
    procedure GetDirList(Directory: String; var Result: TStrings;
                     SubPastas: Boolean);
    function LerImagem(vpPasta, vpArquivo : String): Boolean;
    procedure CarregarINI(vpPasta : string = '');
    procedure PesquisarLivroFolhaImagem(vpAvancar : Boolean = False);

  public
    { Public declarations }
  end;

var
  frmPesquisaImagem: TfrmPesquisaImagem;

implementation

uses Controles, Rotinas;

{$R *.dfm}
{$WARN SYMBOL_DEPRECATED OFF}

procedure TfrmPesquisaImagem.btnLimparClick(Sender: TObject);
begin
  edtPesqLivro.Clear;
  edtPesqFolha.Clear;
  edtPesqLivro.SetFocus;
end;



procedure TfrmPesquisaImagem.btnPesquisarClick(Sender: TObject);
begin
  vlFrente := True;
  PesquisarLivroFolhaImagem;
end;

procedure TfrmPesquisaImagem.CarregarINI(vpPasta : string = '');
var
  Ini  : TIniFile;
  viArquivo: string;
begin
  viArquivo := IncludeTrailingPathDelimiter(
    IncludeTrailingPathDelimiter(
      IncludeTrailingPathDelimiter(vlPasta)+
        cbxNaturezaPesquisa.text)+vpPasta)+'Config.ini';

  if FileExists(viArquivo) then
    Ini := TIniFile.Create(viArquivo)
  else
    Ini := TIniFile.Create(IncludeTrailingPathDelimiter(IncludeTrailingPathDelimiter(vlPasta) + cbxNaturezaPesquisa.text)+'Config.ini');

  vlConfigInicial     := Ini.ReadString('GERAL', 'Inicial', '');
  vlConfigFrenteVerso := Ini.ReadString('GERAL', 'FrenteVerso', '');

  if vpPasta = '' then
    vlConfigPasta := Ini.ReadString('GERAL', 'Pasta', '');

  if vlConfigInicial = '' then
    vlConfigInicial := '1';

  if vlConfigFrenteVerso = '' then
    vlConfigFrenteVerso := 'N';

  Ini.Free; 
end;

procedure TfrmPesquisaImagem.CarregarPastas;
var
  viLista : TStrings;
  viLocalImagem: string;
begin
  vlPasta := EmptyStr;

  viLocalImagem := Trim(dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'LOCAL_IMAGEM', 'S'));

  vlLocalOK := False;

  if not DirectoryExists(viLocalImagem) then
  begin
    Application.MessageBox('Local de Imagem não Encontrado!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    exit;
  end;

  vlPasta := IncludeTrailingPathDelimiter(IncludeTrailingPathDelimiter(viLocalImagem) + 'LivrosDigitalizados') + vgSistemaNome;
  // Verifica Se Existe a Pasta de Livros Digitalizados
  if not DirectoryExists(vlPasta) then
    ForceDirectories(vlPasta);

  viLista := TStringList.Create;

  try
    vlLocalOK := True;
    GetDirList(vlPasta,viLista,false); // o true é se vai mostrar os subdiretórios

    if viLista.Count > 0 then
    begin
      cbxNaturezaGeral.Properties.Items.Clear;
      cbxNaturezaGeral.Properties.Items := viLista;
      cbxNaturezaPesquisa.Properties.Items.Clear;
      cbxNaturezaPesquisa.Properties.Items := viLista;
    end;
  finally
    FreeAndNil(viLista);
  end;

  if cbxNaturezaGeral.Properties.Items.Count > 0 then
  begin
    cbxNaturezaGeral.ItemIndex    := 0;
    cbxNaturezaPesquisa.ItemIndex := 0;
  end;

end;

procedure TfrmPesquisaImagem.cbxNaturezaGeralPropertiesChange(Sender: TObject);
begin
  LockWindowUpdate(Handle);
  if DirectoryExists(IncludeTrailingPathDelimiter(vlPasta) + cbxNaturezaGeral.Text) then
  begin
    cxShellListViewPastas.Root.CustomPath := IncludeTrailingPathDelimiter(vlPasta) + cbxNaturezaGeral.Text;
    cxShellListViewPastas.InnerListView.ItemIndex := 0;
  end;
  LockWindowUpdate(0);
end;

procedure TfrmPesquisaImagem.cbxNaturezaPesquisaPropertiesEditValueChanged(
  Sender: TObject);
begin
  CarregarINI;
  LockWindowUpdate(Handle);
  if DirectoryExists(IncludeTrailingPathDelimiter(vlPasta) + cbxNaturezaPesquisa.Text) then
  begin
    cxShellListViewPastas.Root.CustomPath := IncludeTrailingPathDelimiter(vlPasta) + cbxNaturezaPesquisa.Text;
    cxShellListViewPastas.InnerListView.ItemIndex := 0;
  end;
  LockWindowUpdate(0);
end;

procedure TfrmPesquisaImagem.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPesquisaImagem.cxShellListViewPastasChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
var
  vlPastaSelecionada : String;
begin
  if cxShellListViewPastas.Root.CustomPath = '' then
    exit;

  vlPastaSelecionada := IncludeTrailingPathDelimiter(cxShellListViewPastas.Path) + Item.Caption;
  if (pgcPesquisa.ActivePageIndex = 0) or (vlPastaAtual = vlPastaSelecionada) then
    exit;

  vlAtualizandoDir1 := True;
  LockWindowUpdate(Handle);
  vlDirSelecionado := Item.Caption;
  FileListBox1.Directory := IncludeTrailingPathDelimiter(cxShellListViewPastas.Path) + Item.Caption;
  vlAtualizandoDir1 := False;
  FileListBox1.ItemIndex := 0;
  vlPastaAtual := IncludeTrailingPathDelimiter(cxShellListViewPastas.Path) + Item.Caption;

  if pgcPesquisa.ActivePageIndex = 1 then
    FileListBox1Change(self);

  LockWindowUpdate(0);
end;

procedure TfrmPesquisaImagem.cxShellListViewPastasClick(Sender: TObject);
begin
  abort;
end;

procedure TfrmPesquisaImagem.edtPesqFolhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    btnPesquisarClick(self);
end;

procedure TfrmPesquisaImagem.FileListBox1Change(Sender: TObject);
var
  viCaption, vlArquivoSelecionado : String;
begin
  if pgcPesquisa.ActivePageIndex = 0 then
    Exit;

  vlArquivoSelecionado := ExtractFileName(FileListBox1.FileName);

  if vlArquivoSelecionado = '' then
  begin
    fmeImagem1.ClearImage;
    Exit;
  end;

  if (pgcPesquisa.ActivePageIndex = 0) or vlAtualizandoDir1 or (vlArquivoAtual = FileListBox1.FileName) then
    Exit;

  LockWindowUpdate(Handle);

  viCaption := Copy(vlArquivoSelecionado, 1, pos('.',vlArquivoSelecionado)-1);
  if LerImagem(FileListBox1.Directory, FileListBox1.FileName) then
       viCaption := vlDirSelecionado + ', Imagem '+viCaption
  else viCaption := '';

  vlArquivoAtual := FileListBox1.FileName;
  lblInfoPesquisaPersonalizada.Caption := viCaption;
  LockWindowUpdate(0);

end;

procedure TfrmPesquisaImagem.btnPriorClick(Sender: TObject);
begin
  if (vlFolha <= 1) and vlFrente then
    exit;

  if vlFrente and (vlConfigFrenteVerso = 'S') then
    vlFrente := False
  else
  begin
    vlFrente := True;
    Dec(vlFolha);
  end;

  edtPesqLivro.Text := IntToStr(vlLivro)+vlLetra;
  edtPesqFolha.Text := IntToStr(vlFolha);
  PesquisarLivroFolhaImagem(True);
end;

procedure TfrmPesquisaImagem.btnNextClick(Sender: TObject);
begin
  if vlFolha = 0 then
    exit;

  if vlFrente and (vlConfigFrenteVerso = 'S') then
    vlFrente := False
  else
  begin
   vlFrente := True;
   inc(vlFolha);
  end;

  edtPesqLivro.Text := IntToStr(vlLivro)+vlLetra;
  edtPesqFolha.Text := IntToStr(vlFolha);
  PesquisarLivroFolhaImagem(True);
end;

procedure TfrmPesquisaImagem.FormActivate(Sender: TObject);
begin
  pgcPesquisaChange(self);
end;

procedure TfrmPesquisaImagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmPesquisaImagem := nil;
end;

procedure TfrmPesquisaImagem.FormCreate(Sender: TObject);
begin
  vlCriandoForm := True;
  pgcPesquisa.ActivePageIndex := 0;

  CarregarPastas;
  vlCriandoForm := False;
end;

procedure TfrmPesquisaImagem.GetDirList(Directory: String; var Result: TStrings;
  SubPastas: Boolean);
var
  Sr : TSearchRec;

  procedure Recursive(Dir : String); { Sub Procedure, Recursiva }
  var
     SrAux : TSearchRec;
     viDiretorio: string;
  begin
    viDiretorio := IncludeTrailingPathDelimiter(
      IncludeTrailingPathDelimiter(Directory)+ Dir
      );

    if SrAux.Name = EmptyStr then
       FindFirst(viDiretorio + '*.*', faDirectory, SrAux);
    while FindNext(SrAux) = 0 do
       if SrAux.Name <> '..' then
          if DirectoryExists(viDiretorio + SrAux.Name) then
          begin
             Result.Add(viDiretorio + SrAux.Name);
             Recursive(IncludeTrailingPathDelimiter(Dir) + SrAux.Name);
          end;
  end;
begin
  FindFirst(IncludeTrailingPathDelimiter(Directory) + '*.*', faDirectory, Sr);
  while FindNext(Sr) = 0 do
    if Sr.Name <> '..' then
    if DirectoryExists(IncludeTrailingPathDelimiter(Directory) + Sr.Name) then
    begin
      Result.Add(Sr.Name);

      if SubPastas then
        Recursive(Sr.Name);
    end;
end;

function TfrmPesquisaImagem.LerImagem(vpPasta, vpArquivo : String): Boolean;
begin
  Result := fmeImagem1.LoadFromFile(IncludeTrailingPathDelimiter(vpPasta) + ExtractFileName(vpArquivo), 0, False);
end;

procedure TfrmPesquisaImagem.PesquisarLivroFolhaImagem(vpAvancar : Boolean = False);
var
  viLivro, viLetraLivro, viFolhaStr, viPasta, viCaptionLado : String;
  viFolhaInt : Integer;
begin
  VerificarPreenchimentoEDT_TX(edtPesqLivro.Text, 'Livro', edtPesqLivro);
  VerificarPreenchimentoEDT_TX(edtPesqFolha.Text, 'Folha', edtPesqFolha);

  viLivro       := FormatFloat('000', StrToInt(RetornaNumericoValor(edtPesqLivro.Text)));
  viLetraLivro  := '';
  viLetraLivro  := RetornaAlfa(edtPesqLivro.Text);
  if viLetraLivro <> ''  then
    viLivro := viLivro + '-'+viLetraLivro;
  viFolhaInt    := StrToInt(edtPesqFolha.Text);

  viPasta := IncludeTrailingPathDelimiter(IncludeTrailingPathDelimiter(vlPasta)+ cbxNaturezaPesquisa.text)+viLivro;
  CarregarINI(viLivro);

  viCaptionLado := '';
  if vlConfigFrenteVerso = 'S' then
  begin
    viFolhaInt := (viFolhaInt*2)-1;
    if not vlFrente then
    begin
      viFolhaInt := viFolhaInt + 1;
      viCaptionLado := 'Verso';
    end
    else viCaptionLado := 'Frente';
  end;

  viFolhaInt := viFolhaInt + (StrToInt(vlConfigInicial)-1);
  viFolhaStr := FormatFloat('000', viFolhaInt);

  if not LerImagem(viPasta, IncludeTrailingPathDelimiter(viPasta)+viFolhaStr+'.jpg') then
  begin
    if vpAvancar then
      fmeImagem1.actPagPriorExecute(nil)
    else
    begin
      lblInfoPesquisaDireta.Caption := '';
      Application.MessageBox('Imagem não Encontrada!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    end;
    exit;
  end
  else
  begin
    lblInfoPesquisaDireta.Caption := viLivro + ', Folha '+edtPesqFolha.Text;
    if viCaptionLado <> '' then
      lblInfoPesquisaDireta.Caption := lblInfoPesquisaDireta.Caption + ' '+ viCaptionLado;
  end;

  vlLivro  := StrToInt(RetornaNumericoValor(edtPesqLivro.Text));
  vlFolha  := StrToInt(edtPesqFolha.Text);
  vlLetra  := viLetraLivro;
end;

procedure TfrmPesquisaImagem.pgcPesquisaChange(Sender: TObject);
begin
  LockWindowUpdate(Handle);
  FileListBox1.Visible := False;
  cxShellListViewPastas.Visible   := False;

  vlLivro := 0;
  fmeImagem1.ClearImage;

  lblInfoPesquisaPersonalizada.Caption    := '';
  lblInfoPesquisaDireta.Caption           := '';
  FileListBox1.Directory := '';
  cxShellListViewPastas.Root.CustomPath   := '';
  vlPastaAtual    := '';
  vlArquivoAtual  := '';
  vlFrente := True;
  cxLabelsomenteVisualizacao.Visible := pgcPesquisa.ActivePageIndex = 0;

  cxShellListViewPastas.Visible := True;
  if pgcPesquisa.ActivePageIndex = 0 then
  begin
    if vlCriandoForm then
    begin
      LockWindowUpdate(0);
      exit;
    end;

    if cbxNaturezaGeral.ItemIndex <> -1 then
      cbxNaturezaPesquisa.EditValue := cbxNaturezaGeral.EditValue;

    pnLeft.Width := 121;
    cbxNaturezaPesquisaPropertiesEditValueChanged(Self);
    edtPesqLivro.SetFocus;
  end
  else
  begin
    if cbxNaturezaPesquisa.ItemIndex <> -1 then
      cbxNaturezaGeral.EditValue := cbxNaturezaPesquisa.EditValue;

    FileListBox1.Visible := True;
    pnLeft.Width := 250;
    cbxNaturezaGeralPropertiesChange(self);
    cxShellListViewPastas.SetFocus;
  end;
  LockWindowUpdate(0);
end;

end.


