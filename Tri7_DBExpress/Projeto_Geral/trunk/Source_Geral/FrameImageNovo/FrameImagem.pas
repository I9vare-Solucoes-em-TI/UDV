unit FrameImagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Menus, ActnList, ExtCtrls, ieview, iemview, iexAcquire, hyiedefs,
  cxLookAndFeelPainters, StdCtrls, cxButtons, dxBar, cxClasses, cxContainer, cxEdit,
  cxLabel, cxGraphics, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxGroupBox,
  cxCheckBox, cxProgressBar, cxBarEditItem, dxBarExtItems, cxSpinEdit, cxCalc,
  imageenview, ievect, imageenio, imageenproc, IniFiles, ExtDlgs, ComCtrls,
  cxLookAndFeels, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle,
  System.Actions, cxControls, cxSplitter;

type
  TfmeImagem = class(TFrame)
    ActionList: TActionList;
    actScanner: TAction;
    actImportar: TAction;
    actExportar: TAction;
    actSalvar: TAction;
    actDeletarArquivo: TAction;
    actRecortarSelecao: TAction;
    actSelecionarArea: TAction;
    actCopiar: TAction;
    actDeletarPagina: TAction;
    actGirarEsquerda: TAction;
    actGirarDireita: TAction;
    actAutoAjuste: TAction;
    splConfig: TcxSplitter;
    BarManager: TdxBarManager;
    dxBarManager1Bar1: TdxBar;
    dxBarSubItem1: TdxBarSubItem;
    btnScanner: TdxBarButton;
    btnDeletar: TdxBarButton;
    btnExportar: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    btnImportar: TdxBarButton;
    btnSalvar: TdxBarButton;
    btnRecortar: TdxBarButton;
    btnCopiar: TdxBarButton;
    btnDeletarPagina: TdxBarButton;
    btnGirarDireita: TdxBarButton;
    btnGirarEsqueda: TdxBarButton;
    btnAutoAjuste: TdxBarButton;
    dxBarManager1Bar2: TdxBar;
    btnBarScanner: TdxBarButton;
    btnBarSalvar: TdxBarButton;
    actConfig: TAction;
    btnBarZoomMais: TdxBarButton;
    btnBarZoomMenos: TdxBarButton;
    actZoomMais: TAction;
    actZoomMenos: TAction;
    btnBarImprimir: TdxBarButton;
    actImprimir: TAction;
    btnBarPagPrior: TdxBarButton;
    btnBarPagNext: TdxBarButton;
    actPagPrior: TAction;
    actPagNext: TAction;
    edtBarPagina: TdxBarEdit;
    edtBarTotalPagina: TdxBarEdit;
    edtDe: TcxBarEditItem;
    SaveDialogPDF: TSaveDialog;
    Panel1: TPanel;
    ImageView: TImageEnVect;
    cxSplitter1: TcxSplitter;
    ImageEnMView1: TImageEnMView;
    btnSelecionar: TdxBarButton;
    actFit: TAction;
    btnFit: TdxBarButton;
    btnPDF: TdxBarButton;
    btnConfig: TdxBarButton;
    OpenPictureDialog: TOpenPictureDialog;
    actExportarParticionado: TAction;
    btnExportarPDFPart: TdxBarButton;
    actInformacoes: TAction;
    btnInformacao: TdxBarButton;
    ProgressBar: TdxBarProgressItem;
    actMover: TAction;
    dxBarButton1: TdxBarButton;
    PopupMenu1: TPopupMenu;
    CopiarPgina1: TMenuItem;
    Deletar1: TMenuItem;
    DeletarPgina1: TMenuItem;
    N1: TMenuItem;
    Informaes1: TMenuItem;
    N2: TMenuItem;
    actRescanner: TAction;
    dxBarButton2: TdxBarButton;
    Redigitalizar1: TMenuItem;
    N3: TMenuItem;
    sbxPropriedades: TScrollBox;
    cxLabel1: TcxLabel;
    cxGroupBox1: TcxGroupBox;
    cbxScanner: TcxComboBox;
    cxGroupBox2: TcxGroupBox;
    chxDialog: TcxCheckBox;
    chxProgressBar: TcxCheckBox;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    edtDPIX: TcxTextEdit;
    edtDPIY: TcxTextEdit;
    cxLabel4: TcxLabel;
    cbxCores: TcxComboBox;
    chxDuplex: TcxCheckBox;
    chxMiniatura: TcxCheckBox;
    chxDigitalizacaoColorida: TcxCheckBox;
    btnSalvarConfig: TcxButton;
    procedure actScannerExecute(Sender: TObject);
    procedure cbxScannerPropertiesChange(Sender: TObject);
    procedure actConfigExecute(Sender: TObject);
    procedure actGirarDireitaExecute(Sender: TObject);
    procedure actGirarEsquerdaExecute(Sender: TObject);
    procedure actZoomMaisExecute(Sender: TObject);
    procedure actZoomMenosExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure actImportarExecute(Sender: TObject);
    procedure actExportarExecute(Sender: TObject);
    procedure actPagPriorExecute(Sender: TObject);
    procedure actPagNextExecute(Sender: TObject);
    procedure actSalvarExecute(Sender: TObject);
    procedure actDeletarPaginaExecute(Sender: TObject);
    procedure actDeletarArquivoExecute(Sender: TObject);
    procedure ImageEnMView1ImageSelect(Sender: TObject; idx: Integer);
    procedure actAutoAjusteExecute(Sender: TObject);
    procedure actSelecionarAreaExecute(Sender: TObject);
    procedure actRecortarSelecaoExecute(Sender: TObject);
    procedure actCopiarExecute(Sender: TObject);
    procedure btnSalvarConfigClick(Sender: TObject);
    procedure actFitExecute(Sender: TObject);
    procedure edtBarPaginaExit(Sender: TObject);
    procedure splConfigAfterClose(Sender: TObject);
    procedure splConfigAfterOpen(Sender: TObject);
    procedure actInformacoesExecute(Sender: TObject);
    procedure actMoverExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actRescannerExecute(Sender: TObject);
    procedure chxDigitalizacaoColoridaClick(Sender: TObject);
  private
    vlCurrentFile : string;
    vlImageColorida,
    vlImagemFormatar : Boolean;

    procedure FillIn(var vpImageEnMView : TImageEnMView);
    procedure FillBack;
    procedure CarregaImagem(vpPagina : Integer = 0);
    procedure GerarPDF(vpSelecionado: Integer = -1);
    procedure SetImageFormat;
    procedure SalvarImagem;
    { Private declarations }
  public
    { Public declarations }
    procedure Ativar;
    procedure SetNomeAquivo(vpNomeArquivo : String);
    procedure SetImagemColorida(vpImageColorida : Boolean);
  end;

implementation

uses
  PdfToTiff, frmPropDlg;

{$R *.dfm}

function ExtractOnlyFileName(AFileName: string): string;
var
  lFileName, lExt: String;
begin
  lExt := ExtractFileExt(AFileName);
  lFileName := ExtractFileName(AFileName);
  Result := StringReplace(lFileName, lExt, '', [rfReplaceAll]);  
end;

procedure TfmeImagem.FillBack;
const
  COLORS: array[0..9] of string = ('Black&White', 'GrayScale', 'RGB', 'Palette', 'CMY', 'CMYK', 'YUV', 'YUVK', 'CIEXYZ', 'LAB');
var
  i, v: integer;
begin
  //DPI
  edtDPIX.Text := FloatToStr(ImageEnMView1.MIO.TwainParams.YResolution.CurrentValue);
  edtDPIY.Text := FloatToStr(ImageEnMView1.MIO.TwainParams.XResolution.CurrentValue);
  // Fill Colors (0=B/W 1=GrayScale 2=RGB) combobox
  cbxCores.Properties.Items.Clear;
  for i := 0 to ImageEnMView1.MIO.TwainParams.PixelType.Count - 1 do
  begin
    v := ImageEnMView1.MIO.TwainParams.PixelType[i];
    if v <= high(COLORS) then
      cbxCores.Properties.Items.Add(COLORS[v]);
  end;
  cbxCores.ItemIndex := ImageEnMView1.MIO.TwainParams.PixelType.IndexOf(ImageEnMView1.MIO.TwainParams.PixelType.CurrentValue);
end;

procedure TfmeImagem.actAutoAjusteExecute(Sender: TObject);
var
  viRotate : Double;
begin
  viRotate := ImageEnMView1.Proc.SkewDetection(300, 15, 0.1, true);
  ImageEnMView1.Proc.RotateAndCrop(viRotate);
  ImageEnMView1.CopyToIEBitmap(ImageEnMView1.SelectedImage, ImageView.IEBitmap );
  ImageView.Update;
end;

procedure TfmeImagem.actConfigExecute(Sender: TObject);
begin
  if splConfig.State = ssClosed then
    splConfig.OpenSplitter
  else
    splConfig.CloseSplitter;
end;

procedure TfmeImagem.actCopiarExecute(Sender: TObject);
begin
  ImageView.Proc.CopyToClipboard(true);
end;

procedure TfmeImagem.actDeletarArquivoExecute(Sender: TObject);
begin
  if ImageEnMView1.ImageCount > 0 then
    if Application.MessageBox('Confirma deletar arquivo selecionada?', 'Aten��o', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      DeleteFile(vlCurrentFile);
      Application.ProcessMessages;
      ImageView.Clear;
      ImageView.Blank;
      ImageEnMView1.Clear;
      ImageView.Blank;
      edtBarPagina.Text := '0';
      edtBarTotalPagina.Text := '0';
    end;
end;

procedure TfmeImagem.actDeletarPaginaExecute(Sender: TObject);
begin
  if ImageEnMView1.ImageCount > 0 then
  begin
    if ImageEnMView1.ImageCount = 1 then
      actDeletarArquivoExecute(self)
    else
    begin
      if Application.MessageBox('Confirma deletar p�gina selecionada?', 'Aten��o', MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        DeleteTIFFIm(vlCurrentFile, ImageEnMView1.SelectedImage);
        Application.ProcessMessages;
        CarregaImagem(ImageEnMView1.SelectedImage - 1);
      end;
    end;
  end;
end;

procedure TfmeImagem.actExportarExecute(Sender: TObject);
begin
  with CreateMessageDialog('Gerar PDF?', mtConfirmation, [mbYes, MbNo, mbCancel]) do
  begin
    Caption := 'P�ginas';
    (FindComponent('YES') as TButton).Caption := 'Todas';
    (FindComponent('NO') as TButton).Caption := 'Atual';
    (FindComponent('CANCEL') as TButton).Caption := 'Cancelar';
    ShowModal;

    if (ModalResult = mrYes) then
      GerarPDF(-1)
    else
    if (ModalResult = mrNo) then
      GerarPDF(ImageEnMView1.SelectedImage);

    Free;
  end;
end;

procedure TfmeImagem.actFitExecute(Sender: TObject);
begin
  ImageView.Fit;
end;

procedure TfmeImagem.actGirarDireitaExecute(Sender: TObject);
begin
  ImageEnMView1.Proc.Rotate(270);
  ImageEnMView1.CopyToIEBitmap(ImageEnMView1.SelectedImage, ImageView.IEBitmap );
  ImageView.Update;
end;

procedure TfmeImagem.actGirarEsquerdaExecute(Sender: TObject);
begin
  ImageEnMView1.Proc.Rotate(90);
  ImageEnMView1.CopyToIEBitmap(ImageEnMView1.SelectedImage, ImageView.IEBitmap );
  ImageView.Update;
end;

procedure TfmeImagem.actImportarExecute(Sender: TObject);
var
  fn,
  imagem: string;
  viCaminhoArquivo: string;
begin
  if OpenPictureDialog.Execute then
  begin
    Screen.Cursor := crHourGlass;
    imagem := 'c:\Temp\IMAIMPORT.TIF';

    DeleteFile(imagem);
    try
      for viCaminhoArquivo in OpenPictureDialog.Files do
      begin
        fn := viCaminhoArquivo;
        Caption := fn;

        if UpperCase(ExtractFileExt(fn)) = '.PDF' then
          ConverterPdfToTiff(fn, imagem, ProgressBar)
        else
          ConverterToTiff(fn, imagem, ProgressBar);

        // load image
        ImageEnMView1.DeSelect;
        ImageEnMView1.MIO.LoadFromFile(imagem);

        edtBarTotalPagina.Text := IntToStr(ImageEnMView1.ImageCount);
        ImageEnMView1.SelectedImage := 0;

        DeleteFile(imagem);

        Application.ProcessMessages;
      end;

      vlImagemFormatar := True;
    finally
      Screen.Cursor := crDefault;
    end;

    actPagPriorExecute(nil);
    ImageView.Fit;
    SalvarImagem;
  end;
end;

procedure TfmeImagem.actImprimirExecute(Sender: TObject);
begin
  if ImageEnMView1.ImageCount > 0 then
  begin
    ImageEnMView1.Proc.SaveUndo(ieuImage);
    ImageEnMView1.MIO.PrintPreviewParams.MarginTop    := 0.5;
    ImageEnMView1.MIO.PrintPreviewParams.MarginLeft   := 0.5;
    ImageEnMView1.MIO.PrintPreviewParams.MarginRight  := 0.5;
    ImageEnMView1.MIO.PrintPreviewParams.MarginBottom := 0.5;
    ImageEnMView1.MIO.DoPrintPreviewDialog('');
    ImageEnMView1.Proc.Undo; // this removes painted annotations
  end
  else
    Messagedlg('Nenhuma imagem selecionada!', mtInformation, [mbOK], 0);
end;

procedure TfmeImagem.actInformacoesExecute(Sender: TObject);
begin
  if PropertiesDlg = nil then
    PropertiesDlg := TPropertiesDlg.Create(nil);

  with PropertiesDlg do
  begin
//    ShowModal;
  end;
end;

procedure TfmeImagem.actMoverExecute(Sender: TObject);
var
  viDest : Integer;
  viValor: String;
begin
  if ImageEnMView1.ImageCount > 0 then
  begin
    viValor := InputBox('Mover imagem para', 'Posi��o:', '');
    if Trim(viValor) <> '' then
    begin
       try
         viDest := StrToInt(viValor);

         if (viDest < 1) or (viDest > ImageEnMView1.ImageCount) then
         begin
           Application.MessageBox('Valor informado n�o � valido!', 'Aten��o', MB_OK + MB_ICONWARNING);
           Exit;
         end;

         Dec(viDest);
       except
         Application.MessageBox('Valor informado n�o � valido!', 'Aten��o', MB_OK + MB_ICONWARNING);
         Exit;
       end;
    end
    else Exit;

    ImageEnMView1.MoveImage(ImageEnMView1.SelectedImage, viDest);

    ImageView.IO.Params.ImageIndex := viDest;
    ImageEnMView1.SetImage(viDest, ImageView.IO.Bitmap);
    ImageEnMView1.MIO.SaveToFileTIFF(vlCurrentFile, false);
  end;
end;

procedure TfmeImagem.actPagNextExecute(Sender: TObject);
begin
  if ImageEnMView1.ImageCount > 0 then
  begin
    if ImageEnMView1.SelectedImage < ImageEnMView1.ImageCount - 1 then
      ImageEnMView1.SelectedImage := ImageEnMView1.SelectedImage + 1
    else
      ImageEnMView1.SelectedImage := ImageEnMView1.SelectedImage;

    ImageEnMView1.CopyToIEBitmap(ImageEnMView1.SelectedImage, ImageView.IEBitmap );
    ImageView.Update;

    edtBarPagina.Text := IntToStr(ImageEnMView1.SelectedImage + 1);
  end;
end;

procedure TfmeImagem.actPagPriorExecute(Sender: TObject);
begin
  if ImageEnMView1.ImageCount > 0 then
  begin
    if ImageEnMView1.SelectedImage > 0 then
      ImageEnMView1.SelectedImage := ImageEnMView1.SelectedImage - 1
    else
      ImageEnMView1.SelectedImage := ImageEnMView1.SelectedImage;

    ImageEnMView1.CopyToIEBitmap(ImageEnMView1.SelectedImage, ImageView.IEBitmap );
    ImageView.Update;

    edtBarPagina.Text := IntToStr(ImageEnMView1.SelectedImage + 1);
  end;
end;

procedure TfmeImagem.actRecortarSelecaoExecute(Sender: TObject);
begin
  if (ImageView.Selected) then
  begin
    ImageView.Proc.CropSel;
    ImageView.MouseInteract := [];

    ImageView.IO.Params.ImageIndex := ImageEnMView1.SelectedImage;
    ImageEnMView1.SetImage(ImageEnMView1.SelectedImage, ImageView.IO.Bitmap);
  end;
  ImageView.Deselect;
end;

procedure TfmeImagem.actRescannerExecute(Sender: TObject);
var
  viImgAtual : Integer;
begin
  if ImageEnMView1.MIO.AcquireParams.SelectedSource.API = ieaNone then
  begin
    Messagedlg('Nenhum scanner selecionado!', mtInformation, [mbOK], 0);
    Exit;
  end;

  viImgAtual := ImageEnMView1.SelectedImage;

  FillIn(ImageEnMView1);
  ImageEnMView1.DeSelect;

  if ImageEnMView1.MIO.Acquire then
  begin
    Try
      ImageEnMView1.MoveImage(ImageEnMView1.ImageCount - 1, viImgAtual);
      vlImagemFormatar := True;
      SalvarImagem;
      DeleteTIFFIm(vlCurrentFile, viImgAtual + 1);
      Application.ProcessMessages;
      CarregaImagem(viImgAtual);
    finally

    end;
  end;
end;

procedure TfmeImagem.actSalvarExecute(Sender: TObject);
begin
  if ImageEnMView1.ImageCount > 0 then
  begin
    if Application.MessageBox('Confirma salvar imagem atual?', 'Aten��o', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      SalvarImagem;
    end;
  end;
end;

procedure TfmeImagem.actScannerExecute(Sender: TObject);
begin
  if ImageEnMView1.MIO.AcquireParams.SelectedSource.API = ieaNone then
  begin
    Messagedlg('Nenhum scanner selecionado!', mtInformation, [mbOK], 0);
    Exit;
  end;

  FillIn(ImageEnMView1);
  ImageEnMView1.DeSelect;

  if ImageEnMView1.MIO.Acquire then
  begin
    Try
      vlImagemFormatar := True;
      SalvarImagem;
    finally
      //CarregaPagina;
      edtBarTotalPagina.Text := IntToStr(ImageEnMView1.ImageCount);
      ImageEnMView1.SelectedImage := ImageEnMView1.ImageCount - 1;
      ImageEnMView1.CopyToIEBitmap(ImageEnMView1.SelectedImage, ImageView.IEBitmap );
      ImageView.Update;
    end;
  end;
end;

procedure TfmeImagem.actSelecionarAreaExecute(Sender: TObject);
begin
  if (ImageView.Selected) then
    ImageView.MouseInteract := []
  else
    ImageView.MouseInteract := [miSelect];
  ImageView.Deselect;
end;

procedure TfmeImagem.actZoomMaisExecute(Sender: TObject);
begin
  ImageView.Zoom := ImageView.Zoom * 2;
end;

procedure TfmeImagem.actZoomMenosExecute(Sender: TObject);
begin
  ImageView.Zoom := ImageView.Zoom / 2;
end;

procedure TfmeImagem.Ativar;
var
  i : Integer;
  Ini : TIniFile;
  viConfig : String;
begin
  splConfig.CloseSplitter;

  SetImagemColorida(False);

   // fills Twain sources
  for i := 0 to ImageEnMView1.MIO.TwainParams.SourceCount - 1 do
    cbxScanner.Properties.Items.Add(ImageEnMView1.MIO.TwainParams.SourceName[i]);

  ImageEnMView1.MIO.AcquireParams.FillListWithSources(cbxScanner.Properties.Items);

  vlCurrentFile := '';

  try
    viConfig := ExtractFilePath(Application.ExeName) + 'Imagem.ini';
    if FileExists(viConfig) then
    begin
      Ini := TIniFile.Create(viConfig);
      cbxScanner.ItemIndex     := StrToInt(Ini.ReadString('Geral', 'Scanner', '0'));
      chxDialog.EditValue      := Ini.ReadString('Geral', 'Dialog', 'S');
      chxProgressBar.EditValue := Ini.ReadString('Geral', 'Progress', 'S');
      chxDuplex.EditValue      := Ini.ReadString('Geral', 'Duplex', 'N');
      edtDPIX.Text             := Ini.ReadString('Geral', 'DPIX', '200');
      edtDPIY.Text             := Ini.ReadString('Geral', 'DPIY', '200');
      cbxCores.ItemIndex       := StrToInt(Ini.ReadString('Geral', 'Cores', '0'));
      chxMiniatura.EditValue               := Ini.ReadString('Geral', 'Miniatura', 'S');
      chxDigitalizacaoColorida.EditValue   := Ini.ReadString('Geral', 'Colorido', 'S');
      FreeAndNil(Ini);

      if not chxMiniatura.Checked then
        cxSplitter1.CloseSplitter;

      vlImageColorida := chxDigitalizacaoColorida.Checked;
    end
    else
    if cbxScanner.Properties.Items.Count > 0 then
      cbxScanner.ItemIndex := 0;

  except
     Application.MessageBox('Erro ao setar os par�metros de configura��o!', 'Aten��o', MB_OK + MB_ICONWARNING);
  end;
end;

procedure TfmeImagem.CarregaImagem(vpPagina : Integer = 0);
begin
  Screen.Cursor := crHourGlass;
  ImageView.Clear;
  ImageEnMView1.Clear;
  ImageEnMView1.MIO.LoadFromFileTIFF(vlCurrentFile);

  if vpPagina < 0 then vpPagina := 0;

  ImageEnMView1.SelectedImage := vpPagina;
  ImageEnMView1.CopyToIEBitmap(ImageEnMView1.SelectedImage, ImageView.IEBitmap );
  ImageView.Update;

  edtBarTotalPagina.Text := IntToStr(ImageEnMView1.ImageCount);
  edtBarPagina.Text := '1';
  
  ImageView.Fit;

  vlImagemFormatar := False;
  Screen.Cursor := crDefault;
end;

procedure TfmeImagem.cbxScannerPropertiesChange(Sender: TObject);
begin
  ImageEnMView1.MIO.AcquireParams.SetSourceByStr(cbxScanner.Properties.Items[cbxScanner.ItemIndex]);
  FillBack;
end;

procedure TfmeImagem.chxDigitalizacaoColoridaClick(Sender: TObject);
begin
  vlImageColorida := chxDigitalizacaoColorida.Checked;
end;

procedure TfmeImagem.btnSalvarConfigClick(Sender: TObject);
var
  Ini : TIniFile;
begin
  try
    Ini         := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Imagem.ini');
    Ini.WriteString('Geral', 'Scanner', IntToStr(cbxScanner.ItemIndex));
    Ini.WriteString('Geral', 'Dialog', chxDialog.EditValue);
    Ini.WriteString('Geral', 'Progress', chxProgressBar.EditValue);
    Ini.WriteString('Geral', 'Duplex', chxDuplex.EditValue);
    Ini.WriteString('Geral', 'DPIX', edtDPIX.Text);
    Ini.WriteString('Geral', 'DPIY', edtDPIY.Text);
    Ini.WriteString('Geral', 'Cores', IntToStr(cbxCores.ItemIndex));
    Ini.WriteString('Geral', 'Miniatura', chxMiniatura.EditValue);
    Ini.WriteString('Geral', 'Colorido', chxDigitalizacaoColorida.EditValue);
    Ini.Free;
  finally
    Messagedlg('Configura��es salvas!', mtInformation, [mbOK], 0);
  end;
end;

procedure TfmeImagem.edtBarPaginaExit(Sender: TObject);
begin
  if ImageEnMView1.ImageCount > 0 then
  begin
    ImageEnMView1.SelectedImage := StrToInt(edtBarPagina.Text) - 1;

    ImageEnMView1.CopyToIEBitmap(ImageEnMView1.SelectedImage, ImageView.IEBitmap );
    ImageView.Update;
  end;
end;

procedure TfmeImagem.SalvarImagem;
begin
  Screen.Cursor := crHourGlass;
  if vlImagemFormatar then
    SetImageFormat;
  ImageEnMView1.MIO.SaveToFileTIFF(vlCurrentFile, false);
  Screen.Cursor := crDefault;
end;

procedure TfmeImagem.SetImageFormat;
begin
  if vlImageColorida then
  begin
    ImageEnMView1.Proc.ConvertTo (256);
    ImageEnMView1.MIO.Params[0].TIFF_Compression := ioTIFF_LZW;
    ImageEnMView1.MIO.Params[0].BitsPerSample := 8;
    ImageEnMView1.MIO.Params[0].SamplesPerPixel := 1;
    ImageEnMView1.MIO.Params[0].DpiX := 200;
    ImageEnMView1.MIO.Params[0].DpiY := 200;
    ImageEnMView1.MIO.DuplicateCompressionInfo;
    ImageEnMView1.Invalidate;
  end
  else
  begin
      ImageEnMView1.MIO.Params[0].TIFF_Compression := ioTIFF_G4FAX;
      ImageEnMView1.MIO.Params[0].BitsPerSample := 1;
      ImageEnMView1.MIO.Params[0].SamplesPerPixel := 1;
      ImageEnMView1.MIO.Params[0].DpiX := 200;
      ImageEnMView1.MIO.Params[0].DpiY := 200;
      ImageEnMView1.MIO.DuplicateCompressionInfo;
      ImageEnMView1.Invalidate;
  end;
end;

procedure TfmeImagem.SetImagemColorida(vpImageColorida: Boolean);
begin
  vlImageColorida := vpImageColorida;
end;

procedure TfmeImagem.SetNomeAquivo(vpNomeArquivo: String);
begin
  vlCurrentFile := vpNomeArquivo;
  if FileExists(vlCurrentFile) then
    CarregaImagem
  else
  begin
    ImageView.Clear;
    ImageEnMView1.Clear;
    ImageView.Update;
  end;
end;

procedure TfmeImagem.splConfigAfterClose(Sender: TObject);
begin
  btnConfig.Lowered := False;
end;

procedure TfmeImagem.splConfigAfterOpen(Sender: TObject);
begin
  btnConfig.Lowered := True;
end;

procedure TfmeImagem.FillIn(var vpImageEnMView : TImageEnMView);
begin
  vpImageEnMView.MIO.TwainParams.VisibleDialog := chxDialog.Checked;
  vpImageEnMView.MIO.TwainParams.ProgressIndicators := chxProgressBar.Checked;
  vpImageEnMView.MIO.TwainParams.AcquireFrameLeft := 0;
  vpImageEnMView.MIO.TwainParams.AcquireFrameTop := 0;
  vpImageEnMView.MIO.TwainParams.AcquireFrameRight := 0;
  vpImageEnMView.MIO.TwainParams.AcquireFrameBottom := 0;
  vpImageEnMView.MIO.TwainParams.PixelType.CurrentValue := cbxCores.ItemIndex;
  vpImageEnMView.MIO.TwainParams.YResolution.CurrentValue := StrToInt(edtDPIX.Text);
  vpImageEnMView.MIO.TwainParams.XResolution.CurrentValue := StrToInt(edtDPIY.text);
  vpImageEnMView.MIO.TwainParams.BufferedTransfer := True;
  vpImageEnMView.MIO.TwainParams.DuplexEnabled := chxDuplex.Checked;
end;

procedure TfmeImagem.GerarPDF(vpSelecionado: Integer = -1);
Const
  PaperWidth: array[0..11] of integer = (2380, 1684, 1190, 842, 595, 421, 297, 501, 612, 612, 1224, 792);
  PaperHeight: array[0..11] of integer = (3368, 2380, 1684, 1190, 842, 595, 421, 709, 792, 1008, 792, 1224);
  PDFCompression: array[0..3] of TIOPDFCompression = (ioPDF_RLE, ioPDF_G3FAX2D, ioPDF_G4FAX, ioPDF_JPEG);

var
  ImageEnViewPDF : TImageEnView;
  i,
  viIdx,
  viSize :Integer;
  str : TMemoryStream;
  viArquivo : String;
begin
  if ImageEnMView1.ImageCount > 0 then
  begin
    SaveDialogPDF.FileName := ExtractOnlyFileName(vlCurrentFile) + '.PDF';

    if SaveDialogPDF.Execute then
    begin
      Screen.Cursor := crHourGlass;
      ProgressBar.Position := 0;

      // Adobe PDF
      ImageEnViewPDF := TImageEnView.Create(nil);
      ImageEnViewPDF.IO.Params.PDF_PaperWidth := PaperWidth[4];
      ImageEnViewPDF.IO.Params.PDF_PaperHeight := PaperHeight[4];
      ImageEnViewPDF.IO.CreatePDFFile(SaveDialogPDF.FileName);

      if vpSelecionado <> -1 then
      begin
        ProgressBar.Max := 1;
        ProgressBar.Position := 1;
        Application.ProcessMessages;

        ImageEnViewPDF.IO.Params.ImageIndex := vpSelecionado;
        ImageEnViewPDF.IO.LoadFromFileTIFF(vlCurrentFile);
        ImageEnViewPDF.IO.Params.PDF_Compression := PDFCompression[3];
        ImageEnViewPDF.IO.SaveToPDF;
      end
      else
      begin
        ProgressBar.Max := ImageEnMView1.ImageCount - 1;

        for i := 0 to ImageEnMView1.ImageCount - 1 do
        begin
          ProgressBar.Position := i;
          Application.ProcessMessages;

          ImageEnViewPDF.IO.Params.ImageIndex := i;
          ImageEnViewPDF.IO.LoadFromFileTIFF(vlCurrentFile);
          ImageEnViewPDF.IO.Params.PDF_Compression := PDFCompression[2];
          ImageEnViewPDF.IO.SaveToPDF;
        end;
      end;

      ImageEnViewPDF.IO.ClosePDFFile;
      FreeAndNil(ImageEnViewPDF);

      Screen.Cursor := crDefault;
      ProgressBar.Position := 0;
      Messagedlg('PDF gerado com sucesso!', mtInformation, [mbOK], 0);
    end;
  end
  else
  Messagedlg('Nenhuma imagem selecionada!', mtInformation, [mbOK], 0);
end;

procedure TfmeImagem.ImageEnMView1ImageSelect(Sender: TObject; idx: Integer);
begin
  // Copy image
  ImageEnMView1.CopyToIEBitmap( idx, ImageView.IEBitmap );
  ImageView.Update;
end;

procedure TfmeImagem.PopupMenu1Popup(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to PopupMenu1.Items.Count - 1 do
     PopupMenu1.Items[i].Enabled := ImageEnMView1.ImageCount > 0;
end;

end.
