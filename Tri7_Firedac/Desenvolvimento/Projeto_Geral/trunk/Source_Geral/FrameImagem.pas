unit FrameImagem;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBClient, SimpleDS, ImgList,
  ExtCtrls, AxCtrls, ComObj,ActiveX, OleCtrls, cxImageComboBox, cxMaskEdit, StdCtrls, cxButtons,
  WPCTRMemo, WPCTRRich, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxDropDownEdit, ComCtrls, ToolWin, cxTextEdit,
  cxControls, cxEdit, cxTrackBar, Buttons, cxContainer, Menus, cxSplitter,
  FrameEditorSimples, cxSpinEdit,
  TWNPRO4Lib_TLB, PrintPRO3_TLB, NOTEXP70Lib_TLB,
  ImagXpr7_TLB, ExtDlgs, cxProgressBar,
  AdvGlowButton, cxPC, cxCheckBox, FrameAssinaturaDigital, DelphiTwain,
  cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu,
  dxSkinsCore, dxSkinscxPCPainter, DbxDevartInterBase, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinCoffee, dxSkiniMaginary, dxSkinCaramel,
  dxSkinGlassOceans, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TImagem = Record
    Valor1, Valor2, Valor3, Valor4, Valor5, Valor6, Valor7, Valor8, Valor9, Valor10, Valor11, Valor12, Valor13,
    Pagina, PaginaFim, Folha, LadoInicial, TipoImpressao, SeloAgrupador, Livro2Numero, Pagina2Inicio, Pagina2Fim, LivroLetra : string;
  end;

  TCabecalho = Record
    Cabecalho1, Cabecalho2, Rodape1, Rodape2 : string;
  end;

type
  TfmeImagem = class(TFrame)
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btnImagem: TToolButton;
    btnImprimir: TToolButton;
    ToolButton3: TToolButton;
    ToolButton1: TToolButton;
    btnAnterior: TToolButton;
    btnProximo: TToolButton;
    btnUltimo: TToolButton;
    btnPrimeiro: TToolButton;
    pnlDigitalizar: TPanel;
    btnDigitalizar: TcxButton;
    btnRedigitalizar: TcxButton;
    pnlDados: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnCancelar: TcxButton;
    lcxTipo: TcxLookupComboBox;
    edtNumero: TcxMaskEdit;
    edtLetra: TcxTextEdit;
    icxGrupo: TcxImageComboBox;
    btnIndexar: TcxButton;
    sqlCarimbo: TI9Query;
    sqlCarimboDESCRICAO: TStringField;
    sqlCarimboTEXTO: TBlobField;
    sqlIndexacaoTipo: TI9Query;
    sqlIndexacaoTipoINDEXACAO_TIPO_ID: TBCDField;
    sqlIndexacaoTipoDESCRICAO: TStringField;
    sqlIndexacaoTipoSIGLA: TStringField;
    sqlIndexacaoTipoGRUPO: TStringField;
    sqlIndexacaoTipoSITUACAO: TStringField;
    sqlIndexacaoTipoSISTEMA_ID: TBCDField;
    sqlIndexacaoTipoBD: TStringField;
    dsIndexacaoTipo: TDataSource;
    dsCarimbo: TDataSource;
    TwainPRO: TTwainPRO;
    Notate1: TNotateXpress;
    ImageList1: TImageList;
    IXDibLoader: TImagXpress;
    stxFichaLado: TStaticText;
    Shape1: TShape;
    PopupMenu1: TPopupMenu;
    Panel3: TPanel;
    spbPreviewWhole: TSpeedButton;
    spbPreview100Percent: TSpeedButton;
    spbPreviewWidth: TSpeedButton;
    btnCarimbo: TSpeedButton;
    btnBrand: TSpeedButton;
    cbxPaginas: TcxComboBox;
    tbrZoom: TcxTrackBar;
    edtZoom: TcxTextEdit;
    pnlCarimbo: TPanel;
    lcbCarimbo: TcxLookupComboBox;
    Xpress1: TImagXpress;
    pnlTextoCarimbo: TPanel;
    cxSplitter1: TcxSplitter;
    fmeEditorSimples1: TfmeEditorSimples;
    imgControle: TImage;
    btnPdf: TToolButton;
    pnlImpressao: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label6: TLabel;
    cbxTipoImpressao: TcxImageComboBox;
    Shape3: TShape;
    InserirPaginaemBranco1: TMenuItem;
    InserirMargemnaImagem1: TMenuItem;
    Margem1cm1: TMenuItem;
    Margem2cm1: TMenuItem;
    Margem3cm1: TMenuItem;
    Margem4cm1: TMenuItem;
    Margem5cm1: TMenuItem;
    btnLembrete: TSpeedButton;
    pnlLembrete: TPanel;
    Shape2: TShape;
    Label7: TLabel;
    cxSplitter2: TcxSplitter;
    cbxScanImageFloating: TcxCheckBox;
    Image1: TImage;
    Image2: TImage;
    OpenPictureDialog: TOpenPictureDialog;
    pnlCertificados: TPanel;
    fmeAssinaturaDigital1: TfmeAssinaturaDigital;
    pagControle: TcxPageControl;
    tbsGeral: TcxTabSheet;
    tbsImagem: TcxTabSheet;
    tbsArquivo: TcxTabSheet;
    btnscannerimg: TAdvGlowButton;
    btnImprimirImg: TAdvGlowButton;
    btnPDFImagem: TAdvGlowButton;
    btnSalvarImagem: TAdvGlowButton;
    btnGirarImagem: TAdvGlowButton;
    btnTrocarImagem: TAdvGlowButton;
    btnBordaImagem: TAdvGlowButton;
    btnMargemImagem: TAdvGlowButton;
    btnImagemBranco: TAdvGlowButton;
    btnJuntarImagem: TAdvGlowButton;
    btnExcluirPagImagem: TAdvGlowButton;
    btnImportar: TAdvGlowButton;
    chxAssinar: TcxCheckBox;
    ProgressBar: TcxProgressBar;
    btnRecortarImagem: TAdvGlowButton;
    DelphiTwain1: TDelphiTwain;
    Panel6: TPanel;
    Shape5: TShape;
    cbxTipoPapel: TcxImageComboBox;
    pnlIntervaloImp: TPanel;
    Shape4: TShape;
    Label8: TLabel;
    Label9: TLabel;
    spnPagInicial: TcxSpinEdit;
    spnPagFinal: TcxSpinEdit;
    PrintPRO1: TPrintPRO;
    edtLembrete: TcxTextEdit;
    btnSalvar: TcxButton;
    btnCancelarLembrete: TcxButton;
    btnImprimirImagem: TcxButton;
    btnCancelarImpImagem: TcxButton;
    XP: TImagXpress;
    btnHistorico: TAdvGlowButton;
    btnExcluirArquivo: TAdvGlowButton;
    procedure TwainPROPostScan(Sender: TObject; var Cancel: WordBool);
    procedure Xpress1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; x, y: Integer);
    procedure Xpress1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; x, y: Integer);
    procedure cxTrackBar1PropertiesChange(Sender: TObject);
    procedure spbPreviewWidthClick(Sender: TObject);
    procedure spbPreviewWholeClick(Sender: TObject);
    procedure spbPreview100PercentClick(Sender: TObject);
    procedure btnImagemClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure btnBrandClick(Sender: TObject);
    procedure btnCarimboClick(Sender: TObject);
    procedure Xpress1Click(Sender: TObject);
    procedure btnDigitalizarClick(Sender: TObject);
    procedure btnRedigitalizarClick(Sender: TObject);
    procedure edtNumeroKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure Xpress1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Xpress1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure icxGrupoPropertiesChange(Sender: TObject);
    procedure btnIndexarClick(Sender: TObject);
    procedure cbxPaginasPropertiesChange(Sender: TObject);
    procedure Xpress1DblClick(Sender: TObject);
    procedure lcbCarimboPropertiesEditValueChanged(Sender: TObject);
    procedure btnPdfClick(Sender: TObject);
    procedure btnCancelarImpImagemClick(Sender: TObject);
    procedure btnImprimirImagemClick(Sender: TObject);
    procedure cbxTipoImpressaoPropertiesEditValueChanged(Sender: TObject);
    procedure Margem1cm1Click(Sender: TObject);
    procedure Notate1CurrentLayerChange(ASender: TObject;
      newLayer: Integer);
    procedure btnCancelarLembreteClick(Sender: TObject);
    procedure btnLembreteClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnscannerimgClick(Sender: TObject);
    procedure btnImprimirImgClick(Sender: TObject);
    procedure btnPDFImagemClick(Sender: TObject);
    procedure btnSalvarImagemClick(Sender: TObject);
    procedure btnGirarImagemClick(Sender: TObject);
    procedure btnTrocarImagemClick(Sender: TObject);
    procedure btnBordaImagemClick(Sender: TObject);
    procedure btnImagemBrancoClick(Sender: TObject);
    procedure btnExcluirPagImagemClick(Sender: TObject);
    procedure btnJuntarImagemClick(Sender: TObject);
    procedure btnMargemImagemClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure chxAssinarClick(Sender: TObject);
    procedure pagControleChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnRecortarImagemClick(Sender: TObject);
    procedure DelphiTwain1TwainAcquire(Sender: TObject; const Index: Integer;
      Image: TBitmap; var Cancel: Boolean);
    procedure btnHistoricoClick(Sender: TObject);
    procedure btnExcluirArquivoClick(Sender: TObject);
  private
    { Private declarations }
    vg_atualiza,
    vg_Capturando,
    vg_Activated,
    vg_aspecto,
    vg_ExibirFicha,
    vg_trackzoom,
    vgPrintPDF,
    vlImagemColorida,
    vg_Imagem_Alterada,
    vgTwainPadrao,
    vgControleNumeroPagina : Boolean;

    vg_ZoomPadrao,
    vg_Imagem_Nova_Largura_W,
    vg_Imagem_Nova_Altura_H,
    vg_EstiloCarimbo,
    vg_ImprimirCabecalho,
    vg_ImprimirRodape,
    vg_BordaCarimbo,
    vg_PaperSize,
    curIDRectangle : Integer;

    vg_TMargemCabecalho,
    vg_LMargem, vg_LMargemVerso, vg_LMargemFrente,
    vg_SobreMargemCabecalho,
    vg_TMargemRodape,
    vg_SobreMargemRodape,
    vg_WPagina,
    vg_HPagina : Double;

    vg_ExibirBarraControle : string;
    vg_Qualifica, vg_CabecalhoDiferente, vg_RodapeDiferenteUtlPag : Boolean;

    function BitsPerPixelBrand: Integer;

    procedure UpdateZoom;
    procedure CarregarNumeroImagens;
    procedure AtualizaImagem(Arquivo : String);

    procedure Validar;
    procedure Imprimir(Tipo : Byte);
    procedure TrocarPosicaoImagem;
    procedure GerarPDF(Tipo: Byte);
    procedure InserirMargemImagem(vpMargem: Integer);
    procedure InsereObjetoTexto;
    procedure ScanImageFloating;
    procedure RetirarBordas(vpTipo : Integer = 2);
    procedure ShowCertificados;
    procedure IndexarImagem(vNumero, vTipo, vLivroOuTalao, vOperacao, vPagina,vObs: string);
    procedure ImagemHistorico;
    procedure GravarHistorico(vpGravar: Boolean);
    procedure ValidaExisteImagem;
    procedure TrimAppMemorySize;
  public
    { Public declarations }
    vg_PosInic : TPoint;
    vg_DiretorioAuxiliar,
    vg_ArqruivoCarimbo,
    vg_CaminhoDiretorio,
    vg_NumeroMatricula,
    vg_LetraMatricula,
    vg_NomeArquivo,
    vg_TipoGravacao, //M-> Manual / A -> Automatica
    vg_NovoAto,
    vg_ArquivoImagem,
    vg_ArquivoHistorico : String;

    vg_NumImagem,
    vg_NumeroPaginas,
    curLayer : Integer;

    vg_SolicitarPrint,
    vg_hbltCarimbo,
    vg_hbltImagem: Boolean;

    vg_Imagem : TImagem;
    vg_Cabecalho : TCabecalho;
    procedure PegaImagem;
    procedure GravarImagem;
    procedure GravarImagemIndexada(vOperacao, vPagina, vIndexar, vObs: string);
    procedure CarregaPaginas;
    procedure CriarTwain(NomeArquivo: string = 'IMAGEM.TIF');//Esta procedure eve ser declarado no onCreate do form que comportar este frame
    procedure AtivarNotate(vpAtivar : Boolean = False);
    procedure FecharNotate;//Esta procedure deve ser declarado no onClose do form que comportar este frame
    procedure InicializarSessao;
    procedure LimparCampos;
    procedure ExibirFichaLado(Valor : Boolean);
    procedure ImagemColorida(Valor : Boolean);
    function ValidarImagem : Boolean;
    procedure SetEstiloCarimbo(vpTipo : Integer);

  end;

var
  vgImagemImpressa, vgUtilizarMargemVerso : Boolean;

implementation

uses
  Controles,
  Rotinas,
  MostrarImagem,
  ControleVariaveis,
  Winapi.ShellAPI,
  MensagemUtils,
  System.StrUtils,
  System.Math,
  RotinasImagem;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

{ TfmeImagem }
procedure TfmeImagem.ShowCertificados;
begin
  fmeAssinaturaDigital1.PopularCertList;

  pnlCertificados.Top  := (Height div 2) - (pnlCertificados.Height div 2);
  pnlCertificados.Left := (Width div 2) - (pnlCertificados.Width div 2);

  pnlCertificados.Visible := True;
end;

procedure TfmeImagem.InicializarSessao;
var
  SourceIndex: Integer;
begin
  if vgTwainPadrao then
  begin
    TwainPRO.CloseSession;
    try
      TwainPRO.OpenSession;
      try
        TwainPRO.StartSession;
      finally
        TwainPRO.CloseSession;
      end;
    except
      if TwainPRO.ErrorCode >= 1000 then
        Application.MessageBox(PChar('Scanner n�o pode ser inicializado! Erro: ' + IntToStr(TwainPRO.ErrorCode)), 'Aten��o', MB_OK + MB_ICONERROR);
    end;
  end
  else
  begin
    if DelphiTwain1.LoadLibrary then
    begin
      try
        DelphiTwain1.SourceManagerLoaded := false;

        DelphiTwain1.LoadSourceManager();
        SourceIndex := DelphiTwain1.SelectSource();

        if SourceIndex <> -1 then
          with DelphiTwain1.Source[SourceIndex] do
          begin
            //Prepare for transfering using ttmFile mode
            Loaded := TRUE;
            TransferMode := ttmMemory;
            Enabled := TRUE;
          end
          else Abort;
      except

      end;
    end
    else ShowMessage('Twain n�o instalado!')
  end;
end;

procedure TfmeImagem.CriarTwain(NomeArquivo: string = 'IMAGEM.TIF');
begin
  Application.ProcessMessages;

  curLayer         := 0;
  curIDRectangle   := 0;
  vg_NumeroPaginas := 0;
  
  vg_ExibirFicha := True;
  vg_hbltCarimbo := True;
  ImagemColorida(False);

  vg_DiretorioAuxiliar := Copy(ExtractFilePath(Application.ExeName),1,Length(ExtractFilePath(Application.ExeName))-1);

  try
    if not DirectoryExists(vg_DiretorioAuxiliar) then
       MkDir(vg_DiretorioAuxiliar);

    IXDibLoader.Visible := False;
    PrintPRO1.UseDefaultPrinter := True;

    Xpress1.FileName := '';
    vg_hbltImagem := False;
    vg_Activated  := False;

    TwainPRO.hParentWnd := Application.Handle;

    //Abrir a query com os tipos de carimbo
    sqlCarimbo.Connection := dtmControles.DB;
    sqlCarimbo.Active     := False;
    sqlCarimbo.Params[0].AsInteger := vgId;
    sqlCarimbo.Active     := True;

    //Carimbo
    vg_EstiloCarimbo         := dtmControles.BuscarConfig('IMAGEM', 'CARIMBO',   'ESTILO_CARIMBO', 'I');
    vg_BordaCarimbo          := dtmControles.BuscarConfig('IMAGEM', 'CARIMBO',   'BORDA_CARIMBO', 'I');

    //Cabe�alho
    vg_SobreMargemCabecalho  := dtmControles.BuscarConfig('IMAGEM', 'CABECALHO', 'SOBREMARGEM_CABECALHO', 'D');
    vg_ImprimirCabecalho     := dtmControles.BuscarConfig('IMAGEM', 'CABECALHO', 'IMPRIMIR_CABECALHO', 'I');
    vg_Qualifica             := dtmControles.BuscarConfig('IMAGEM', 'CABECALHO', 'QUALIFICA_CABECALHO', 'S') = 'S';
    vg_CabecalhoDiferente    := dtmControles.BuscarConfig('IMAGEM', 'CABECALHO', 'CABECALHO_DIFERENTE_1PAGINA', 'S') = 'S';
    vg_RodapeDiferenteUtlPag := dtmControles.BuscarConfig('IMAGEM', 'RODAPE', 'RODAPE_DIFERENTE_ULTIMAPAG', 'S') = 'S';

    //Rodap�
    vg_SobreMargemRodape     := dtmControles.BuscarConfig('IMAGEM', 'RODAPE', 'SOBREMARGEM_RODAPE', 'D');
    vg_TMargemRodape         := dtmControles.BuscarConfig('IMAGEM', 'RODAPE', 'TAMANHO_RODAPE', 'D');
    vg_ImprimirRodape        := dtmControles.BuscarConfig('IMAGEM', 'RODAPE', 'IMPRIMIR_RODAPE', 'I');

    //Geral
    vg_LMargem               := dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'MARGEM_ESQUERDA_IMAGEM', 'D');
    vg_LMargemFrente         := vg_LMargem;

    if vgUtilizarMargemVerso then
         vg_LMargemVerso     := dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'MARGEM_VERSO_AJUSTE', 'D')
    else vg_LMargemVerso     := 0;

    vg_aspecto               := dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'ASPECTO', 'S') = 'S';
    vg_ZoomPadrao            := dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'ZOOM_PADRAO', 'I');
    vg_Imagem_Nova_Largura_W := Round(dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'IMAGEM_NOVA_LARGURA', 'D') * 118.095);
    vg_Imagem_Nova_Altura_H  := Round(dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'IMAGEM_NOVA_ALTURA', 'D')  * 118.095);
    vg_ExibirBarraControle   := dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'EXIBIR_BARRA_CONTROLE', 'S');
    vgTwainPadrao            := dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'TWAIN_PADRAO', 'S') = 'S';
    vgControleNumeroPagina   := dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'CONTROLE_NUMERO_PAGINA', 'S') = 'S';
    cbxTipoPapel.EditValue   := dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'PAPEL_PADRAO', 'I');

    fmeAssinaturaDigital1.ParamentrosAssinatura;

    if vg_ExibirBarraControle = 'N' then
      cxSplitter2.CloseSplitter;

    vg_ArquivoImagem    :=  vg_DiretorioAuxiliar + '\'+NomeArquivo;
    vg_ArquivoHistorico :=  vg_DiretorioAuxiliar + '\HISTORICO.TIF';
    vg_ArqruivoCarimbo  :=  vg_DiretorioAuxiliar + '\CARIMBO.TIF';

    vg_Imagem_Alterada := False;

  Except

  end;
end;

procedure TfmeImagem.TwainPROPostScan(Sender: TObject;
  var Cancel: WordBool);
begin
  {Carrega imagem do scanner para o componente de exibi��o}
  if not cbxScanImageFloating.Checked then
  begin
    //Controla N� paginas digitalizadas
    if vgControleNumeroPagina and (Xpress1.SaveMultiPage = True) then
      if vg_NumeroPaginas <= Xpress1.Pages then
      begin
        Cancel := True;
        Application.MessageBox('N�mero de p�ginas digitalizadas maior que n�mero de paginas informadas!', 'Aten��o', MB_OK + MB_ICONWARNING);
        Exit;
      end;

    try
      try
        //Xpress1.LoadBuffer(TwainPRO.hDIB);
        Xpress1.hDIB := TwainPRO.hDIB;
        if Xpress1.SaveMultiPage then
        begin
          Xpress1.SaveFileName := vg_ArquivoImagem;

          if (not vlImagemColorida) then
          begin
            Xpress1.SaveFileType := FT_TIFF_G4;
            Xpress1.SaveTIFFCompression := TIFF_CCITTFAX4
          end
          else
          begin
            Xpress1.SaveJPEGLumFactor   := 50;
            Xpress1.SaveJPEGChromFactor := 50;
            Xpress1.SaveFileType := FT_TIFF_JPEG;
            Xpress1.SaveTIFFCompression := TIFF_JPEG;
          end;

          Xpress1.SaveFile;
          Inc(vg_NumImagem);
        end
        else
        begin
          AtualizaImagem(vg_ArqruivoCarimbo);
          Cancel := True;
        end;
      except on E: Exception do
        begin
          Application.MessageBox(PChar('Falha: ' + e.Message), 'Falha', MB_OK + MB_ICONINFORMATION);
        end;
      end;
    finally
      //CarregarNumeroImagens;
      PegaImagem;
      imgControle.Visible := False;

      // Grava a Imagem
      GravarImagem;
    end;
  end
  else ScanImageFloating;

  TrimAppMemorySize;
end;

procedure TfmeImagem.Xpress1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; x, y: Integer);
begin
  if (Xpress1.MousePointer <> MP_CHand2) then
    if (Button = mbLeft) and (Xpress1.ImagWidth <> 0) then
    begin
      vg_atualiza      := true;
      vg_PosInic.X     := X;
      vg_PosInic.Y     := Y;
      vg_Capturando    := true;
      if (Xpress1.MousePointer <> MP_BPush) then
         Xpress1.MousePointer := MP_CHand2;
    end;
end;

procedure TfmeImagem.Xpress1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; x, y: Integer);
begin
  if Xpress1.MousePointer = MP_CHand2 then
    if vg_Capturando then
    begin
      With Xpress1 do
      begin
        ScrollX := ScrollX  + (vg_PosInic.X - X);
        ScrollY := ScrollY  + (vg_PosInic.Y - Y);
      end;
      vg_Capturando    := false;
      vg_atualiza      := false;
      Xpress1.MousePointer := MP_Arrow;
    end;
end;

procedure TfmeImagem.cxTrackBar1PropertiesChange(Sender: TObject);
begin
  if vg_trackzoom then
  begin
    Xpress1.Zoom(tbrZoom.Position / 100);
    UpdateZoom;
  end;
end;

procedure TfmeImagem.DelphiTwain1TwainAcquire(Sender: TObject;
  const Index: Integer; Image: TBitmap; var Cancel: Boolean);
begin
  {Carrega imagem do scanner para o componente de exibi��o}
  if not cbxScanImageFloating.Checked then
  begin
    //Controla N� paginas digitalizadas
    if vgControleNumeroPagina and (Xpress1.SaveMultiPage = True) then
      if vg_NumeroPaginas <= Xpress1.Pages then
      begin
        Cancel := True;
        Application.MessageBox('N�mero de p�ginas digitalizadas maior que n�mero de paginas informadas!', 'Aten��o', MB_OK + MB_ICONWARNING);
        Exit;
      end;
    try
      Xpress1.Picture.Bitmap := Image;
      if Xpress1.SaveMultiPage then
      begin
        Xpress1.SaveFileName := vg_ArquivoImagem;

        if (not vlImagemColorida) then
        begin
          Xpress1.SaveFileType := FT_TIFF_G4;
          Xpress1.SaveTIFFCompression := TIFF_CCITTFAX4
        end
        else
        begin
          Xpress1.SaveJPEGLumFactor   := 50;
          Xpress1.SaveJPEGChromFactor := 50;
          Xpress1.SaveFileType := FT_TIFF_JPEG;
          Xpress1.SaveTIFFCompression := TIFF_JPEG;
        end;

        Xpress1.SaveFile;
        Inc(vg_NumImagem);
      end
      else
      begin
        AtualizaImagem(vg_ArqruivoCarimbo);
        Cancel := True;
      end;
    finally
      //CarregarNumeroImagens;
      PegaImagem;
      imgControle.Visible := False;

      // Grava a Imagem
      GravarImagem;
    end;
  end
  else
  begin
    IXDibLoader.Picture.Bitmap := Image;
    ScanImageFloating;
  end;

  TrimAppMemorySize;
end;

procedure TfmeImagem.spbPreviewWidthClick(Sender: TObject);
begin
  LockWindowUpdate(handle);
  vg_trackzoom := False;
  Xpress1.ZoomToFit(ZOOMFIT_WIDTH);
  UpdateZoom;
  if edtZoom.Text <> '' then
     tbrZoom.Position := StrToInt(edtZoom.Text);
  Application.ProcessMessages;
  vg_trackzoom := True;
  spbPreviewWidth.Down := True;
  LockWindowUpdate(0);
end;

procedure TfmeImagem.spbPreviewWholeClick(Sender: TObject);
begin
  LockWindowUpdate(handle);
  vg_trackzoom := False;
  Xpress1.ZoomToFit(ZOOMFIT_HEIGHT);
  UpdateZoom;
  if edtZoom.Text <> '' then
     tbrZoom.Position := StrToInt(edtZoom.Text);
  vg_trackzoom := True;
  spbPreviewWhole.Down := True;
  LockWindowUpdate(0);
end;

procedure TfmeImagem.spbPreview100PercentClick(Sender: TObject);
begin
  LockWindowUpdate(handle);
  vg_trackzoom := False;
  Xpress1.Zoom(1);
  UpdateZoom;
  if edtZoom.Text <> '' then
     tbrZoom.Position := StrToInt(edtZoom.Text);
  vg_trackzoom := True;
  spbPreview100Percent.Down := True;
  LockWindowUpdate(0);
end;

procedure TfmeImagem.UpdateZoom;
begin
  edtZoom.Text := IntToStr(round(Xpress1.IPZoomF * 100));
  fmeEditorSimples1.wptTexto.Zooming := Trunc(Xpress1.IPZoomF*100);
end;

procedure TfmeImagem.btnImagemClick(Sender: TObject);
begin
  imgControle.Visible := False;
  pnlDigitalizar.Visible := not pnlDigitalizar.Visible;

  btnCarimbo.Visible     := (not pnlDigitalizar.Visible) and (Tag = 0);
  btnBrand.Visible       := btnCarimbo.Visible;
  btnLembrete.Visible    := btnCarimbo.Visible;
  pnlCarimbo.Visible     := False;

  if Tag = 0 then
  begin
    vg_hbltImagem := False;
    btnCarimbo.Flat := True;
    spbPreviewWhole.Enabled      := True;
    spbPreview100Percent.Enabled := True;
    pnlTextoCarimbo.Visible := False;
    cxSplitter1.Visible := False;
    Xpress1.MousePointer := MP_Arrow;
  end;

  if vg_TipoGravacao = 'M' then
  begin
    btnIndexar.Visible := True;
  end
  else begin
       btnIndexar.Visible := False;
  end;

  if pnlDigitalizar.Visible then
     btnImagem.ImageIndex := 9
  else begin
       btnImagem.ImageIndex := 0;
       btnCancelarClick(nil);
  end;
end;

procedure TfmeImagem.PegaImagem;
var Npag : Integer;
    Lado : String;
begin
  {Carrega a imagem a ser exibida}
  LockWindowUpdate(handle);
  Screen.Cursor    := crHourglass;
  Xpress1.IResUnits:= IRes_Cm;
  Xpress1.PageNbr  := vg_NumImagem;
  Xpress1.FileName := '';
  Xpress1.FileName := vg_ArquivoImagem;
  Application.ProcessMessages;
  CarregarNumeroImagens;

  case vg_ZoomPadrao of
    0 :spbPreviewWholeClick(nil);
    1 :spbPreviewWidthClick(nil);
    2 :spbPreview100PercentClick(nil);
  end;

  //Controla a habilita��o dos bot�es de movimenta��o entre as imagens
  if vg_NumImagem = 1 then
  begin
    //Promeira imagem
    btnPrimeiro.Enabled := False;
    btnAnterior.Enabled := False;
    if Xpress1.Pages > 1 then
    begin
      btnProximo.Enabled  := True;
      btnUltimo.Enabled   := True;
    end
    else begin
         btnProximo.Enabled  := false;
         btnUltimo.Enabled   := false;
    end;
  end
  else
  if vg_NumImagem < Xpress1.Pages then
  begin
    //Imagens intermediarias
    btnAnterior.Enabled := True;
    btnPrimeiro.Enabled := True;
    btnProximo.Enabled  := True;
    btnUltimo.Enabled   := True;
  end
  else
  if vg_NumImagem = Xpress1.Pages then
  begin
    //Ultima imagem
    btnAnterior.Enabled := True;
    btnPrimeiro.Enabled := True;
    btnProximo.Enabled  := false;
    btnUltimo.Enabled   := false;
  end;

  if vg_ExibirFicha then
  begin
    if (vg_NumImagem + 1) mod 2 = 0 then
       Lado := 'F'
    else Lado := 'V';
    Npag := (vg_NumImagem + 1) div 2;
    stxFichaLado.Caption := 'Ficha: ' + IntToStr(Npag) + '-' + Lado;
  end;

  cbxPaginas.Tag := 1;
  cbxPaginas.Text := IntToStr(vg_NumImagem);
  cbxPaginas.Tag := 0;

  Screen.Cursor    := crDefault;

  btnRedigitalizar.Enabled := Xpress1.Pages >= 1;
  LockWindowUpdate(0);
end;

procedure TfmeImagem.RetirarBordas(vpTipo: Integer);
var  r, i, Nri : Integer;
    viArquivo,
    viImgCorrigida : String;
begin
  Screen.Cursor := crHourglass;
  viArquivo := vg_DiretorioAuxiliar + '\IMA.TIF';
  viImgCorrigida := vg_DiretorioAuxiliar + '\IMG_CORRIGIDA.TIF';

  Xpress1.FileName := vg_ArquivoImagem;
  Nri := Xpress1.Pages;
  for i := 1 to Nri do
  begin
    Xpress1.PageNbr := i;
    Xpress1.FileName := vg_ArquivoImagem;
    r := round(118 * 2.5423);
    Xpress1.CropBorder(0.9, vpTipo);

    if i = 1 then
    begin
      DeleteFile(viImgCorrigida);
      Xpress1.SaveFileName := viImgCorrigida;
    end
    else
    begin
      DeleteFile(viArquivo);
      Xpress1.SaveFileName := viArquivo;
    end;

    Xpress1.SaveMultiPage := True;
    
    if (not vlImagemColorida) then
    begin
      Xpress1.SaveFileType := FT_TIFF_G4;
      Xpress1.SaveTIFFCompression := TIFF_CCITTFAX4
    end
    else
    begin
      Xpress1.SaveJPEGLumFactor   := 50;
      Xpress1.SaveJPEGChromFactor := 50;
      Xpress1.SaveFileType := FT_TIFF_JPEG;
      Xpress1.SaveTIFFCompression := TIFF_JPEG;
    end;

    Xpress1.IResX := r;
    Xpress1.IResY := r;
    Xpress1.SaveFile;

    if i > 1 then
    begin
      Xpress1.InsertPage(viArquivo, viImgCorrigida, i + 1);
    end;
  end;
  CopyFile(Pchar(viImgCorrigida), Pchar(vg_ArquivoImagem), False);
  
  vg_Imagem_Alterada := True;
  Screen.Cursor := crDefault;
end;

procedure TfmeImagem.ScanImageFloating;
var
  e, X, Y : Integer;
begin
  if Xpress1.Pages = 0 then
    btnImagemBrancoClick(nil);

  if vgTwainPadrao then
    IXDibLoader.LoadBuffer(TwainPRO.hDIB);

  IXDibLoader.SaveFileName := vg_ArqruivoCarimbo;

  IXDibLoader.SaveJPEGLumFactor   := 50;
  IXDibLoader.SaveJPEGChromFactor := 50;
  IXDibLoader.SaveFileType := FT_TIFF_JPEG;
  IXDibLoader.SaveTIFFCompression := TIFF_JPEG;
  IXDibLoader.SaveFile;

  IXDibLoader.Filename := vg_ArqruivoCarimbo;

  if (curLayer = 0) then
  begin
    Notate1.SetClientWindow(Xpress1.hWnd);
    if curLayer = 0 Then Notate1.CreateLayer;
    if (curLayer <> 0) then
    begin
       Notate1.SetToolPaletteVisible (curLayer, False);
       if (Notate1.GrpGetFirstGroupID(curLayer) = 0) Then
          Notate1.GrpCreateGroup(curLayer, '', 0);
    end;
  end;

  //Determina a posi��o central para ser inserida a imagem de carimbo
  X := Trunc(100 / Xpress1.IPZoomF);
  Y := Trunc(100 / Xpress1.IPZoomF);

  //Cria imag em de carimbo
  e := Notate1.ElementCreate;
  Notate1.ElementSetType(e, ImageTool);
  Notate1.ElementSetDIBHandle(e, IXDibLoader.CopyDib);
  Notate1.ElementSetBoundingRect(e, X , Y , X + Trunc(IXDibLoader.IWidth), Y + Trunc(IXDibLoader.IHeight));
  Notate1.ElementSetPenColor(e, clBlack);
  Notate1.ElementSetPenWidth(e, vg_BordaCarimbo);
  Notate1.ElementSetBackstyle(e, vg_EstiloCarimbo);
  Notate1.ElementAppend(e);
  Notate1.ElementDestroy(e);
  imgControle.Visible := False;

  TrimAppMemorySize;
end;

procedure TfmeImagem.SetEstiloCarimbo(vpTipo: Integer);
begin
  vg_EstiloCarimbo := vpTipo;
end;

procedure TfmeImagem.btnPrimeiroClick(Sender: TObject);
begin
  vg_NumImagem := 1;
  PegaImagem;
end;

procedure TfmeImagem.btnAnteriorClick(Sender: TObject);
begin
  dec(vg_NumImagem);
  PegaImagem;
end;

procedure TfmeImagem.btnProximoClick(Sender: TObject);
begin
  Inc(vg_NumImagem);
  PegaImagem;
end;

procedure TfmeImagem.btnUltimoClick(Sender: TObject);
begin
  vg_NumImagem := Xpress1.Pages;
  PegaImagem;
end;

procedure TfmeImagem.btnBrandClick(Sender: TObject);
begin
  {Aplica a imagem de carimbo a imagem original}
  Screen.Cursor    := crHourglass;

  Notate1.Brand(BitsPerPixelBrand);

  //Delata os layers
  if (curLayer <> 0) then
      Notate1.DeleteLayer(curLayer);

  AtualizaImagem(vg_ArqruivoCarimbo);

  //Carrega para a tela a imagem gerada com o carimbo
  PegaImagem;
  vg_Activated := false;
  vg_Imagem_Alterada := True;
  Screen.Cursor := crDefault;
end;

procedure TfmeImagem.btnJuntarImagemClick(Sender: TObject);
begin
  ValidaExisteImagem;

  if Xpress1.Pages = 1 then
  begin
    Application.MessageBox('Adicione mais imagens para realizar essa fun��o!',
      'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  if Application.MessageBox('Confirma juntar essas imagens?', 'Aten��o', MB_YESNO + MB_ICONQUESTION) = ID_YES then
    btnBrandClick(nil);
end;

procedure TfmeImagem.btnExcluirArquivoClick(Sender: TObject);
var
  viFileHist,
  viNomeArquivo: string;
begin
  if Xpress1.Pages = 0 then
  begin
    Application.MessageBox('Esta rotina n�o pode ser executada, pois n�o existe nenhuma imagem selecionada!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PWideChar('EST� ROTINA EXCLU�RA O ARQUIVO DE IMAGEM POR COMPLETO!'+ #13#10 +
                                      'Deseja continuar com est� opera��o?'), 'Aten��o',
                                      MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDNO then
    Exit;

  if Application.MessageBox('Confirma exclus�o deste arquivo de imagem?', 'Aten��o', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_NO then
    Exit;

  DeleteFile(vg_ArquivoHistorico);

  viFileHist := vg_CaminhoDiretorio + 'Historico\';
  if not DirectoryExists(viFileHist) then
    ForceDirectories(viFileHist);

  viNomeArquivo := GetNomeArquivo(vg_NomeArquivo);
  viFileHist := viFileHist + 'H_' + viNomeArquivo;

  if CopyFile(PWideChar(vg_ArquivoImagem), PWideChar(viFileHist), False) then
  begin
      if not DeleteFile(vg_NomeArquivo) then
      begin
        Application.MessageBox('N�o fui possivel excluir este arquivo!', 'Erro',MB_OK + MB_ICONERROR);
        Exit;
      end;

      DeleteFile(vg_ArquivoImagem);
      Xpress1.FileName    := '';
      imgControle.Visible := True;
      btnImprimir.Enabled := False;
      btnPdf.Enabled      := False;
      btnAnterior.Enabled := False;
      btnPrimeiro.Enabled := False;
      btnProximo.Enabled  := False;
      btnUltimo.Enabled   := False;
      btnCarimbo.Visible  := False;
      btnLembrete.Visible := False;
      btnBrand.Visible    := False;
      GravarHistorico(True);
      cbxPaginas.Properties.Items.Clear;
      if vg_hbltImagem then
        btnCarimboClick(nil);
      vg_Imagem_Alterada := False;
  end
  else
    Application.MessageBox('N�o fui possivel salvar o hist�rico deste arquivo!', 'Erro',MB_OK + MB_ICONERROR);
end;

procedure TfmeImagem.btnExcluirPagImagemClick(Sender: TObject);
begin
  ValidaExisteImagem;
  if Application.MessageBox('Confirma exclus�o desta p�gina da imagem?', 'Aten��o', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = ID_YES then
  begin
    ImagemHistorico;

    if Xpress1.Pages = 1 then
    begin
      DeleteFile(vg_NomeArquivo);
      DeleteFile(vg_ArquivoImagem);
      Xpress1.FileName    := '';
      imgControle.Visible := True;
      btnImprimir.Enabled := False;
      btnPdf.Enabled      := False;
      btnAnterior.Enabled := False;
      btnPrimeiro.Enabled := False;
      btnProximo.Enabled  := False;
      btnUltimo.Enabled   := False;
      btnCarimbo.Visible  := False;
      btnLembrete.Visible := False;
      btnBrand.Visible    := False;
      GravarHistorico(True);
      cbxPaginas.Properties.Items.Clear;
      if vg_hbltImagem then
        btnCarimboClick(nil);
      vg_Imagem_Alterada := False;
    end
    else
    begin
      Xpress1.DeletePage(vg_ArquivoImagem, vg_NumImagem);
      //Comprime o arquivo das imagens
      Xpress1.CompressInMemory;
      Xpress1.CompactFile(vg_ArquivoImagem, vg_DiretorioAuxiliar + '\IMA.TIF');
      if not CopyFile(Pchar(vg_DiretorioAuxiliar + '\IMA.TIF'), Pchar(vg_ArquivoImagem), FALSE) then
        ShowMessage('Erro, n�o foi possivel copiar a imagem!')
      else
        GravarHistorico(True);
      //CarregarNumeroImagens;//Carrega o n�mero de imagens para o combobox
      btnPrimeiroClick(nil);
      //GravarImagem;
      vg_Imagem_Alterada := True;
    end;
  end;

end;

procedure TfmeImagem.btnscannerimgClick(Sender: TObject);
begin
  btnImagemClick(nil);
end;

procedure TfmeImagem.btnImprimirImgClick(Sender: TObject);
begin
  btnImprimirClick(nil);
end;

procedure TfmeImagem.btnPDFImagemClick(Sender: TObject);
begin
  btnPdfClick(nil);
end;

procedure TfmeImagem.btnSalvarImagemClick(Sender: TObject);
begin
  ValidaExisteImagem;
  if Application.MessageBox('Confirma grava��o desta imagem?', 'Aten��o', MB_YESNO + MB_ICONQUESTION) = ID_YES then
    GravarImagem;
end;

procedure TfmeImagem.btnGirarImagemClick(Sender: TObject);
var
   viArquivo : String;
begin
  ValidaExisteImagem;
  Xpress1.Rotate(90);

  viArquivo := vg_DiretorioAuxiliar + '\IMA.TIF';
  DeleteFile(viArquivo);

  Notate1.SaveAnnotations := True;
  Notate1.PreserveWTLayers:= True;
  Xpress1.SaveMultiPage   := false;
  Xpress1.SaveFileName    := viArquivo;

  if (not vlImagemColorida) then
  begin
    Xpress1.SaveFileType := FT_TIFF_G4;
    Xpress1.SaveTIFFCompression := TIFF_CCITTFAX4
  end
  else
  begin
    Xpress1.SaveJPEGLumFactor   := 50;
    Xpress1.SaveJPEGChromFactor := 50;
    Xpress1.SaveFileType := FT_TIFF_JPEG;
    Xpress1.SaveTIFFCompression := TIFF_JPEG;
  end;
  
  Xpress1.SaveFile;

  Xpress1.InsertPage(viArquivo, vg_ArquivoImagem, vg_NumImagem + 1);
  Xpress1.DeletePage(vg_ArquivoImagem, vg_NumImagem);

  //Comprime o arquivo das imagens
  Xpress1.CompressInMemory;
  Xpress1.CompactFile(vg_ArquivoImagem, viArquivo);
  if not CopyFile(Pchar(viArquivo), Pchar(vg_ArquivoImagem), False) then
    ShowMessage('Erro, n�o foi possivel salvar a imagem!');

  PegaImagem;
  vg_Imagem_Alterada := True;

end;

procedure TfmeImagem.btnHistoricoClick(Sender: TObject);
var
  viFileHist,
  viNomeArquivo : string;
begin
  viFileHist := vg_CaminhoDiretorio + 'Historico\';
  viNomeArquivo := GetNomeArquivo(vg_NomeArquivo);
  viFileHist := viFileHist + 'H_' + viNomeArquivo;

  if not FileExists(viFileHist) then
  begin
    Application.MessageBox('N�o existe hist�rico para esta imagem!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  vg_NumeroImagemAtual := 1;
  if frmMostrarImagem = nil then
    Application.CreateForm(TfrmMostrarImagem, frmMostrarImagem);
  frmMostrarImagem.vg_ArquivoImagem := viFileHist;
  frmMostrarImagem.Caption := 'Hist�rico das Imagens';
  frmMostrarImagem.btnExportar.Visible := True;
  frmMostrarImagem.ShowModal;
end;

procedure TfmeImagem.btnBordaImagemClick(Sender: TObject);
begin
  ValidaExisteImagem;
  with CreateMessageDialog('Retirar Bordas?', mtConfirmation, [mbYes, MbNo, mbCancel]) do
  begin
    vgPrintPDF := True;
    Caption := 'Bordas';
    (FindComponent('YES') as TButton).Caption := 'Brancas';
    (FindComponent('NO') as TButton).Caption := 'Escuras';
    (FindComponent('CANCEL') as TButton).Caption := 'Cancelar';
    ShowModal;
    try
      if (ModalResult = mrYes) then
         RetirarBordas(3)
      else if(ModalResult = mrNo) then
             RetirarBordas(2);
    except
      ShowMessage('Erro ao retirar bordas!');
    end;
  end;
end;

procedure TfmeImagem.btnTrocarImagemClick(Sender: TObject);
begin
  TrocarPosicaoImagem;
end;

procedure TfmeImagem.btnImagemBrancoClick(Sender: TObject);
var
  w, h : Integer;
begin
  if Xpress1.Pages <> 0 then
  begin
    if Application.MessageBox('Deseja gerar imagem nova no mesmo tamanho da imagem atual?', 'Aten��o', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      w := Xpress1.IWidth;
      h := Xpress1.IHeight;
    end
    else
    begin
      w := vg_Imagem_Nova_Largura_W;
      h := vg_Imagem_Nova_Altura_H;
    end;
  end
  else
  begin
    vg_NumImagem := 0;
    w := vg_Imagem_Nova_Largura_W;
    h := vg_Imagem_Nova_Altura_H;
    imgControle.Visible := False;
  end;
  Xpress1.SaveMultiPage := True;

  if (not vlImagemColorida) then
  begin
    Xpress1.CreateDIB(w, h, 1, RGB(255, 255, 255));
    Xpress1.SaveFileType := FT_TIFF_G4;
    Xpress1.SaveTIFFCompression := TIFF_CCITTFAX4
  end
  else
  begin
    Xpress1.CreateDIB(w, h, 24, RGB(255, 255, 255));
    Xpress1.SaveJPEGLumFactor   := 50;
    Xpress1.SaveJPEGChromFactor := 50;
    Xpress1.SaveFileType := FT_TIFF_JPEG;
    Xpress1.SaveTIFFCompression := TIFF_JPEG;
  end;

  Xpress1.SaveFileName := vg_ArquivoImagem;
  Xpress1.SaveFile;
  Inc(vg_NumImagem);
  PegaImagem;
  vg_Imagem_Alterada := True;
end;

procedure TfmeImagem.btnMargemImagemClick(Sender: TObject);
var pt: TPoint;
begin
  ValidaExisteImagem;
  GetCursorPos(pt); // Pega a posi��o atual do mouse;
  PopupMenu1.Popup(pt.x, pt.y);
end;

procedure TfmeImagem.AtivarNotate(vpAtivar : Boolean = False);
begin
  try
    if (vg_Activated = False) then
    begin
      if not vpAtivar then
         vg_Activated := True;
      //Conecta o ImagXpress ao NotateXpress
      Notate1.SetClientWindow(Xpress1.hWnd);
      if curLayer = 0 Then Notate1.CreateLayer;
      if (curLayer <> 0) then
      begin
        Notate1.SetToolPaletteVisible (curLayer, False);
        if (Notate1.GrpGetFirstGroupID(curLayer) = 0) Then
           Notate1.GrpCreateGroup(curLayer, '', 0);
      end;
      if (not vg_hbltImagem) and (imgControle.Visible = False) then
        PegaImagem;
    end;
  finally
    curIDRectangle := 0;
  end;
end;

procedure TfmeImagem.FecharNotate;
begin
  try
    TwainPRO.CloseSession;
    Notate1.SetClientWindow(0);
    sqlCarimbo.Close;
  Except

  end;
end;

procedure TfmeImagem.btnCarimboClick(Sender: TObject);
begin
  {Habilita a inser��o de carimbo na imagem}
  if not vg_hbltImagem then
  begin
    spbPreviewWidthClick(nil);//Volta a imagem para o tamanho da tela de exibi��o
    vg_hbltImagem  := True;
    vg_hbltCarimbo := True;
    if (curLayer = 0) then
    begin
      Notate1.SetClientWindow(Xpress1.hWnd);
      if curLayer = 0 Then Notate1.CreateLayer;
      if (curLayer <> 0) then
      begin
         Notate1.SetToolPaletteVisible (curLayer, False);
         if (Notate1.GrpGetFirstGroupID(curLayer) = 0) Then
            Notate1.GrpCreateGroup(curLayer, '', 0);
      end;
    end;
    btnCarimbo.Flat := False;
    pnlCarimbo.Visible := True;
    lcbCarimbo.SetFocus;
    spbPreviewWhole.Enabled      := False;
    spbPreview100Percent.Enabled := False;
    pnlTextoCarimbo.Visible := True;
    //cxSplitter1.CloseSplitter;
    cxSplitter1.Visible := True;
    Xpress1.MousePointer := MP_BPush;
  end
  else
  begin
    vg_hbltImagem := False;
    btnCarimbo.Flat := True;
    pnlCarimbo.Visible := False;
    spbPreviewWhole.Enabled      := True;
    spbPreview100Percent.Enabled := True;
    pnlTextoCarimbo.Visible := False;
    cxSplitter1.Visible := False;
    Xpress1.MousePointer := MP_Arrow;
  end;
end;

procedure TfmeImagem.CarregarNumeroImagens;
var i : Integer;
begin
  {Carrega para o combobox o n�mero de imagen que o arquivo contem}
  cbxPaginas.Properties.Items.Clear;
  for i := 1 to Xpress1.Pages do
      cbxPaginas.Properties.Items.Add(IntToStr(i));
end;

procedure TfmeImagem.Xpress1Click(Sender: TObject);
var
  e, X, Y : Integer;
begin
  {Insere a imagem de carimbo na posi��o indicada pelo cursor do mouse}
  if vg_hbltImagem then
  begin
    if (lcbCarimbo.EditValue = null) and pnlCarimbo.Visible then
    begin
      Application.MessageBox('Nenhum carimbo foi selecionado!', 'Aten��o', MB_OK +  MB_ICONWARNING);
      Exit;
    end;

    if vg_hbltCarimbo then
    begin
      if (Trim(fmeEditorSimples1.wptTexto.Text) <> '') then
      begin
        Application.ProcessMessages;
        RotinasImagem.ConvertTextToJpeg(fmeEditorSimples1.wptTexto, vg_DiretorioAuxiliar + '\Carimbo.tif');
        pnlCarimbo.Visible := False;
      end
      else
      begin
        Application.MessageBox('Nenhum carimbo foi selecionado!', 'Aten��o', MB_OK +  MB_ICONWARNING);
        vg_hbltImagem := False;
        btnCarimbo.Flat := True;
        pnlCarimbo.Visible := False;
        Xpress1.MousePointer := MP_Arrow;
        Abort;
      end;
    end;

    IXDibLoader.Filename := vg_DiretorioAuxiliar + '\Carimbo.tif';

    //Determina a posi��o central para ser inserida a imagem de carimbo
    X := Trunc((Xpress1.ScrollX + vg_PosInic.X) / Xpress1.IPZoomF);
    Y := Trunc((Xpress1.ScrollY + vg_PosInic.Y) / Xpress1.IPZoomF);

    //Cria imag em de carimbo
    e := Notate1.ElementCreate;
    Notate1.ElementSetType(e, ImageTool);
    Notate1.ElementSetDIBHandle(e, IXDibLoader.CopyDib);
    Notate1.ElementSetBoundingRect(e, X , Y , X + Trunc(IXDibLoader.IWidth), Y + Trunc(IXDibLoader.IHeight));
    Notate1.ElementSetPenColor(e, clBlack);
    Notate1.ElementSetPenWidth(e, vg_BordaCarimbo);
    Notate1.ElementSetBackstyle(e, vg_EstiloCarimbo);
    Notate1.ElementAppend(e);
    Notate1.ElementDestroy(e);
    btnCarimboClick(nil);
  end
  else
  if pnlLembrete.Visible and (Xpress1.MousePointer = MP_BPush) then
  begin
    if Trim(edtLembrete.Text) <> '' then
    begin
      InsereObjetoTexto;
      btnSalvar.Enabled := True;
      Xpress1.MousePointer := MP_Arrow;
    end
    else
    begin
      Application.MessageBox(PChar('N�o h� texto para este lembrete!' + #13#10 + 'Preencha o campo lembrete antes de tentar inserer.'), 'Aten��o', MB_OK + MB_ICONWARNING);
      edtLembrete.SetFocus;
    end;
  end;

end;

procedure TfmeImagem.Xpress1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if Xpress1.MousePointer = MP_CHand2 then
    if vg_Capturando then
    begin
      With Xpress1 do
      begin
        ScrollX := ScrollX  + (vg_PosInic.X - X);
        ScrollY := ScrollY  + (vg_PosInic.Y - Y);
      end;
    end;
end;

procedure TfmeImagem.btnDigitalizarClick(Sender: TObject);
begin
  //Controla N� paginas digitalizadas
  if vgControleNumeroPagina then
    if vg_NumeroPaginas <= Xpress1.Pages then
    begin
      Application.MessageBox('N�mero de p�ginas digitalizadas igual ou maior que n�mero de paginas informadas!', 'Aten��o', MB_OK + MB_ICONWARNING);
      Exit;
    end;
    
  if Xpress1.Pages = 0 then
    DeleteFile(vg_ArquivoImagem);
  Xpress1.SaveMultiPage := True;
  vg_NumImagem := Xpress1.Pages;
  InicializarSessao;
end;

procedure TfmeImagem.AtualizaImagem(Arquivo : String);
begin
  //Inseri a imagem
  DeleteFile(Arquivo);
  Xpress1.SaveFileName :=Arquivo;
  Xpress1.PageNbr := 1;

  if (not vlImagemColorida) then
  begin
    Xpress1.SaveFileType := FT_TIFF_G4;
    Xpress1.SaveTIFFCompression := TIFF_CCITTFAX4
  end
  else
  begin
    Xpress1.SaveJPEGLumFactor   := 50;
    Xpress1.SaveJPEGChromFactor := 50;
    Xpress1.SaveFileType := FT_TIFF_JPEG;
    Xpress1.SaveTIFFCompression := FT_TIFF_JPEG;
  end;

  Xpress1.SaveFile;
  Application.ProcessMessages;
  Xpress1.InsertPage(Arquivo, vg_ArquivoImagem, vg_NumImagem);
  Xpress1.DeletePage(vg_ArquivoImagem, vg_NumImagem + 1);

  //Comprime o arquivo das imagens
  Xpress1.CompressInMemory;
  Xpress1.CompactFile(vg_ArquivoImagem, vg_DiretorioAuxiliar + '\IMA.TIF');
  Application.ProcessMessages;

  if not CopyFile(Pchar(vg_DiretorioAuxiliar + '\IMA.TIF'), Pchar(vg_ArquivoImagem), FALSE) then
    ShowMessage('Erro, n�o foi possivel copiar a imagem!');

  Application.ProcessMessages;
end;

function TfmeImagem.BitsPerPixelBrand: Integer;
begin
  Result := IfThen(
    vlImagemColorida,
    24,
    4);
end;

procedure TfmeImagem.btnRecortarImagemClick(Sender: TObject);
var
  e,X,Y,
  l,t,r,b : Integer;
  viArquivo : String;
begin
  ValidaExisteImagem;
  if (curIDRectangle = 0) then
  begin
    if (curLayer = 0) then
    begin
      Notate1.SetClientWindow(Xpress1.hWnd);
      if curLayer = 0 Then Notate1.CreateLayer;
      if (curLayer <> 0) then
      begin
         Notate1.SetToolPaletteVisible (curLayer, False);
         if (Notate1.GrpGetFirstGroupID(curLayer) = 0) Then
            Notate1.GrpCreateGroup(curLayer, '', 0);
      end;
    end;

    X := Trunc((Xpress1.ScrollX + 1) / Xpress1.IPZoomF);
    Y := Trunc((Xpress1.ScrollY + 1) / Xpress1.IPZoomF);

    e := Notate1.ElementCreate;
    Notate1.ElementSetType(e, RectangleTool);
    Notate1.ElementSetBoundingRect(e, X, Y, X + 1280, Y + 300);
    Notate1.ElementSetBackstyle(e, NXP_TRANSPARENT );
    Notate1.ElementSetPenWidth(e, 1);

    curIDRectangle := Notate1.ElementAppend(e);

    Notate1.ElementDestroy(e);
  end
  else
  begin
    try
      Notate1.PrgGetItemRect(curLayer,curIDRectangle,l,t,r,b);

      if l < 0 then  l := 0;
      if r > Xpress1.IWidth then r := Xpress1.IWidth;
      if t < 0 then  t := 0;
      if b > Xpress1.IHeight then b := Xpress1.IHeight;

      Xpress1.Crop(l,t,r-l,b-t);

      //Delata os layers
      if (curLayer <> 0) and (curIDRectangle <> 0) then
        Notate1.PrgDeleteItem(curLayer,curIDRectangle);

      viArquivo := vg_DiretorioAuxiliar + '\IMA.TIF';
      DeleteFile(viArquivo);

      Notate1.SaveAnnotations := True;
      Notate1.PreserveWTLayers:= True;
      Xpress1.SaveMultiPage   := false;
      Xpress1.SaveFileName    := viArquivo;
      if (not vlImagemColorida) then
      begin
        Xpress1.SaveFileType := FT_TIFF_G4;
        Xpress1.SaveTIFFCompression := TIFF_CCITTFAX4
      end
      else
      begin
        Xpress1.SaveJPEGLumFactor   := 50;
        Xpress1.SaveJPEGChromFactor := 50;
        Xpress1.SaveFileType := FT_TIFF_JPEG;
        Xpress1.SaveTIFFCompression := TIFF_JPEG;
      end;
      Xpress1.SaveFile;

      Xpress1.InsertPage(viArquivo, vg_ArquivoImagem, vg_NumImagem + 1);
      Xpress1.DeletePage(vg_ArquivoImagem, vg_NumImagem);

      DeleteFile(viArquivo);

      //Comprime o arquivo das imagens
      Xpress1.CompressInMemory;
      Xpress1.CompactFile(vg_ArquivoImagem, viArquivo);
      if not CopyFile(Pchar(viArquivo), Pchar(vg_ArquivoImagem), False) then
        ShowMessage('Erro, n�o foi possivel salvar a imagem!');

      PegaImagem;
      vg_Imagem_Alterada := True;
    finally

    end;
    curIDRectangle := 0;
  end;
end;

procedure TfmeImagem.btnRedigitalizarClick(Sender: TObject);
begin
  if Xpress1.Pages = 0 then
  begin
    Application.MessageBox('Esta rotina n�o pode ser executada, pois n�o existe nenhuma imagem selecionada para redigitalizar!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  if Application.MessageBox(PWideChar('Est� rotina exclu�ra apenas a p�gina atual e substituir� pela nova digitaliza��o.' + #13#10 +
                                      'Deseja continuar com est� opera��o?'), 'Aten��o',
                                      MB_YESNO + MB_ICONWARNING) = IDNO then
    Exit;

  Xpress1.SaveMultiPage := False;
  InicializarSessao;
end;

procedure TfmeImagem.CarregaPaginas;
var
  NomeArquivo,
  viNumero : String;
begin
  curIDRectangle := 0;
  {Gera um arquivo unico com todas a imagens a serem exibidas}
  if vg_NomeArquivo <> '' then
  begin
    NomeArquivo := GetNomeArquivo(vg_NomeArquivo);
    ExibirFichaLado(NomeArquivo[1] = 'F');

    //Validas nome do arquivo no sistema
    viNumero := RetornaNumerico(NomeArquivo);
    if viNumero <> '' then
      if StrToInt(viNumero) = 0 then
      begin
        Application.MessageBox('Aten��o nome do arquivo fora do padr�o, entrar em contato com o suporte!', 'Aten��o', MB_OK + MB_ICONERROR);
        vg_NomeArquivo := '';
      end;
  end;

  if FileExists(vg_NomeArquivo) then
  begin
    imgControle.Visible := False;
    vg_Imagem_Alterada  := False;

    vg_LetraMatricula := NomeArquivo[11];
    if vg_LetraMatricula = '#' then
       vg_LetraMatricula := '';
    vg_NumeroMatricula := RetornaNumerico(copy(NomeArquivo, Pos_N('_', NomeArquivo, 2) + 1, 7));

    //SetarAtributosArquivo(vg_NomeArquivo, False, False, False, False);

    if not CopyFile(PChar(vg_NomeArquivo), PChar(vg_ArquivoImagem), false) then
      ShowMessage('Erro, n�o foi possivel copiar a imagem!');

    Application.ProcessMessages;
    //CarregarNumeroImagens;//Carrega o n�mero de imagens para o combobox
    btnImprimir.Enabled := True;
    btnPdf.Enabled := True;
    if Tag = 0 then
    begin
      btnCarimbo.Visible  := True;
      btnBrand.Visible    := True;
      btnLembrete.Visible := True;
      if vg_hbltImagem then
        btnCarimboClick(nil);
      lcbCarimbo.EditValue := Null;
    end;

    btnPrimeiroClick(nil);

    if FileExists(vg_ArquivoHistorico) then
      DeleteFile(vg_ArquivoHistorico);
  end
  else
  begin
    DeleteFile(vg_ArquivoImagem);
    Xpress1.FileName    := '';
    imgControle.Visible := True;
    btnImprimir.Enabled := False;
    btnPdf.Enabled      := False;
    btnAnterior.Enabled := False;
    btnPrimeiro.Enabled := False;
    btnProximo.Enabled  := False;
    btnUltimo.Enabled   := False;
    btnCarimbo.Visible  := False;
    btnLembrete.Visible := False;
    btnBrand.Visible    := False;
    cbxPaginas.Properties.Items.Clear;
    if vg_hbltImagem then
      btnCarimboClick(nil);
  end;

end;

procedure TfmeImagem.LimparCampos;
begin
  icxGrupo.ItemIndex := -1;
  lcxTipo.Clear;
  edtNumero.Clear;
  edtLetra.Clear;
end;

procedure TfmeImagem.edtNumeroKeyPress(Sender: TObject; var Key: Char);
begin
  DigitaInteiro(Key);
end;

procedure TfmeImagem.btnCancelarClick(Sender: TObject);
begin
  btnIndexar.Visible := True;
  pnlDados.Visible    := False;
  btnCancelar.Visible      := pnlDados.Visible;
  btnDigitalizar.Enabled   := not pnlDados.Visible;
  btnRedigitalizar.Enabled := btnDigitalizar.Enabled;
  pnlImpressao.Visible     := False;
end;

procedure TfmeImagem.ValidaExisteImagem;
begin
  if Xpress1.Pages = 0 then
  begin
    Application.MessageBox('N�o existe imagem!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;
end;

procedure TfmeImagem.Validar;
begin
  if Trim(icxGrupo.Text) = '' then
  begin
    Application.MessageBox('Grupo deve ser informado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    icxGrupo.SetFocus;
    Abort;
  end;

  if Trim(lcxTipo.Text) = '' then
  begin
    Application.MessageBox('Tipo deve ser informado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    lcxTipo.SetFocus;
    Abort;
  end;

  if Trim(edtNumero.Text) = '' then
  begin
    Application.MessageBox('N�mero deve ser informado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtNumero.SetFocus;
    Exit;
  end;
end;

function TfmeImagem.ValidarImagem : Boolean;
begin
  Result := True;
  if vg_Imagem_Alterada then
    if Application.MessageBox(PWideChar('Imagem alterada e n�o salva!' +#13#10 +
                                        'Deseja continuar mesmo assim?'), 'Aten��o', MB_YESNO + MB_ICONWARNING) = IDNO then
      Result := False
    else
      vg_Imagem_Alterada := False;
end;

procedure TfmeImagem.Imprimir(Tipo : Byte);
var i,
    NPagina,
    ICabecalho,
    IRodape,
    viPagIni, viPagAux : Integer;
    viPrinter, viFrenteVerso : Boolean;

  {Adiciona o cabe�alho a imagem a ser impressa}
  procedure ImpCabecalho;
  begin
    //Montar Cabe�alho para impress�o
    PrintPRO1.Picture := Image1.Picture;
    PrintPRO1.PrintPicture(vg_LMargem, 0, (vg_WPagina - vg_LMargem - 1), vg_TMargemCabecalho, 0, 0, 0, 0, false);
  end;

  {Adiciona o rodap� a imagem a ser impressa}
  procedure ImpRodape;
  begin
    //Montar Cabe�alho para impress�o
    PrintPRO1.Picture := Image2.Picture;
    PrintPRO1.PrintPicture(vg_LMargem, vg_HPagina - (vg_TMargemRodape + 1), (vg_WPagina - vg_LMargem - 1), vg_TMargemRodape, 0, 0, 0, 0, false)
  end;

  function getImpCabRod(vfTipo : integer) : Boolean;
  begin
    Result := False;
    case vfTipo of
      1: Result := True;  //todas as p�ginas
      2: Result := (i mod 2 = 0); //apenas nas p�ginas pares
      3: Result := (i mod 2 <> 0);//apenas nas p�ginas Impares
      4: Result := i = 1; //apenas nas primeira p�ginas
      5: Result := (i = NPagina);//apenas nas primeira p�ginas
    end;
  end;

  procedure Cabecalho;
  begin
    if getImpCabRod(ICabecalho) then
    begin
      ImpCabecalho;
      viPrinter := False;
    end;
  end;

  procedure Rodape;
  begin
    if getImpCabRod(IRodape) then
    begin
      ImpRodape;
      viPrinter := False;
    end;
  end;

  procedure Qualificar;
  begin
    if vgQualificar.StlLista <> nil then
       FreeAndNil(vgQualificar.StlLista);

    vgQualificar.StlLista := TStringList.Create;
    try
      vgQualificar.StlLista.Add('IMAGEM_VALOR1='+vg_Imagem.Valor1);
      vgQualificar.StlLista.Add('IMAGEM_VALOR2='+vg_Imagem.Valor2);
      vgQualificar.StlLista.Add('IMAGEM_VALOR3='+vg_Imagem.Valor3);
      vgQualificar.StlLista.Add('IMAGEM_VALOR4='+vg_Imagem.Valor4);
      vgQualificar.StlLista.Add('IMAGEM_VALOR5='+vg_Imagem.Valor5);
      vgQualificar.StlLista.Add('IMAGEM_VALOR6='+vg_Imagem.Valor6);
      vgQualificar.StlLista.Add('IMAGEM_VALOR7='+vg_Imagem.Valor7);
      vgQualificar.StlLista.Add('IMAGEM_VALOR8='+vg_Imagem.Valor8);
      vgQualificar.StlLista.Add('IMAGEM_VALOR9='+vg_Imagem.Valor9);
      vgQualificar.StlLista.Add('IMAGEM_VALOR10='+vg_Imagem.Valor10);
      vgQualificar.StlLista.Add('IMAGEM_VALOR11='+vg_Imagem.Valor11);
      vgQualificar.StlLista.Add('IMAGEM_VALOR12='+vg_Imagem.Valor12);
      vgQualificar.StlLista.Add('IMAGEM_VALOR13='+vg_Imagem.Valor13);
      vgQualificar.StlLista.Add('IMAGEM_PAGINA='+vg_Imagem.Pagina);
      vgQualificar.StlLista.Add('PAGINA_ATUAL='+vg_Imagem.Folha);
      vgQualificar.StlLista.Add('DATA_ATUAL='+dtmControles.DataHoraBanco(4));
      vgQualificar.StlLista.Add('SELO_AGRUPADOR='+vg_Imagem.SeloAgrupador);

      PrepararQualificarPadrao(fmeEditorSimples1.wptTexto,'',True, False, True);
      fmeEditorSimples1.wptTexto.SelectAll;
  //    RedefinirPadraoFonte(fmeEditorSimples1.wptTexto);
    finally
      FreeAndNil(vgQualificar.StlLista);
    end;

  end;

  procedure MontarCabecalho;
  begin
    if (strtoint(vg_Imagem.Folha) > 1) and (vg_CabecalhoDiferente) and (vg_Cabecalho.Cabecalho2 <> '') then
    begin
      fmeEditorSimples1.wptTexto.AsString := DeCompressString(dtmControles.BuscarConfig('EDITOR', 'CABECALHO', 'CABECALHO_MODELO'+vg_Cabecalho.Cabecalho2, 'T'));
      vg_TMargemCabecalho := dtmControles.BuscarConfig('IMAGEM', 'CABECALHO', 'TAMANHO_CAB2_'+vg_Imagem.TipoImpressao, 'D');
    end
    else
    begin
      if (vg_Imagem.LadoInicial = 'F') or (vg_Imagem.LadoInicial = '') and (vg_Cabecalho.Cabecalho1 <> '')  then
           fmeEditorSimples1.wptTexto.AsString := DeCompressString(dtmControles.BuscarConfig('EDITOR', 'CABECALHO', 'CABECALHO_MODELO'+vg_Cabecalho.Cabecalho1, 'T'))
      else
      if (vg_Cabecalho.Cabecalho2 <> '') then
        fmeEditorSimples1.wptTexto.AsString := DeCompressString(dtmControles.BuscarConfig('EDITOR', 'CABECALHO', 'CABECALHO_MODELO'+vg_Cabecalho.Cabecalho2, 'T'));

      if (vg_Imagem.TipoImpressao <> '') then
        vg_TMargemCabecalho := dtmControles.BuscarConfig('IMAGEM', 'CABECALHO', 'TAMANHO_CAB1_'+vg_Imagem.TipoImpressao, 'D');
    end;

    if vg_Qualifica then
      Qualificar;

    if Trim(fmeEditorSimples1.wptTexto.Text) <> '' then
    begin
      RotinasImagem.ConvertTextToJpeg(fmeEditorSimples1.wptTexto, vg_DiretorioAuxiliar + '\cabecalho.bmp',2);
      if FileExists(vg_DiretorioAuxiliar + '\cabecalho.bmp') then
        Image1.Picture.LoadFromFile(vg_DiretorioAuxiliar + '\cabecalho.bmp');
    end;
  end;

  procedure MontarRodape;
  begin
    if (strtoint(vg_Imagem.Folha) = NPagina) and (vg_RodapeDiferenteUtlPag) and (vg_Cabecalho.Rodape2 <> '') then
    begin
      fmeEditorSimples1.wptTexto.AsString := DeCompressString(dtmControles.BuscarConfig('EDITOR', 'CABECALHO', 'RODAPE_MODELO'+vg_Cabecalho.Rodape2, 'T'));
      vg_TMargemRodape := dtmControles.BuscarConfig('IMAGEM', 'RODAPE', 'TAMANHO_RODAPE2', 'D');
    end
    else
    begin
      if (vg_Imagem.LadoInicial = 'F') or (vg_Imagem.LadoInicial = '') and (vg_Cabecalho.Rodape1 <> '') then
           fmeEditorSimples1.wptTexto.AsString := DeCompressString(dtmControles.BuscarConfig('EDITOR', 'CABECALHO', 'RODAPE_MODELO'+vg_Cabecalho.Rodape1, 'T'))
      else
      if vg_Cabecalho.Rodape2 <> '' then
        fmeEditorSimples1.wptTexto.AsString := DeCompressString(dtmControles.BuscarConfig('EDITOR', 'CABECALHO', 'RODAPE_MODELO'+vg_Cabecalho.Rodape2, 'T'));

      vg_TMargemRodape := dtmControles.BuscarConfig('IMAGEM', 'RODAPE', 'TAMANHO_RODAPE', 'D');
    end;

    if vg_Qualifica then
      Qualificar;

    if Trim(fmeEditorSimples1.wptTexto.Text) <> '' then
    begin
      RotinasImagem.ConvertTextToJpeg(fmeEditorSimples1.wptTexto, vg_DiretorioAuxiliar + '\rodape.bmp',2);
      if FileExists(vg_DiretorioAuxiliar + '\rodape.bmp') then
        Image2.Picture.LoadFromFile(vg_DiretorioAuxiliar + '\rodape.bmp');
    end;
  end;

  {Monta impress�o}
  procedure MontarImpressao(NPag : Integer);
  begin
    //Monta a imagem para impress�o
    Xpress1.PageNbr := NPag;
    Xpress1.FileName := vg_ArquivoImagem;

    //Delata os layers (Lembretes)
    if (curLayer <> 0) then
    begin
      Notate1.Brand(BitsPerPixelBrand);
      Notate1.DeleteLayer(curLayer);
      vg_Activated := False;
    end;

    //Xpress1.CropBorder(0.9, 2);
    PrintPRO1.hDib := Xpress1.hDib;
    {Controle do Cabe�alho/Rodap�:
     0 - Nenhuma P�gina
     1 - Todas as P�ginas
     2 - P�ginas Pares
     3 - P�ginas Impares
     4 - Primeiras P�ginas
     5 - Ultimas P�ginas}

    viPrinter := True;
    if (ICabecalho = 0) and (IRodape = 0) then
      PrintPRO1.PrintDIB(vg_LMargem , 0, vg_WPagina - (vg_LMargem + 1), vg_HPagina - 1, 0, 0, 0, 0, vg_aspecto)
    else
    if getImpCabRod(ICabecalho) and getImpCabRod(IRodape) then
    begin
      MontarCabecalho;
      MontarRodape;
      PrintPRO1.PrintDIB(vg_LMargem , vg_TMargemCabecalho - vg_SobreMargemCabecalho, vg_WPagina - (vg_LMargem + 1), vg_HPagina - (vg_TMargemCabecalho + vg_TMargemRodape + 1), 0, 0, 0, 0, vg_aspecto);
      Cabecalho;
      Rodape;
      if viPrinter then
        PrintPRO1.PrintDIB(vg_LMargem , 0, vg_WPagina - (vg_LMargem + 1), vg_HPagina - 1, 0, 0, 0, 0, vg_aspecto);
    end
    else
    if (ICabecalho > 0) then
    begin
      MontarCabecalho;
      PrintPRO1.PrintDIB(vg_LMargem , vg_TMargemCabecalho - vg_SobreMargemCabecalho, vg_WPagina - (vg_LMargem + 1), vg_HPagina - (vg_TMargemCabecalho - vg_SobreMargemCabecalho + 1), 0, 0, 0, 0, vg_aspecto);
      Cabecalho;
      if viPrinter then
        PrintPRO1.PrintDIB(vg_LMargem , 0, vg_WPagina - (vg_LMargem + 1), vg_HPagina - 1, 0, 0, 0, 0, vg_aspecto);
    end
    else
    if (IRodape > 0) then
    begin
      MontarRodape;
      PrintPRO1.PrintDIB(vg_LMargem , 0, vg_WPagina - (vg_LMargem + 1), vg_HPagina - (vg_TMargemRodape + 1), 0, 0, 0, 0, vg_aspecto);
      Rodape;
      if viPrinter then
        PrintPRO1.PrintDIB(vg_LMargem , 0, vg_WPagina - (vg_LMargem + 1), vg_HPagina - 1, 0, 0, 0, 0, vg_aspecto);
    end;

    //Cria uma nova p�gina para impress�o
    if (i <> NPagina) and (Tipo in [1,3])  then
       PrintPRO1.NewPage;
  end;

begin
  viPagIni := 0;
  PrintPRO1.PrintError := 0;
  PrintPRO1.TMargin := 0;
  PrintPRO1.Lmargin := 0;
  PrintPRO1.ScaleMode := SCALE_Centimeter;//Escala de imagem em Centimetros
  PrintPRO1.OutputFileName := '';
  PrintPRO1.PrintToFile := False;
  PrintPRO1.PaperSize := vg_PaperSize;

  ICabecalho := vg_ImprimirCabecalho; //Controla impress�o de Cabe�alhos
  IRodape    := vg_ImprimirRodape; //Controla impress�o de Cabe�alhos
  vg_WPagina := Round(PrintPRO1.ScaleWidth); //Largura da p�gina
  vg_HPagina := Round(PrintPRO1.ScaleHeight); //Altura da p�gina
  NPagina    := Xpress1.Pages; //N�mero de Paginas

  if vg_SolicitarPrint then
    PrintPRO1.PrintDialog; //Escolher a Impressoara

  {Inicio da montagem do arquivo para impress�o}
  try
    If PrintPRO1.PrintError <> 0 Then
      Exit;
  except
    Application.MessageBox('Erro de impressora, fovor verificar as configura��es da mesma!', 'Aten��o', MB_ICONERROR + MB_OK);
    Exit;
  end;

  Screen.Cursor := crHourGlass;

  PrintPRO1.StartPrintDoc;
  Application.ProcessMessages;

  try
    if tipo = 1 then
      viPagIni := 1
    else
      if tipo = 3 then
      begin
        viPagIni := spnPagInicial.EditValue;
        NPagina  := spnPagFinal.EditValue;
      end;

    if vg_Imagem.Pagina <> '' then
         viPagAux := StrToInt(vg_Imagem.Pagina)-1
    else viPagAux := 0;

    viFrenteVerso := vg_Imagem.LadoInicial <> '';
    if Tipo in [1,3] then
      for i := viPagIni to NPagina do
      begin
        if (not viFrenteVerso) or (i = viPagIni) then
          Inc(viPagAux)
        else
        begin
          if vg_Imagem.LadoInicial = 'V' then
          begin
            Inc(viPagAux);
            vg_Imagem.LadoInicial := 'F';
          end
          else vg_Imagem.LadoInicial := 'V';
        end;

        if (vg_Imagem.Livro2Numero <> '') and (viPagAux > StrToInt(vg_Imagem.PaginaFim)) then
        begin
          viPagAux          := StrToInt(vg_Imagem.Pagina2Inicio);
          vg_Imagem.Valor4  := vg_Imagem.Valor1 + '-'+ vg_Imagem.Livro2Numero + vg_Imagem.LivroLetra;

          if viFrenteVerso then
            vg_Imagem.LadoInicial := 'F';
        end;

        if viFrenteVerso then
          if vg_Imagem.LadoInicial = 'F' then
               vg_LMargem := vg_LMargemFrente
          else vg_LMargem := vg_LMargemVerso;

        vg_Imagem.Pagina  := IntToStr(viPagAux)+vg_Imagem.LadoInicial;
        vg_Imagem.Folha   := IntToStr(i);
        MontarImpressao(i);
      end
    else
    begin
      vg_Imagem.Folha := IntToStr(Xpress1.PageNbr);
      if vg_Imagem.Pagina <> '' then
        vg_Imagem.Pagina := IntToStr((StrToInt(vg_Imagem.Pagina)+Xpress1.PageNbr)-1);
      MontarImpressao(Xpress1.PageNbr);
    end;
  finally
    PrintPRO1.EndPrintDoc;
    vgImagemImpressa := True;
    Screen.Cursor := crDefault;
  end;

  btnPrimeiroClick(nil);
end;

procedure TfmeImagem.btnImportarClick(Sender: TObject);
{$REGION 'Vari�veis'}
var
  i: Integer;
  Xp : TImagXpress;
  viExtArquivo,
  viNomeArquivo : String;
  viCaminhoArquivo: string;
{$ENDREGION}
begin
  if OpenPictureDialog.Execute then
  begin
    vg_NumImagem := Xpress1.Pages;

    for viCaminhoArquivo in OpenPictureDialog.Files do
    begin
      viExtArquivo := GetExtArquivo(viCaminhoArquivo);
      if UpperCase(viExtArquivo) = 'PDF' then
      begin
        viNomeArquivo := 'c:\Temp\ImgTemp.tiff';
        dtmControles.ConverterPdfToTiff(viCaminhoArquivo, viNomeArquivo)
      end
      else
        viNomeArquivo := viCaminhoArquivo;

      Xp := TImagXpress.Create(Xpress1);

      try
        Xp.SaveMultiPage := vg_NumImagem > 0;
        Xp.FileName := viNomeArquivo;

        if (not vlImagemColorida) then
        begin
          Xp.SaveFileType := FT_TIFF_G4;
          Xp.SaveTIFFCompression := TIFF_CCITTFAX4
        end
        else
        begin
          Xp.SaveJPEGLumFactor   := 50;
          Xp.SaveJPEGChromFactor := 50;
          Xp.SaveFileType := FT_TIFF_JPEG;
          Xp.SaveTIFFCompression := TIFF_JPEG;
        end;

        ProgressBar.Position       := 0;
        ProgressBar.Properties.Max := Xp.Pages;

        for i := 1 to Xp.Pages do
        begin
          ProgressBar.Position := i;
          Application.ProcessMessages;

          Xp.PageNbr := i;
          Xp.FileName := viNomeArquivo;
          Xp.SaveFileName := vg_ArquivoImagem;
          Xp.SaveFile;
          Xp.SaveMultiPage := True;
        end;
      finally
        FreeAndNil(Xp);
      end;

      Inc(vg_NumImagem);
      PegaImagem;
      imgControle.Visible := False;
      vg_Imagem_Alterada := True;

      ProgressBar.Position := 0;
      pagControle.ActivePage := tbsGeral;
    end;

    TrimAppMemorySize;
  end;
end;

procedure TfmeImagem.btnImprimirClick(Sender: TObject);
begin
  ValidaExisteImagem;
  vg_SolicitarPrint          := True;
  pnlImpressao.Visible       := True;
  cbxTipoImpressao.EditValue := 1;
  spnPagInicial.EditValue    := 1;
  spnPagFinal.EditValue      := 1;
end;

procedure TfmeImagem.Xpress1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then
  begin
    //Welber 11/04/2008
    if (Notate1.CurrentLayer <> 0) then
    begin
      Notate1.DeleteSelected;
      curIDRectangle := 0;
      if not vg_hbltImagem then
        btnSalvarClick(Self);
    end;
    //final welber
  end
  else
  if Key = VK_F12 then
  begin
    if vgTwainPadrao then
    begin
      try
        TwainPRO.CloseSession;
        TwainPRO.SelectSource;
      except

      end;
    end;
  end;
end;

procedure TfmeImagem.icxGrupoPropertiesChange(Sender: TObject);
begin
  sqlIndexacaoTipo.Connection := dtmControles.DB;
  sqlIndexacaoTipo.Close;
  sqlIndexacaoTipo.Params[0].AsInteger := vgId;
  sqlIndexacaoTipo.Params[1].Value  := icxGrupo.EditValue;
  sqlIndexacaoTipo.Open;

  edtLetra.Visible := icxGrupo.Text = 'Ficha';
  Label4.Visible   := edtLetra.Visible;
end;

procedure TfmeImagem.btnIndexarClick(Sender: TObject);
begin
  LimparCampos;
  btnIndexar.Visible := False;
  pnlDados.Visible  := True;

  btnCancelar.Visible      := pnlDados.Visible;
  btnDigitalizar.Enabled   := not pnlDados.Visible;
  btnRedigitalizar.Enabled := btnDigitalizar.Enabled;

end;

procedure TfmeImagem.cbxPaginasPropertiesChange(Sender: TObject);
begin
  {Exibe a imagem selecionada no combobox}
  if (Trim(cbxPaginas.Text) <> '') and (cbxPaginas.Tag = 0) then
  begin
    vg_NumImagem := StrToInt(cbxPaginas.Text);
    PegaImagem;
  end;
end;

procedure TfmeImagem.TrocarPosicaoImagem;
var Arquivo, Valor : String;
    Posicao : Integer;
begin
  ValidaExisteImagem;
  Posicao := 0;
  valor := InputBox('Mover imagem para', 'Posi��o:', '');
  if Trim(Valor) <> '' then
  begin
     try
       Posicao := StrToInt(Valor);
     except
       Application.MessageBox('Valor informado n�o � valido!', 'Aten��o', MB_OK + MB_ICONWARNING);
       Abort;
     end;
  end
  else Abort;

  if  (Posicao > Xpress1.Pages) or (Posicao < 1) then
  begin
    Application.MessageBox('Posi��o a ser movida n�o � valida!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  // Pagina em Branco {Atualizacao}
  Xpress1.SaveMultiPage := False;

  //Inseri a imagem na posi��o indicada
  Arquivo :=  vg_DiretorioAuxiliar + '\IMA.TIF';
  Xpress1.SaveFileName :=Arquivo;
  Xpress1.PageNbr := vg_NumImagem;

  if (not vlImagemColorida) then
  begin
    Xpress1.SaveFileType := FT_TIFF_G4;
    Xpress1.SaveTIFFCompression := TIFF_CCITTFAX4
  end
  else
  begin
    Xpress1.SaveJPEGLumFactor   := 50;
    Xpress1.SaveJPEGChromFactor := 50;
    Xpress1.SaveFileType := FT_TIFF_JPEG;
    Xpress1.SaveTIFFCompression := TIFF_JPEG;
  end;

  Xpress1.SaveFile;
  Xpress1.DeletePage(vg_ArquivoImagem, vg_NumImagem);
  Xpress1.InsertPage(Arquivo, vg_ArquivoImagem, Posicao);

  //Comprime o arquivo das imagens
  Xpress1.CompressInMemory;
  Xpress1.CompactFile(vg_ArquivoImagem, Arquivo);

  if not CopyFile(Pchar(Arquivo), Pchar(vg_ArquivoImagem), FALSE) then
    ShowMessage('Erro, n�o foi possivel copiar a imagem!');

  Application.ProcessMessages;
  vg_NumImagem := Posicao;
  PegaImagem;
  vg_Imagem_Alterada := True;
  Application.MessageBox('Posi��o modifica com sucesso!', 'Aten��o', MB_OK + MB_ICONWARNING);
end;

procedure TfmeImagem.ExibirFichaLado(Valor: Boolean);
begin
  vg_ExibirFicha := Valor;
  vg_ExibirFichaMostrarImagem := Valor;
  if Valor then
     Panel3.Left := stxFichaLado.Left + stxFichaLado.Width + 1
  else Panel3.Left := stxFichaLado.Left;
end;

procedure TfmeImagem.Xpress1DblClick(Sender: TObject);
begin
  vg_NumeroImagemAtual := vg_NumImagem;
  if frmMostrarImagem = nil then
    Application.CreateForm(TfrmMostrarImagem, frmMostrarImagem);

  frmMostrarImagem.vg_ArquivoImagem := vg_ArquivoImagem;
  frmMostrarImagem.Show;
end;

procedure TfmeImagem.lcbCarimboPropertiesEditValueChanged(Sender: TObject);
begin
  if lcbCarimbo.EditValue <> Null then
  begin
    fmeEditorSimples1.wptTexto.AsString := DeCompressString(sqlCarimboTEXTO.AsString);
    PrepararQualificarPadrao(fmeEditorSimples1.wptTexto, '', False, False, False);
  end
  else fmeEditorSimples1.wptTexto.AsString := '';

end;

procedure TfmeImagem.btnPdfClick(Sender: TObject);
begin
  ValidaExisteImagem;

  with CreateMessageDialog('P�ginas a serem geradas em PDF?', mtConfirmation, [mbYes, MbNo, mbCancel]) do
  begin
    vgPrintPDF := True;
    Caption := 'Impress�o';
    (FindComponent('YES') as TButton).Caption := 'Todas';
    (FindComponent('NO') as TButton).Caption := 'Atual';
    (FindComponent('CANCEL') as TButton).Caption := 'Cancelar';
    ShowModal;
    try
      if (ModalResult = mrYes) then
         GerarPDF(1)
      else if(ModalResult = mrNo) then
             GerarPDF(0);
    except
      ShowMessage('Erro ao gerar arquivo PDF!');
    end;
  end;
end;

procedure TfmeImagem.GerarPDF(Tipo : Byte);
var i,
    NPagina, viPagIni : Integer;
    Xp : TImagXpress;
    DiretorioPDF : String;
    viCaminhoArquivo: string;

    procedure GerarArquivoPDF(NPag : Integer);
    begin
    xp.LoadResizeWidth  := 2480;
      xp.LoadResizeHeight := 3508;
      Xp.PageNbr := NPag;
      Xp.FileName := Xpress1.FileName;
      xp.IResX := 300;
      xp.IResY := 300;
      xp.SaveFile;
    end;
begin
  NPagina      := Xpress1.Pages; //N�mero de Paginas
  DiretorioPDF := IncludeTrailingPathDelimiter(ExtractFileDir(Application.ExeName)) + 'PDF';
  if not DirectoryExists(DiretorioPDF) then
    CreateDir(DiretorioPDF);

  //DiretorioPDF := DiretorioPDF + '\'+ TiraBarra(dtmControles.DataHoraBanco(4));

  DiretorioPDF := IncludeTrailingPathDelimiter(
    DiretorioPDF) + TiraBarra(dtmControles.DataHoraBanco(4));

  if not DirectoryExists(DiretorioPDF) then
    CreateDir(DiretorioPDF);

  Xp := TImagXpress.Create(
    Xpress1);

  try
    viCaminhoArquivo := IncludeTrailingPathDelimiter(
      DiretorioPDF) + vg_NumeroMatricula + '.PDF';

    Xp.SaveFileName := viCaminhoArquivo;
    xp.SaveMultiPage := True;
    //xp.SavePDFCompression := PDF_CCITTFAX4;
    Xp.SavePDFCompression := PDF_Compress_Default;
    xp.LoadResizeEnabled := True;

    DeleteFile(Xp.SaveFileName);

    {Inicio da montagem do arquivo para impress�o}
    Screen.Cursor := crHourGlass;

    Application.ProcessMessages;
    viPagIni := 0;
    if tipo = 1 then
      viPagIni := 1
    else
      if tipo = 3 then
      begin
        viPagIni := spnPagInicial.EditValue;
        NPagina  := spnPagFinal.EditValue;
      end;

    if Tipo in [1,3] then
       for i := viPagIni to NPagina do
           GerarArquivoPDF(i)
    else GerarArquivoPDF(Xpress1.PageNbr);
  finally
    Xp.Free;
  end;

  //Assinar PDF
  if chxAssinar.Checked then
    fmeAssinaturaDigital1.AssinarDoc(DiretorioPDF + '\' + vg_NumeroMatricula + '.PDF');

  Screen.Cursor := crDefault;
  //ShowMessage('Arquivo gerado com sucesso!');

  Application.MessageBox(
    PWideChar(
      string.Format(
        'Arquivo gerado com sucesso em %s.',
        [viCaminhoArquivo])),
    PWideChar(
      'Informa��o'),
    MB_ICONINFORMATION);

  // Abrir o Windows Explorer com o arquivo PDF selecionado
  ShellExecute(
    0,
    nil,
    PWideChar(
      'explorer.exe'),
    PWideChar(
      string.Format(
        '/select,%s',
        [viCaminhoArquivo])),
    nil,
    SW_SHOWNORMAL);
end;

procedure TfmeImagem.ImagemColorida(Valor: Boolean);
begin
  vlImagemColorida := Valor;
  if (not vlImagemColorida) then
    TwainPRO.SaveTIFFCompression := TIFF_CCITTFAX4
  else TwainPRO.SaveTIFFCompression := TIFF_JPEG;
end;

procedure TfmeImagem.ImagemHistorico;
var
  Xp : TImagXpress;
begin
  if not vg_Imagem_Alterada then
    DeleteFile(vg_ArquivoHistorico);

  if Xpress1.Pages > 0 then
  begin
    Xp := TImagXpress.Create(Xpress1);
    try
      Xp.SaveMultiPage := True;
      Xp.PageNbr := Xpress1.PageNbr;
      Xp.FileName := Xpress1.FileName;
      Xp.SaveFileName := vg_ArquivoHistorico;

      if (not vlImagemColorida) then
      begin
        Xp.SaveFileType := FT_TIFF_G4;
        Xp.SaveTIFFCompression := TIFF_CCITTFAX4
      end
      else
      begin
        Xp.SaveJPEGLumFactor   := 50;
        Xp.SaveJPEGChromFactor := 50;
        Xp.SaveFileType := FT_TIFF_JPEG;
        Xp.SaveTIFFCompression := TIFF_JPEG;
      end;

      Xp.SaveFile;
    finally
      Xp.Free;
    end;
  end;

end;

procedure TfmeImagem.btnCancelarImpImagemClick(Sender: TObject);
begin
  pnlImpressao.Visible := False;
end;

procedure TfmeImagem.btnImprimirImagemClick(Sender: TObject);
begin
  ValidaExisteImagem;
  vg_PaperSize := cbxTipoPapel.EditValue;
  Imprimir(cbxTipoImpressao.EditValue);
  spnPagInicial.EditValue := 1;
  spnPagFinal.EditValue   := 1;
  pnlImpressao.Visible    := False;
end;

procedure TfmeImagem.cbxTipoImpressaoPropertiesEditValueChanged(
  Sender: TObject);
begin
  pnlIntervaloImp.Visible := cbxTipoImpressao.EditValue >= 3;
end;

procedure TfmeImagem.chxAssinarClick(Sender: TObject);
begin
  if chxAssinar.Checked then
    ShowCertificados
  else pnlCertificados.Visible := False;
end;

procedure TfmeImagem.InserirMargemImagem(vpMargem: Integer);
var w, h, r, i, Nri,
    viWPagina,
    viHPagina,
    viLMargem,
    viTMargem : Integer;
    viArquivo : String;
    Xp : TImagXpress;
begin
  Screen.Cursor := crHourglass;
  vg_PaperSize := cbxTipoPapel.EditValue;
  viArquivo := vg_DiretorioAuxiliar + '\IMA.TIF';

  PrintPRO1.PrintError := 0;
  PrintPRO1.TMargin    := 0;
  PrintPRO1.Lmargin    := 0;
  PrintPRO1.ScaleMode  := SCALE_Centimeter;//Escala de imagem em Centimetros
  PrintPRO1.OutputFileName := viArquivo;
  PrintPRO1.PaperSize  := vg_PaperSize;

  viWPagina := Round(PrintPRO1.ScaleWidth); //Largura da p�gina
  viHPagina := Round(PrintPRO1.ScaleHeight); //Altura da p�gina

  viLMargem := 0;
  viTMargem := 0;

  Nri := Xpress1.Pages;

  Xp := TImagXpress.Create(Xpress1);

  for i := 1 to Nri do
  begin
    DeleteFile(viArquivo);

    Xpress1.PageNbr := i;
    Xpress1.FileName := vg_ArquivoImagem;

    //Delata os layers (Lembretes)
    if (curLayer <> 0) then
    begin
      Notate1.Brand(BitsPerPixelBrand);
      Notate1.DeleteLayer(curLayer);
      vg_Activated := False;
    end;

    r := round(Xpress1.IResX * 2.5423);
    w := Xpress1.IWidth;
    h := Xpress1.IHeight;

    Xpress1.CropBorder(0.9, 2);

    PrintPRO1.PrintToFile  := True;
    PrintPRO1.SaveFileType := PP_TIF_G4;
    PrintPRO1.StartPrintDoc;
    PrintPRO1.hDib := Xpress1.hDib;
    PrintPRO1.PrintDIB(viLMargem , viTMargem , viWPagina - (viLMargem + 1), viHPagina - (viTMargem + 1) - vpMargem, 0, 0, 0, 0, vg_aspecto);
    PrintPRO1.EndPrintDoc;
    PrintPRO1.PrintToFile := False;

    Xp.SaveFileName := viArquivo;
    xp.SaveMultiPage := False;
    xp.LoadResizeEnabled := True;

    if (not vlImagemColorida) then
    begin
      xp.SaveFileType := FT_TIFF_G4;
      xp.SaveTIFFCompression := TIFF_CCITTFAX4
    end
    else
    begin
      xp.SaveJPEGLumFactor   := 50;
      xp.SaveJPEGChromFactor := 50;
      xp.SaveFileType := FT_TIFF_JPEG;
      xp.SaveTIFFCompression := TIFF_JPEG;
    end;

    xp.LoadResizeWidth  := w;
    xp.LoadResizeHeight := h;
    Xp.FileName := viArquivo;
    xp.IResX := r;
    xp.IResY := r;
    xp.SaveFile;

    Xpress1.InsertPage(viArquivo, vg_ArquivoImagem, i + 1);
    Xpress1.DeletePage(vg_ArquivoImagem, i);
  end;
  Xp.Free;

  //Comprime o arquivo das imagens
  Xpress1.CompressInMemory;
  Xpress1.CompactFile(vg_ArquivoImagem, viArquivo);

  if not CopyFile(Pchar(viArquivo), Pchar(vg_ArquivoImagem), False) then
    ShowMessage('Erro, n�o foi possivel copiar a imagem!');

  Application.ProcessMessages;
  PegaImagem;
  Screen.Cursor := crDefault;
end;


procedure TfmeImagem.Margem1cm1Click(Sender: TObject);
begin
  InserirMargemImagem(TMenuItem(Sender).Tag);
end;

procedure TfmeImagem.GravarHistorico(vpGravar: Boolean);
var
  i: Integer;
  Xp : TImagXpress;
  viFileHist,
  viNomeArquivo: string;
  viPaginas: Integer;
begin
  if vpGravar and (FileExists(vg_ArquivoHistorico)) then
  begin
    Xp := TImagXpress.Create(Xpress1);
    try
      if (not vlImagemColorida) then
      begin
        Xp.SaveFileType := FT_TIFF_G4;
        Xp.SaveTIFFCompression := TIFF_CCITTFAX4
      end
      else
      begin
        Xp.SaveJPEGLumFactor   := 50;
        Xp.SaveJPEGChromFactor := 50;
        Xp.SaveFileType := FT_TIFF_JPEG;
        Xp.SaveTIFFCompression := TIFF_JPEG;
      end;

      viFileHist := vg_CaminhoDiretorio + 'Historico\';
      if not DirectoryExists(viFileHist) then
        ForceDirectories(viFileHist);

      viNomeArquivo := GetNomeArquivo(vg_NomeArquivo);
      viFileHist := viFileHist + 'H_' + viNomeArquivo;

      Xp.FileName      := vg_ArquivoHistorico;
      Xp.SaveMultiPage := True;
      viPaginas        := Xp.Pages;

      for i := 1 to viPaginas do
      begin
        Xp.PageNbr       := i;
        Xp.FileName      := vg_ArquivoHistorico;
        Xp.SaveFileName  := viFileHist;
        Xp.SaveFile;
      end;

      dtmControles.Auditoria('','Gerenciador de Imagens', 'E','',
                             '0',
                             'Deletou '+ viPaginas.ToString + ' imagem(ns) do arquivo '+ ExtractFileName(viNomeArquivo));
    finally
      Xp.Free;
      DeleteFile(vg_ArquivoHistorico);
    end;
  end;

end;

procedure TfmeImagem.GravarImagem;
var Letra : String;
begin
  try
    if vg_TipoGravacao = 'M' then
    begin
      Validar;
      if Trim(edtLetra.Text) = '' then
         Letra := '#'
      else Letra := edtLetra.Text;

      vg_NomeArquivo := vg_CaminhoDiretorio + icxGrupo.EditValue + '_' + sqlIndexacaoTipoSIGLA.AsString + '_' + RetZeros(edtNumero.Text, 6) + Letra + vgImgExt;
      btnIndexar.Visible := True;
    end;

    try
    if not DirectoryExists(vg_CaminhoDiretorio) then
       ForceDirectories(vg_CaminhoDiretorio);
    except
      Application.MessageBox(PChar('Caminho da imagem n�o existe : ' + vg_CaminhoDiretorio), 'Aten��o', MB_OK + MB_ICONERROR);
      Abort;
    end;

    if cbxScanImageFloating.Checked then
      btnBrand.Click;

    if not CopyFile(PChar(vg_ArquivoImagem), PChar(vg_NomeArquivo), false) then
      ShowMessage('Erro, n�o foi possivel salvar a imagem!')
    else
    if not FileExists(PChar(vg_NomeArquivo))  then
      ShowMessage('Erro, imagem n�o salva!')
    else
      GravarHistorico(vg_Imagem_Alterada);

    pnlDados.Visible    := False;

    btnCancelar.Visible      := pnlDados.Visible;
    btnDigitalizar.Enabled   := not pnlDados.Visible;
    btnRedigitalizar.Enabled := btnDigitalizar.Enabled;
    vg_Imagem_Alterada := False;
  except
    on E: Exception do
    begin
      //Application.MessageBox('ERRO! Imagem n�o digitalizada! Verifique!',  'Aten��o', MB_OK  + MB_ICONEXCLAMATION);

      TMensagemUtils.ExibirMensagemErro(
        string.Format(
          'N�o foi poss�vel gravar a imagem devido ao ' +
          'motivo abaixo:%s%s',
          [DupeString(
            sLineBreak,
            2),
          E.Message]));

      raise;
    end;
  end;
end;

procedure TfmeImagem.GravarImagemIndexada(vOperacao, vPagina, vIndexar, vObs: string);
var
  Letra : String;
  vSomenteImagem: string;
begin
  try
    if vg_TipoGravacao = 'M' then
    begin
      Validar;
      if Trim(edtLetra.Text) = '' then
         Letra := '#'
      else Letra := edtLetra.Text;

      vg_NomeArquivo := vg_CaminhoDiretorio + icxGrupo.EditValue + '_' + sqlIndexacaoTipoSIGLA.AsString + '_' + RetZeros(edtNumero.Text, 6) + Letra + vgImgExt;
      btnIndexar.Visible := True;
    end;

    try
    if not DirectoryExists(vg_CaminhoDiretorio) then
       MkDir(vg_CaminhoDiretorio);
    except
      Application.MessageBox(PChar('Caminho da imagem n�o existe : ' + vg_CaminhoDiretorio), 'Aten��o', MB_OK + MB_ICONERROR);
      Abort;
    end;
    vSomenteImagem := Copy(vg_NomeArquivo, Length(vg_NomeArquivo) - 14, 15);
    if CopyFile(PChar(vg_ArquivoImagem), PChar(vg_NomeArquivo), False) = False then
    begin
      Application.MessageBox(PChar('ERRO! Voc� est� sem permiss�o de grava��o no SERVIDOR DE IMAGENS.'+#13+'Entre em contato com o SUPORTE T�CNICO!'), 'Aten��o', MB_OK + MB_ICONERROR);
    end
    else
    begin
      if vIndexar = 'S' then
        IndexarImagem(Copy(vSomenteImagem,5,6), Copy(vSomenteImagem,3,1), Copy(vSomenteImagem,1,1), vOperacao, vPagina, vObs);
    end;

    pnlDados.Visible    := False;

    btnCancelar.Visible         := pnlDados.Visible;
    btnDigitalizar.Enabled      := not pnlDados.Visible;
    btnRedigitalizar.Enabled    := btnDigitalizar.Enabled;
    btnExcluirPagImagem.Enabled := btnDigitalizar.Enabled;
    btnExcluirArquivo.Enabled   := btnDigitalizar.Enabled;
  except
    Application.MessageBox('ERRO! Imagem n�o digitalizada! Verifique!',  'Aten��o', MB_OK  + MB_ICONEXCLAMATION);
  end;
end;


procedure TfmeImagem.Notate1CurrentLayerChange(ASender: TObject;
  newLayer: Integer);
begin
  curLayer := newLayer;
end;

procedure TfmeImagem.pagControleChange(Sender: TObject);
begin
  if pagControle.ActivePage = tbsGeral then
  begin
    tbsGeral.ImageIndex := 13;
    tbsImagem.ImageIndex := -1;
    tbsArquivo.ImageIndex := -1;
  end
  else
  if pagControle.ActivePage = tbsImagem then
  begin
    tbsGeral.ImageIndex := -1;
    tbsImagem.ImageIndex := 14;
    tbsArquivo.ImageIndex := -1;
  end
  else
  if pagControle.ActivePage = tbsArquivo then
  begin
    tbsGeral.ImageIndex := -1;
    tbsImagem.ImageIndex := -1;
    tbsArquivo.ImageIndex := 15;
  end;
end;

procedure TfmeImagem.btnCancelarLembreteClick(Sender: TObject);
begin
  Xpress1.MousePointer := MP_Arrow;
  pnlLembrete.Visible := False;
end;

procedure TfmeImagem.btnCancelClick(Sender: TObject);
begin
  pnlCertificados.Visible := False;
  chxAssinar.Checked      := False;
end;

procedure TfmeImagem.btnLembreteClick(Sender: TObject);
begin
  pnlLembrete.Visible := True;
  if (curLayer = 0) then
    begin
      Notate1.SetClientWindow(Xpress1.hWnd);
      if curLayer = 0 Then Notate1.CreateLayer;
      if (curLayer <> 0) then
      begin
         Notate1.SetToolPaletteVisible (curLayer, False);
         if (Notate1.GrpGetFirstGroupID(curLayer) = 0) Then
            Notate1.GrpCreateGroup(curLayer, '', 0);
      end;
    end;
  Xpress1.MousePointer := MP_BPush;
  edtLembrete.SetFocus;
end;

procedure TfmeImagem.btnOKClick(Sender: TObject);
begin
  if fmeAssinaturaDigital1.ValidarCertificado then
    pnlCertificados.Visible := False;
end;

procedure TfmeImagem.InsereObjetoTexto;
Var e, x, y : Integer;
   t : String;
   f : TFont;
   NewFont : IFontDisp;

begin
   f := TFont.Create;
   f.Name := 'Arial';
   f.Size := 48;
   f.Style := [fsBold];

   GetOleFont(f, NewFont);

   X := Trunc((Xpress1.ScrollX + vg_PosInic.X) / Xpress1.IPZoomF);
   Y := Trunc((Xpress1.ScrollY + vg_PosInic.Y) / Xpress1.IPZoomF);

   e := Notate1.ElementCreate;
   Notate1.ElementSetType(e, StampTool);
   Notate1.ElementSetBoundingRect(e, X , Y , X + 1300, Y + 300);
   Notate1.ElementSetTextColor(e, clGreen);
   Notate1.ElementSetBackstyle(e, NXP_TRANSPARENT);
   Notate1.ElementSetPenWidth(e, 0);

   t := edtLembrete.Text;
   Notate1.ElementSetText(e, t);
   Notate1.ElementSetFont(e, NewFont);
   Notate1.ElementAppend(e);
   Notate1.ElementDestroy(e);

   f.Free;
end;

procedure TfmeImagem.btnSalvarClick(Sender: TObject);
var
   viArquivo : String;
begin
  viArquivo := vg_DiretorioAuxiliar + '\IMA.TIF';
  DeleteFile(viArquivo);

  Notate1.SaveAnnotations := True;
  Notate1.PreserveWTLayers:= True;
  Xpress1.SaveMultiPage   := false;
  Xpress1.SaveFileName    := viArquivo;
  if (not vlImagemColorida) then
  begin
    Xpress1.SaveFileType := FT_TIFF_G4;
    Xpress1.SaveTIFFCompression := TIFF_CCITTFAX4
  end
  else
  begin
    Xpress1.SaveJPEGLumFactor   := 50;
    Xpress1.SaveJPEGChromFactor := 50;
    Xpress1.SaveFileType := FT_TIFF_JPEG;
    Xpress1.SaveTIFFCompression := TIFF_JPEG;
  end;
  Xpress1.SaveFile;

  Xpress1.InsertPage(viArquivo, vg_ArquivoImagem, vg_NumImagem + 1);
  Xpress1.DeletePage(vg_ArquivoImagem, vg_NumImagem);

  //Comprime o arquivo das imagens
  Xpress1.CompressInMemory;
  Xpress1.CompactFile(vg_ArquivoImagem, viArquivo);
  if not CopyFile(Pchar(viArquivo), Pchar(vg_ArquivoImagem), False) then
    ShowMessage('Erro, n�o foi possivel salvar a imagem!');

  PegaImagem;

  GravarImagem;

  Notate1.SaveAnnotations := False;
  Notate1.PreserveWTLayers:= False;
  pnlLembrete.Visible := False;

 end;

 procedure TfmeImagem.IndexarImagem(vNumero, vTipo, vLivroOuTalao, vOperacao, vPagina, vObs: string);
var
  vIndexacaoId: integer;
begin
  with dtmControles.sqlAuxiliar do
  begin
    Active := False;
    Sql.Clear;
    Sql.Add('SELECT INDEXACAO_ID FROM G_INDEXACAO '+
            ' WHERE TIPO = :TIPO '+
            ' AND LIVRO_OU_TALAO = :LIVRO_OU_TALAO '+
            ' AND NUMERO = :NUMERO ');
    Params[0].AsString := vTipo;
    Params[1].AsString := vLivroOuTalao;
    Params[2].AsString := vNumero;
    Active := True;
  end;

  if dtmControles.sqlAuxiliar.IsEmpty then
  begin
    vIndexacaoId := dtmControles.GerarSequencia('G_INDEXACAO');
    with dtmControles.sqlAuxiliar do
    begin
      Active := False;
      Sql.Clear;
      Sql.Add('INSERT INTO G_INDEXACAO(INDEXACAO_ID, TIPO, LIVRO_OU_TALAO, USUARIO_ID, SISTEMA_ID, NUMERO, NUMERO_IMAGEM) '+
              ' VALUES(:INDEXACAO_ID, :TIPO, :LIVRO_OU_TALAO, :USUARIO_ID, :SISTEMA_ID, :NUMERO, :NUMERO_IMAGEM) ');
      Params[0].AsCurrency := vIndexacaoId;
      Params[1].AsString := vTipo;
      Params[2].AsString := vLivroOuTalao;
      Params[3].AsString := vgUsuarioID;
      Params[4].AsCurrency := vgId;
      Params[5].AsCurrency := StrToInt(vNumero);
      Params[6].AsCurrency := StrToInt(vNumero);
      ExecSQL;
    end;
  end
  else
  begin
    vIndexacaoId := dtmControles.sqlAuxiliar.Fields[0].AsInteger;
  end;

  with dtmControles.sqlAuxiliar do
  begin
    Active := False;
    Sql.Clear;
    Sql.Add('INSERT INTO G_INDEXACAO_HISTORICO '+
            ' (INDEXACAO_HISTORICO_ID, INDEXACAO_ID, DATA, USUARIO_ID, OPERACAO, NUMERO_PAGINA, OBSERVACAO) '+
            ' VALUES(:INDEXACAO_HISTORICO_ID, :INDEXACAO_ID, :DATA, :USUARIO_ID, :OPERACAO, :NUMERO_PAGINA, :OBSERVACAO) ');
    Params[0].AsCurrency := dtmControles.GerarSequencia('G_INDEXACAO_HISTORICO');
    Params[1].AsCurrency := vIndexacaoId;
    Params[2].AsString := dtmControles.DataHoraBanco(5);
    Params[3].AsString := vgUsuarioID;
    Params[4].AsString := vOperacao;
    Params[5].AsString := vPagina;
    Params[6].AsString := vObs;
    ExecSQL;
  end;

  dtmControles.sqlAuxiliar.Active := False;
end;

procedure TfmeImagem.TrimAppMemorySize;
var
  MainHandle: THandle;
begin
  try
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID) ;
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
    CloseHandle(MainHandle) ;
  except
  end;
  Application.ProcessMessages;
end;

end.
