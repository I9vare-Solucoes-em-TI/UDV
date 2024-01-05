unit FrameImagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, Menus, ActnList, ExtCtrls, ieview, iemview, iexAcquire, hyiedefs,
  cxLookAndFeelPainters, StdCtrls, cxButtons, dxBar, cxClasses, cxContainer, cxEdit,
  cxLabel, cxGraphics, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxGroupBox,
  cxCheckBox, cxProgressBar, cxBarEditItem, dxBarExtItems, cxSpinEdit, cxCalc,
  imageenview, ievect, imageenio, imageenproc, IniFiles, ExtDlgs, ComCtrls,
  cxLookAndFeels, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinOffice2007Black,
  System.Actions, cxControls, cxSplitter, hyieutils, cxButtonEdit;

type
  TImageColor = (icColorful, icBlackWhite);
  TAfterScan = reference to procedure;

  TfmeImagem = class(TFrame)
    ActionList: TActionList;
    actScanner: TAction;
    actImportar: TAction;
    actExportar: TAction;
    actSalvar: TAction;
    actDeletarArquivo: TAction;
    actSelecionarArea: TAction;
    actCopiar: TAction;
    actDeletarPagina: TAction;
    actGirarEsquerda: TAction;
    actGirarDireita: TAction;
    actAutoAjuste: TAction;
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
    btnCopiar: TdxBarButton;
    btnDeletarPagina: TdxBarButton;
    btnGirarDireita: TdxBarButton;
    btnGirarEsqueda: TdxBarButton;
    btnAutoAjuste: TdxBarButton;
    dxBarManager1Bar2: TdxBar;
    btnBarScanner: TdxBarButton;
    btnBarSalvar: TdxBarButton;
    actConfig: TAction;
    actZoomMais: TAction;
    actZoomMenos: TAction;
    actImprimir: TAction;
    btnBarPagPrior: TdxBarButton;
    btnBarPagNext: TdxBarButton;
    actPagPrior: TAction;
    actPagNext: TAction;
    edtBarPagina: TdxBarEdit;
    edtBarTotalPagina: TdxBarEdit;
    SaveDialogPDF: TSaveDialog;
    Panel1: TPanel;
    ImageEnMView1: TImageEnMView;
    btnSelecionar: TdxBarButton;
    actFit: TAction;
    btnPDF: TdxBarButton;
    btnConfig: TdxBarButton;
    OpenPictureDialog: TOpenPictureDialog;
    ProgressBarFile: TdxBarProgressItem;
    actMover: TAction;
    dxBarButton1: TdxBarButton;
    PopupMenu1: TPopupMenu;
    CopiarPgina1: TMenuItem;
    Deletar1: TMenuItem;
    DeletarPgina1: TMenuItem;
    N1: TMenuItem;
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
    edtDPIX: TcxTextEdit;
    cxLabel4: TcxLabel;
    cbxCores: TcxComboBox;
    chxDuplex: TcxCheckBox;
    btnSalvarConfig: TcxButton;
    StatusBar1: TStatusBar;
    cxSplitter1: TcxSplitter;
    btnCancelarConfig: TcxButton;
    cxLabel3: TcxLabel;
    edtDPIY: TcxTextEdit;
    actImagemEmBranco: TAction;
    dxBarSeparator1: TdxBarSeparator;
    dxBarButton3: TdxBarButton;
    dxBarSeparator2: TdxBarSeparator;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    actUndo: TAction;
    dxBarButton11: TdxBarButton;
    dxBarSeparator3: TdxBarSeparator;
    dxBarButton13: TdxBarButton;
    dxBarButton12: TdxBarButton;
    actColarSelecao: TAction;
    dxBarButton16: TdxBarButton;
    dxBarSeparator4: TdxBarSeparator;
    actCopiarSelecao: TAction;
    dxBarButton17: TdxBarButton;
    actCortarImagem: TAction;
    dxBarButton18: TdxBarButton;
    dxBarButton19: TdxBarButton;
    dxBarButton20: TdxBarButton;
    actMergeSelecao: TAction;
    dxBarButton22: TdxBarButton;
    actDeletarLayer: TAction;
    dxBarButton23: TdxBarButton;
    ImageView: TImageEnView;
    dxBarButton14: TdxBarButton;
    ckbAutoFit: TcxBarEditItem;
    dxBarButton15: TdxBarButton;
    dxBarButton21: TdxBarButton;
    dxBarButton24: TdxBarButton;
    ckbImagemColorida: TcxBarEditItem;
    cxGroupBox3: TcxGroupBox;
    chxMiniatura: TcxCheckBox;
    chxDigitalizacaoColorida: TcxCheckBox;
    chxImagemAutoFit: TcxCheckBox;
    dxBarButton25: TdxBarButton;
    actCheckBoxesImagem: TAction;
    dxBarButton26: TdxBarButton;
    lblConvertendo: TcxBarEditItem;
    actExportTiff: TAction;
    dxBarButton27: TdxBarButton;
    actHistorico: TAction;
    dxBarButton28: TdxBarButton;
    dxBarButton29: TdxBarButton;
    actVisualizar: TAction;
    actResize: TAction;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton30: TdxBarButton;
    dxBarButton31: TdxBarButton;
    dxBarButton32: TdxBarButton;
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
    procedure actCopiarExecute(Sender: TObject);
    procedure btnSalvarConfigClick(Sender: TObject);
    procedure actFitExecute(Sender: TObject);
    procedure splConfigAfterClose(Sender: TObject);
    procedure splConfigAfterOpen(Sender: TObject);
    procedure actMoverExecute(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure actRescannerExecute(Sender: TObject);
    procedure btnCancelarConfigClick(Sender: TObject);
    procedure actImagemEmBrancoExecute(Sender: TObject);
    procedure actUndoExecute(Sender: TObject);
    procedure ImageViewImageChange(Sender: TObject);
    procedure actColarSelecaoExecute(Sender: TObject);
    procedure actCopiarSelecaoExecute(Sender: TObject);
    procedure actCortarImagemExecute(Sender: TObject);
    procedure actMergeSelecaoExecute(Sender: TObject);
    procedure actDeletarLayerExecute(Sender: TObject);
    procedure actCheckBoxesImagemExecute(Sender: TObject);
    procedure edtBarPaginaKeyPress(Sender: TObject; var Key: Char);
    procedure edtBarPaginaExit(Sender: TObject);
    procedure chxDigitalizacaoColoridaClick(Sender: TObject);
    procedure ckbImagemColoridaChange(Sender: TObject);
    procedure actExportTiffExecute(Sender: TObject);
    procedure actHistoricoExecute(Sender: TObject);
    procedure actVisualizarExecute(Sender: TObject);
    procedure ImageEnMView1DblClick(Sender: TObject);
    procedure chxImagemAutoFitClick(Sender: TObject);
    procedure chxMiniaturaClick(Sender: TObject);
    procedure actResizeExecute(Sender: TObject);
    procedure dxBarButton30Click(Sender: TObject);
  private
    FCurrentFile,
    FHistoryFile,
    FFileSize : string;
    FImageFormat : TImageColor;
    FUnsavedChangedImage,
    FHistory,
    FMenuHblt: Boolean;
    FAfterScan: TAfterScan;

    //FrameImagem
    procedure ActivateFrame;
    function GetCurrentFile: string;
    function GetAutoFit: Boolean;
    function GetColorful: Boolean;
    procedure OpenFile(const vpIdx : Integer);


    procedure FillIn(var vpImageEnMView : TImageEnMView);
    procedure FillBack;
    procedure LoadImage(const vpIdx : Integer);
    procedure OpenScanner;
    procedure ReScan;
    procedure ImportImage;
    procedure AddEmptyImage;

    procedure SetImageFormat(const vpImageEnMView: TImageEnMView; const vpCompress: Boolean = True);
    procedure SaveImage;
    procedure PrintImage;
    procedure GeneratePDF(vpIdx: Integer = -1);
    procedure ExportSelImage;
    function ConvertToTiff(const vpSource : string): string;

    procedure UpdateStatusBar;
    procedure UpdateMenu;
    function SelectImage(const vpIdx: integer): Boolean;
    procedure ImageMouseInteract;
    function IsImageColor: Boolean;
    procedure ImageCopyToClip;
    procedure ImagePasteFromClip;

    procedure CropImage;
    procedure MergeSelect;
    procedure DeleteLayer;
    procedure Undo;
    procedure ZoomIN;
    procedure ZoomOut;
    procedure Fit;
    procedure Next;
    procedure Prior;
    procedure RotateLeft;
    procedure RotateRight;
    procedure AutoAjuste;
    procedure Resize(const vpPercent: Integer);

    procedure CheckBoxesImage;
    procedure DeleteSelectedImages;
    procedure MoveImage;
    procedure DeleteImageFile;
    function GetFileNameHistory: string;

    procedure SaveFileIndex(const vpFileSave: string; const vpVetorIdx: TIEArrayOfInteger);
    procedure LoadImageHistory;
    procedure SaveHistory(const vpVetorIdx: TIEArrayOfInteger); overload;
    procedure SaveHistory; overload;

    procedure ViewImageForm;

    procedure TrimAppMemorySize;
    procedure DoAfterScan;

    const FDPI = 150;

  public
    { Public declarations }
    procedure LoadFromFile(const vpFileName : String; const vpIdx: Integer = 0; const vpMenuHblt: Boolean = True);overload;
    procedure LoadFromFile(const vpFileName : String; const vpIdx: Integer; const vpMenuHblt: Boolean; const vpHistory: Boolean);overload;
    procedure SetImageColor(const vpColor: TImageColor);

    procedure RegisterAfterScan(
      const vpAfterScan: TAfterScan);

    function ValidateImage : Boolean;

    constructor Create(
      AOwner: TComponent); override;

    destructor Destroy; override;
  end;

implementation

uses
  PdfToTiff,
  VisualizarImagem,
  Generics.Collections;

{$R *.dfm}

function GetSizeFileName(AFileName: string): Integer;
begin
  with TFileStream.Create(AFileName, fmOpenRead or fmShareExclusive) do
  try
    Result := Size;
  finally
    Free;
  end;
end;

function ExtractOnlyFileName(AFileName: string): string;
var
  lFileName, lExt: String;
begin
  lExt := ExtractFileExt(AFileName);
  lFileName := ExtractFileName(AFileName);
  Result := StringReplace(lFileName, lExt, '', [rfReplaceAll]);
end;

function TfmeImagem.ValidateImage : Boolean;
begin
  Result := True;
  if FUnsavedChangedImage then
    if Application.MessageBox(PWideChar('Imagem alterada e não salva!' +#13#10 +
                                        'Deseja continuar mesmo assim?'), 'Atenção', MB_YESNO + MB_ICONWARNING) = IDNO then
      Result := False
    else
      FUnsavedChangedImage := False;
end;

procedure TfmeImagem.ViewImageForm;
var
  viIdx: Integer;
begin
  viIdx := TfrmVisualizarImagem.VisualizarImagem(FCurrentFile, ImageEnMView1.SelectedImage, FHistory, FAfterScan);
  LoadImage(viIdx);
end;

procedure TfmeImagem.FillBack;
const
  COLORS: array[0..9] of string = ('Black&White', 'GrayScale', 'RGB', 'Palette', 'CMY', 'CMYK', 'YUV', 'YUVK', 'CIEXYZ', 'LAB');
var
  i,
  v: integer;
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
begin
  AutoAjuste;
end;

procedure TfmeImagem.AutoAjuste;
var
  viRotate : Double;
begin
  viRotate := ImageView.Proc.SkewDetection(300, 15, 0.1, true);
  ImageView.Proc.RotateAndCrop(viRotate);
  ImageEnMView1.SetImage(ImageEnMView1.SelectedImage, ImageView.IO.Bitmap);
  ImageView.Proc.ClearAllUndo;
  UpdateMenu;
  UpdateStatusBar;
end;

procedure TfmeImagem.actCheckBoxesImagemExecute(Sender: TObject);
begin
  CheckBoxesImage;
end;

procedure TfmeImagem.CheckBoxesImage;
begin
  if ImageEnMView1.Checkboxes = iecbAlways then
  begin
    ImageEnMView1.Checkboxes := iecbNone;
    ImageEnMView1.UncheckAll;
  end
  else
    ImageEnMView1.Checkboxes := iecbAlways;
end;

procedure TfmeImagem.actColarSelecaoExecute(Sender: TObject);
begin
  ImagePasteFromClip;
end;

procedure TfmeImagem.ImagePasteFromClip;
begin
  ImageView.LayersCreateFromSelection();
  ImageView.MouseInteract := [ miMoveLayers, miResizeLayers ];
  ImageView.Update();
  ImageView.Proc.SelPasteFromClip;
end;

procedure TfmeImagem.actConfigExecute(Sender: TObject);
begin
  if sbxPropriedades.Visible then
    sbxPropriedades.Visible := False
  else
    sbxPropriedades.Visible := True
end;

procedure TfmeImagem.actCopiarExecute(Sender: TObject);
begin
  ImageView.Proc.CopyToClipboard(true);
end;

procedure TfmeImagem.actCopiarSelecaoExecute(Sender: TObject);
begin
  ImageCopyToClip;
end;

procedure TfmeImagem.ImageCopyToClip;
begin
  ImageView.Proc.SelCopyToClip;
  ImageView.DeSelect;
end;

procedure TfmeImagem.actDeletarArquivoExecute(Sender: TObject);
begin
  DeleteImageFile;
end;

procedure TfmeImagem.DeleteImageFile;
begin
  if ImageEnMView1.ImageCount > 0 then
    if Application.MessageBox('Confirma deletar arquivo selecionada?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      SaveHistory;

      DeleteFile(FCurrentFile);
      Application.ProcessMessages;
      ImageView.Clear;
      ImageView.Blank;
      ImageEnMView1.Clear;
      ImageView.Blank;
      UpdateMenu;
      UpdateStatusBar;
    end;
end;

procedure TfmeImagem.actDeletarLayerExecute(Sender: TObject);
begin
  DeleteLayer;
end;

procedure TfmeImagem.DeleteLayer;
begin
  if ImageView.LayersCount > 1 then
  begin
    ImageView.LayersRemove(ImageView.LayersCurrent);
    ImageView.DeSelect;
  end;
end;

procedure TfmeImagem.actDeletarPaginaExecute(Sender: TObject);
begin
  DeleteSelectedImages;
end;

procedure TfmeImagem.DeleteSelectedImages;
var
  idx: Integer;
  viVetorIdx: TIEArrayOfInteger;
begin
  if ImageEnMView1.ImageCount > 0 then
  begin
    if ImageEnMView1.ImageCount = 1 then
      DeleteImageFile
    else
    begin
      if Application.MessageBox('Confirma deletar página selecionada?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
      begin
        ImageEnMView1.LockPaint;
        try
          if ImageEnMView1.CheckedCount > 0 then
          begin
            for idx := 0 to ImageEnMView1.ImageCount - 1 do
              if ImageEnMView1.Checked[idx] then
                Insert(idx, viVetorIdx, High(viVetorIdx));
          end
          else
          if ImageEnMView1.MultiSelectedImagesCount > 0 then
            viVetorIdx := ImageEnMView1.MultiSelectedImagesList;

          if Assigned(viVetorIdx) then
          begin
            TArray.Sort<Integer>(viVetorIdx);
            SaveHistory(viVetorIdx);
            DeleteTIFFImGroup(FCurrentFile, viVetorIdx);
          end;

          Application.ProcessMessages;
        finally
          Finalize(viVetorIdx);
          ImageEnMView1.UnlockPaint;
        end;

        LoadImage(0);
      end;
    end;
  end;
end;

procedure TfmeImagem.actExportarExecute(Sender: TObject);
begin
  with CreateMessageDialog('Gerar PDF?', mtConfirmation, [mbYes, MbNo, mbCancel]) do
  begin
    Caption := 'Páginas';
    (FindComponent('YES') as TButton).Caption := 'Todas';
    (FindComponent('NO') as TButton).Caption := 'Atual';
    (FindComponent('CANCEL') as TButton).Caption := 'Cancelar';
    ShowModal;

    if (ModalResult = mrYes) then
      GeneratePDF(-1)
    else
    if (ModalResult = mrNo) then
      GeneratePDF(ImageEnMView1.SelectedImage);

    Free;
  end;
end;

procedure TfmeImagem.actExportTiffExecute(Sender: TObject);
begin
  ExportSelImage;
end;

procedure TfmeImagem.actFitExecute(Sender: TObject);
begin
  Fit;
end;

procedure TfmeImagem.Fit;
begin
  ImageView.Fit;
end;

procedure TfmeImagem.actGirarDireitaExecute(Sender: TObject);
begin
  RotateRight;
end;

procedure TfmeImagem.RotateRight;
begin
  ImageView.Proc.Rotate(270);
  ImageEnMView1.SetImage(ImageEnMView1.SelectedImage, ImageView.IO.Bitmap);
  UpdateStatusBar;
end;

procedure TfmeImagem.actGirarEsquerdaExecute(Sender: TObject);
begin
  RotateLeft;
end;

procedure TfmeImagem.actHistoricoExecute(Sender: TObject);
begin
  LoadImageHistory;
end;

procedure TfmeImagem.RotateLeft;
begin
  ImageView.Proc.Rotate(90);
  ImageEnMView1.SetImage(ImageEnMView1.SelectedImage, ImageView.IO.Bitmap);
  UpdateStatusBar;
end;

procedure TfmeImagem.actImagemEmBrancoExecute(Sender: TObject);
begin
  AddEmptyImage;
end;

procedure TfmeImagem.actImportarExecute(Sender: TObject);
begin
  ImportImage;
end;

procedure TfmeImagem.actImprimirExecute(Sender: TObject);
begin
  PrintImage;
end;

procedure TfmeImagem.PrintImage;
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

procedure TfmeImagem.actMergeSelecaoExecute(Sender: TObject);
begin
  MergeSelect;
end;

procedure TfmeImagem.MergeSelect;
begin
  if ImageView.LayersCount > 1 then
  begin
    ImageView.LayersMergeAll;

    ImageMouseInteract;

    ImageView.IO.Params.ImageIndex := ImageEnMView1.SelectedImage;
    ImageEnMView1.SetImage(ImageEnMView1.SelectedImage, ImageView.IO.Bitmap);
  end;
end;

procedure TfmeImagem.actMoverExecute(Sender: TObject);
begin
  MoveImage;
end;

procedure TfmeImagem.MoveImage;
var
  viDest : Integer;
  viValor: String;
begin
  if ImageEnMView1.ImageCount > 0 then
  begin
    viValor := InputBox('Mover imagem para', 'Posição:', '');
    if Trim(viValor) <> '' then
    begin
       try
         viDest := StrToInt(viValor);

         if (viDest < 1) or (viDest > ImageEnMView1.ImageCount) then
         begin
           Application.MessageBox('Valor informado não é valido!', 'Atenção', MB_OK + MB_ICONWARNING);
           Exit;
         end;

         Dec(viDest);
       except
         Application.MessageBox('Valor informado não é valido!', 'Atenção', MB_OK + MB_ICONWARNING);
         Exit;
       end;
    end
    else Exit;

    ImageEnMView1.MoveImage(ImageEnMView1.SelectedImage, viDest);

    ImageView.IO.Params.ImageIndex := viDest;
    ImageEnMView1.SetImage(viDest, ImageView.IO.Bitmap);
    ImageEnMView1.MIO.SaveToFileTIFF(FCurrentFile, false);
  end;
end;

procedure TfmeImagem.actPagNextExecute(Sender: TObject);
begin
  Next;
end;

procedure TfmeImagem.Next;
var
  viIdx: Integer;
begin
  if ImageEnMView1.ImageCount > 0 then
  begin
    if ImageEnMView1.SelectedImage = -1 then
      viIdx := 0
    else
    if ImageEnMView1.SelectedImage < ImageEnMView1.ImageCount - 1 then
      viIdx := ImageEnMView1.SelectedImage + 1
    else
      viIdx := ImageEnMView1.SelectedImage;

    SelectImage(viIdx);
  end
  else
    edtBarPagina.Text := '';
end;

procedure TfmeImagem.actPagPriorExecute(Sender: TObject);
begin
  Prior;
end;

procedure TfmeImagem.Prior;
var
  viIdx: Integer;
begin
  if ImageEnMView1.ImageCount > 0 then
  begin
    if ImageEnMView1.SelectedImage = -1 then
      viIdx := 0
    else
    if ImageEnMView1.SelectedImage > 0 then
      viIdx := ImageEnMView1.SelectedImage - 1
    else
      viIdx := ImageEnMView1.SelectedImage;

    SelectImage(viIdx);
  end
  else edtBarPagina.Text := '';
end;

procedure TfmeImagem.actCortarImagemExecute(Sender: TObject);
begin
  CropImage;
end;

procedure TfmeImagem.CropImage;
begin
  if (ImageView.Selected) then
  begin
    ImageView.Proc.CropSel;

    ImageMouseInteract;

    ImageView.IO.Params.ImageIndex := ImageEnMView1.SelectedImage;
    ImageEnMView1.SetImage(ImageEnMView1.SelectedImage, ImageView.IO.Bitmap);
    UpdateStatusBar;
  end;
end;

procedure TfmeImagem.actRescannerExecute(Sender: TObject);
begin
  ReScan;
end;

procedure TfmeImagem.actResizeExecute(Sender: TObject);
begin
  //
end;

procedure TfmeImagem.RegisterAfterScan(
  const vpAfterScan: TAfterScan);
begin
  FAfterScan := vpAfterScan;
end;

procedure TfmeImagem.ReScan;
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

  try
    if ImageEnMView1.MIO.Acquire then
    begin
      try
        ImageEnMView1.MoveImage(ImageEnMView1.ImageCount - 1, viImgAtual);
        SaveImage;
        DeleteTIFFIm(FCurrentFile, viImgAtual + 1);
        Application.ProcessMessages;
      finally
        LoadImage(viImgAtual);
      end;
    end;
  finally
    TrimAppMemorySize;
  end;
end;

procedure TfmeImagem.Resize(const vpPercent: Integer);
var
  vpW: Integer;
begin
  vpW := Trunc(ImageView.IEBitmap.Width - (ImageView.IEBitmap.Width * (vpPercent / 100)));
  ImageView.Proc.Resample(
                      vpW,
                      -1,
                      rfLanczos3,
                      True);
  ImageEnMView1.SetImage(ImageEnMView1.SelectedImage, ImageView.IO.Bitmap);
  UpdateStatusBar;
end;

procedure TfmeImagem.actSalvarExecute(Sender: TObject);
begin
  if ImageEnMView1.ImageCount > 0 then
    if Application.MessageBox('Confirma salvar imagem atual?', 'Atenção', MB_YESNO + MB_ICONQUESTION) = IDYES then
      SaveImage;
end;

procedure TfmeImagem.actScannerExecute(Sender: TObject);
begin
  OpenScanner;
end;

procedure TfmeImagem.OpenFile(const vpIdx : Integer);
begin
  if FileExists(GetCurrentFile) then
  begin
    LoadImage(vpIdx);
    ZoomIN;
  end
  else
  begin
    ImageView.Clear;
    ImageEnMView1.Clear;
    ImageView.Update;
    UpdateMenu;
    UpdateStatusBar;
  end;
end;

procedure TfmeImagem.OpenScanner;
begin
  if ImageEnMView1.MIO.AcquireParams.SelectedSource.API = ieaNone then
  begin
    Messagedlg('Nenhum scanner selecionado!', mtInformation, [mbOK], 0);
    Exit;
  end;

  FillIn(ImageEnMView1);
  ImageEnMView1.DeSelect;

  try
    if ImageEnMView1.MIO.Acquire then
    begin
      Try
        SaveImage;
        DoAfterScan;
      finally
        LoadImage(0);
      end;
    end;
  finally
    TrimAppMemorySize;
  end;
end;

procedure TfmeImagem.actSelecionarAreaExecute(Sender: TObject);
begin
  ImageMouseInteract;
end;

procedure TfmeImagem.actUndoExecute(Sender: TObject);
begin
  Undo;
end;

procedure TfmeImagem.actVisualizarExecute(Sender: TObject);
begin
  ViewImageForm;
end;

procedure TfmeImagem.Undo;
var
  i: Integer;
begin
  ImageView.LayersClear;
  ImageView.Proc.Undo(False);
  ImageView.Proc.ClearAllUndo;
  ImageEnMView1.SetImage(ImageEnMView1.SelectedImage, ImageView.IO.Bitmap);
  UpdateMenu;
end;

procedure TfmeImagem.actZoomMaisExecute(Sender: TObject);
begin
  ZoomIn;
end;

procedure TfmeImagem.ZoomIN;
begin
  ImageView.ZoomIn;
end;

procedure TfmeImagem.actZoomMenosExecute(Sender: TObject);
begin
  ZoomOut;
end;

procedure TfmeImagem.ZoomOut;
begin
  ImageView.ZoomOut
end;

procedure TfmeImagem.ActivateFrame;
var
  i : Integer;
  Ini : TIniFile;
  viConfig : String;
begin
  sbxPropriedades.Visible := False;
  FCurrentFile  := '';
  FHistoryFile  := '';
  FFileSize     := '';
  FUnsavedChangedImage := False;
  FHistory             := False;
  FMenuHblt            := True;

  SetImageColor(icBlackWhite);

  ImageView.Proc.UndoLimit := 1;
  ImageView.ZoomFilter := rfFastLinear;

  // Recommended settings for TImageEnMView
  with ImageEnMView1 do
  begin
    LockUpdate;
    try
      SetModernStyling( True, 100, 100 );

      // Use better quality thumbnail drawing, Use rfFastLinear for best speed or rfLanczos3 for best quality
      ThumbnailDisplayFilter := rfFastLinear;

      SelectedImageAlwaysVisible := True; // When setting selected image, ensure that is it onscreen

      // Allow multiple selection
      EnableMultiSelect := True;
      MultiSelectionOptions := MultiSelectionOptions + [iemoRegion]; // Explorer Style

    finally
      UnlockUpdate;
    end;
  end;

  try
    // fills Twain sources
    for i := 0 to ImageEnMView1.MIO.TwainParams.SourceCount - 1 do
      cbxScanner.Properties.Items.Add(ImageEnMView1.MIO.TwainParams.SourceName[i]);

    ImageEnMView1.MIO.AcquireParams.FillListWithSources(cbxScanner.Properties.Items);

    viConfig := ExtractFilePath(Application.ExeName) + 'Imagem.ini';
    if FileExists(viConfig) then
    begin
      Ini := TIniFile.Create(viConfig);
      try
        cbxScanner.ItemIndex     := StrToInt(Ini.ReadString('Geral', 'Scanner', '0'));
        chxDialog.EditValue      := Ini.ReadString('Geral', 'Dialog', 'S');
        chxProgressBar.EditValue := Ini.ReadString('Geral', 'Progress', 'S');
        chxDuplex.EditValue      := Ini.ReadString('Geral', 'Duplex', 'N');
        edtDPIX.Text             := Ini.ReadString('Geral', 'DPIX', '300');
        edtDPIY.Text             := Ini.ReadString('Geral', 'DPIY', '300');
        cbxCores.ItemIndex       := StrToInt(Ini.ReadString('Geral', 'Cores', '0'));

        chxMiniatura.Checked               := Ini.ReadString('Geral', 'Miniatura', 'S') = 'S';
        chxMiniaturaClick(nil);

        chxDigitalizacaoColorida.Checked   := Ini.ReadString('Geral', 'Colorido', 'N') = 'S';
        chxDigitalizacaoColoridaClick(nil);

        chxImagemAutoFit.Checked           := Ini.ReadString('Geral', 'AutoFit', 'N') = 'S';
        chxImagemAutoFitClick(nil);
      finally
        FreeAndNil(Ini);
      end;

      if not chxMiniatura.Checked then
        cxSplitter1.CloseSplitter;
    end
    else
    if cbxScanner.Properties.Items.Count > 0 then
      cbxScanner.ItemIndex := 0;
  except
    on E : Exception do
      Application.MessageBox(PWideChar(E.Message), 'Erro', + MB_OK + MB_ICONERROR);
  end;
end;

procedure TfmeImagem.LoadFromFile(const vpFileName: String;
  const vpIdx: Integer; const vpMenuHblt: Boolean);
begin
  FCurrentFile := vpFileName;
  FHistoryFile := GetFileNameHistory;
  FMenuHblt    := vpMenuHblt;
  FHistory     := False;

  OpenFile(vpIdx);
end;

procedure TfmeImagem.LoadImage(const vpIdx : Integer);
var
  viCurrentFile: string;
  viIdx : Integer;
begin
  Screen.Cursor := crHourGlass;
  FFileSize:= '';
  viIdx := vpIdx;

  try
    ImageView.Clear;
    ImageEnMView1.Clear;

    viCurrentFile := GetCurrentFile;

    ImageEnMView1.MIO.LoadFromFileTIFF(viCurrentFile);
    if FileExists(viCurrentFile) then
      FFileSize:= IntToStr(Trunc(GetSizeFileName(viCurrentFile) / 1024)) + ' KB';

    ImageView.Proc.ClearAllUndo;

    if viIdx < 0 then viIdx := 0;

    SelectImage(viIdx);

    actUndo.Enabled := False;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfmeImagem.LoadImageHistory;
begin
  FHistory := not FHistory;

  if FileExists(GetCurrentFile) then
    LoadImage(0)
  else
  begin
    ImageView.Clear;
    ImageEnMView1.Clear;
    ImageView.Update;
    UpdateMenu;
    UpdateStatusBar;
  end;
end;

procedure TfmeImagem.cbxScannerPropertiesChange(Sender: TObject);
begin
  try
    ImageEnMView1.MIO.AcquireParams.SetSourceByStr(cbxScanner.Properties.Items[cbxScanner.ItemIndex]);
  finally
    FillBack;
  end;
end;

procedure TfmeImagem.chxDigitalizacaoColoridaClick(Sender: TObject);
begin
  if chxDigitalizacaoColorida.Checked then
    SetImageColor(icColorful)
  else
    SetImageColor(icBlackWhite);
end;

procedure TfmeImagem.chxImagemAutoFitClick(Sender: TObject);
begin
  if chxImagemAutoFit.Checked then
    ckbAutoFit.EditValue := 'S'
  else
    ckbAutoFit.EditValue := 'N';
end;

procedure TfmeImagem.chxMiniaturaClick(Sender: TObject);
begin
  if chxMiniatura.Checked then
    cxSplitter1.OpenSplitter
  else
    cxSplitter1.CloseSplitter;
end;

procedure TfmeImagem.ckbImagemColoridaChange(Sender: TObject);
begin
  if GetColorful then
    FImageFormat := icColorful
  else
    FImageFormat := icBlackWhite;
end;

procedure TfmeImagem.ImageMouseInteract;
begin
  if (ImageView.Selected) then
    ImageView.MouseInteract := [miZoom,miScroll]
  else
    ImageView.MouseInteract := [miSelect];
  ImageView.Deselect;

  UpdateMenu;
end;

function TfmeImagem.ConvertToTiff(const vpSource : string): string;
var
  viImagemView: TImageEnMView;
  i: Integer;
  const viFileDestino = 'C:\Temp\PDFConverted_1.tiff';
begin
  Result := '';

  if not DirectoryExists('C:\Temp') then
    ForceDirectories('C:\Temp');

  DeleteFile(viFileDestino);

  viImagemView := TImageEnMView.Create(Nil);

  try
    try
      // Load imagem
      viImagemView.MIO.LoadFromFile(vpSource);

      SetImageFormat(viImagemView);

      for i:= 0 to viImagemView.MIO.ParamsCount - 1 do
      begin
        viImagemView.SelectedImage := i;
        if viImagemView.MIO.Params[i].Width > 1240 then
          viImagemView.Proc.Resample(
                  1240,
                  -1,
                  rfLanczos3,
                  True);
      end;

      viImagemView.MIO.SaveToFileTIFF(viFileDestino, False);
      Result := viFileDestino;
    except
      on Err: Exception do
      begin
        Messagedlg('Erro ao converter para TIF!', mtInformation, [mbOK], 0);
      end;
    end;
  finally
    FreeAndNil(viImagemView);
  end;
end;

constructor TfmeImagem.Create(AOwner: TComponent);
begin
  inherited;
  ActivateFrame;
end;

destructor TfmeImagem.Destroy;
begin

  inherited;
end;

procedure TfmeImagem.DoAfterScan;
begin
  if Assigned(
    FAfterScan) then
    FAfterScan;
end;

procedure TfmeImagem.dxBarButton30Click(Sender: TObject);
begin
  Resize(TdxBarButton(Sender).Tag);
end;

procedure TfmeImagem.edtBarPaginaExit(Sender: TObject);
var
  viIdx: Integer;
begin
  if edtBarPagina.Text <> '' then
  begin
    viIdx := StrToInt(edtBarPagina.Text) - 1;

    if viIdx > ImageEnMView1.ImageCount then
      Application.MessageBox('Página não localizada!', 'Atenção', MB_OK + MB_ICONWARNING)
    else
    if not edtBarPagina.Text.Trim.IsEmpty then
      SelectImage(viIdx);
  end;
end;

procedure TfmeImagem.edtBarPaginaKeyPress(Sender: TObject; var Key: Char);
begin
  if not( key in['0'..'9',#08,#9,#13] ) then
    key:=#0;
end;

procedure TfmeImagem.ExportSelImage;
var
  idx: Integer;
  viFileExport: string;
  viVetorIdx: TIEArrayOfInteger;
begin
  if ImageEnMView1.ImageCount > 0 then
  begin
    viFileExport := ImageEnMView1.MIO.ExecuteSaveDialog('Exportar Imagem TIFF', -1, ioTIFF);

    if viFileExport <> '' then
    begin
      DeleteFile(viFileExport);

      ImageEnMView1.LockPaint;
      try
        if ImageEnMView1.CheckedCount > 0 then
        begin
          for idx := 0 to ImageEnMView1.ImageCount - 1 do
            if ImageEnMView1.Checked[idx] then
              Insert(idx, viVetorIdx, High(viVetorIdx));
        end
        else
        if ImageEnMView1.MultiSelectedImagesCount > 1 then
          viVetorIdx := ImageEnMView1.MultiSelectedImagesList;

        if Assigned(viVetorIdx) then
        begin
          TArray.Sort<Integer>(viVetorIdx);
          SaveFileIndex(viFileExport, viVetorIdx);
        end
        else
          ImageEnMView1.MIO.SaveToFileTIFF(viFileExport, False);

        Application.ProcessMessages;
      finally
        Finalize(viVetorIdx);
        ImageEnMView1.UnlockPaint;
      end;
    end;
  end;

end;

procedure TfmeImagem.btnCancelarConfigClick(Sender: TObject);
begin
  sbxPropriedades.Visible := False;
end;

procedure TfmeImagem.btnSalvarConfigClick(Sender: TObject);
var
  Ini : TIniFile;
begin
  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Imagem.ini');
  try
    Ini.WriteString('Geral', 'Scanner', IntToStr(cbxScanner.ItemIndex));
    Ini.WriteString('Geral', 'Dialog', chxDialog.EditValue);
    Ini.WriteString('Geral', 'Progress', chxProgressBar.EditValue);
    Ini.WriteString('Geral', 'Duplex', chxDuplex.EditValue);
    Ini.WriteString('Geral', 'DPIX', edtDPIX.Text);
    Ini.WriteString('Geral', 'DPIY', edtDPIY.Text);
    Ini.WriteString('Geral', 'Cores', IntToStr(cbxCores.ItemIndex));
    Ini.WriteString('Geral', 'Miniatura', chxMiniatura.EditValue);
    Ini.WriteString('Geral', 'Colorido', chxDigitalizacaoColorida.EditValue);
    Ini.WriteString('Geral', 'AutoFit', chxImagemAutoFit.EditValue);
    Ini.Free;
  finally
    Messagedlg('Configurações salvas!', mtInformation, [mbOK], 0);
  end;
end;

procedure TfmeImagem.SaveHistory(const vpVetorIdx: TIEArrayOfInteger);
begin
  if FHistoryFile.IsEmpty then
    Exit;

  SaveFileIndex(FHistoryFile, vpVetorIdx);
end;

procedure TfmeImagem.SaveFileIndex(const vpFileSave: string; const vpVetorIdx: TIEArrayOfInteger);
var
  viImagemView: TImageEnMView;
  idx : Integer;

  const viTempFile = 'C:\Temp\TempTiffDel.tif';
begin
  viImagemView := TImageEnMView.Create(Nil);

  if FileExists(vpFileSave) then
    viImagemView.MIO.LoadFromFileTIFF(vpFileSave);

  try
    for idx in vpVetorIdx do
    begin
      DeleteFile(viTempFile);
      ExtractTIFFImageFile(GetCurrentFile, viTempFile, idx);

      viImagemView.DeSelect;
      viImagemView.MIO.LoadFromFileTIFF(viTempFile);
    end;

    SetImageFormat(viImagemView, False);
    viImagemView.MIO.SaveToFileTIFF(vpFileSave, False);
  finally
    FreeAndNil(viImagemView);
  end;
end;

procedure TfmeImagem.SaveHistory;
begin
  if FHistoryFile.IsEmpty then
    Exit;

  if not CopyFile(PWideChar(FCurrentFile), PWideChar(FHistoryFile), False) then
    Abort
end;

procedure TfmeImagem.SaveImage;
begin
  Screen.Cursor := crHourGlass;
  try
    SetImageFormat(ImageEnMView1);
    ImageEnMView1.MIO.SaveToFileTIFF(FCurrentFile, false);
    ImageView.Proc.ClearAllUndo;
  finally
    Screen.Cursor := crDefault;
    FUnsavedChangedImage := False;
  end;
end;

function TfmeImagem.SelectImage(const vpIdx: integer): Boolean;
begin
  Result := False;

  if (ImageEnMView1.ImageCount > 0) and (vpIdx >= 0) then
  begin
    ImageEnMView1.SelectedImage := vpIdx;
    ImageEnMView1.CopyToIEBitmap(ImageEnMView1.SelectedImage, ImageView.IEBitmap );
    ImageView.Update;
    ImageView.Deselect;

    if GetAutoFit then
      Fit;

    UpdateMenu;
    UpdateStatusBar;

    Result := True;
  end;
end;

procedure TfmeImagem.SetImageFormat(const vpImageEnMView: TImageEnMView; const vpCompress: Boolean = True);
begin
  if IsImageColor then
  begin
    vpImageEnMView.MIO.Params[0].BitsPerSample := 24;
    vpImageEnMView.MIO.Params[0].SamplesPerPixel := 1;
    vpImageEnMView.MIO.Params[0].DpiX := FDPI;
    vpImageEnMView.MIO.Params[0].DpiY := FDPI;
    vpImageEnMView.MIO.Params[0].TIFF_Compression := ioTIFF_JPEG;

    if vpCompress then
      vpImageEnMView.MIO.DuplicateCompressionInfo;
  end
  else
  begin
    vpImageEnMView.MIO.Params[0].BitsPerSample    := 1;
    vpImageEnMView.MIO.Params[0].SamplesPerPixel  := 1;
    vpImageEnMView.MIO.Params[0].DpiX := FDPI;
    vpImageEnMView.MIO.Params[0].DpiY := FDPI;
    vpImageEnMView.MIO.Params[0].TIFF_Compression := ioTIFF_G4FAX;

    if vpCompress then
      vpImageEnMView.MIO.DuplicateCompressionInfo;
  end;
end;

procedure TfmeImagem.SetImageColor(const vpColor: TImageColor);
begin
  if vpColor = icColorful then
  begin
    ckbImagemColorida.EditValue := 'S';
    FImageFormat := icColorful;
  end
  else
  begin
    ckbImagemColorida.EditValue := 'N';
    FImageFormat := icBlackWhite;
  end;
end;


procedure TfmeImagem.LoadFromFile(const vpFileName: String;
const vpIdx: Integer;
const vpMenuHblt: Boolean;
const vpHistory: Boolean);
begin
  FCurrentFile := vpFileName;
  FHistoryFile := GetFileNameHistory;
  FMenuHblt    := vpMenuHblt;
  FHistory     := vpHistory;

  OpenFile(vpIdx);
end;

procedure TfmeImagem.UpdateStatusBar;
var
  viDpi: Integer;
begin
  if ImageEnMView1.MIO.ParamsCount > 0 then
  begin
    viDpi := ImageEnMView1.MIO.Params[ImageEnMView1.SelectedImage].Dpi;

    if viDpi = 0 then
      viDpi := ImageView.DpiX;

    StatusBar1.Panels[1].Text := FormatFloat( '0.00', (ImageView.IEBitmap.Width / viDpi * 2.54 )) + ' x ' +
                                 FormatFloat( '0.00', (ImageView.IEBitmap.Height / viDpi * 2.54 )) + ' cm';

    StatusBar1.Panels[3].Text := FFileSize;

    StatusBar1.Panels[5].Text := IntToStr(ImageEnMView1.SelectedImage+1) + ' / ' + IntToStr(ImageEnMView1.MIO.ParamsCount);

    if FHistory then
      StatusBar1.Panels[6].Text := 'Histórico'
    else
      StatusBar1.Panels[6].Text := '';

    edtBarPagina.Text      := IntToStr(ImageEnMView1.SelectedImage + 1);
    edtBarTotalPagina.Text := IntToStr(ImageEnMView1.ImageCount);
  end
  else
  begin
    StatusBar1.Panels[1].Text := '';
    StatusBar1.Panels[3].Text := '';
    StatusBar1.Panels[5].Text := '';
    StatusBar1.Panels[6].Text := '';
    edtBarPagina.Text         := '';
    edtBarTotalPagina.Text    := '';
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

procedure TfmeImagem.GeneratePDF(vpIdx: Integer = -1);
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
  viArquivo,
  viCurrentFile : String;
begin
  if ImageEnMView1.ImageCount > 0 then
  begin
    viCurrentFile := GetCurrentFile;

    SaveDialogPDF.FileName := ExtractOnlyFileName(viCurrentFile) + '.PDF';

    if SaveDialogPDF.Execute then
    begin
      Screen.Cursor := crHourGlass;
      ProgressBarFile.Position := 0;

      // Adobe PDF
      ImageEnViewPDF := TImageEnView.Create(nil);
      ImageEnViewPDF.IO.Params.PDF_PaperWidth := PaperWidth[4];
      ImageEnViewPDF.IO.Params.PDF_PaperHeight := PaperHeight[4];
      ImageEnViewPDF.IO.CreatePDFFile(SaveDialogPDF.FileName);

      try
        if vpIdx <> -1 then
        begin
          ProgressBarFile.Max := 1;
          ProgressBarFile.Position := 1;
          Application.ProcessMessages;

          ImageEnViewPDF.IO.Params.ImageIndex := vpIdx;
          ImageEnViewPDF.IO.LoadFromFileTIFF(viCurrentFile);
          ImageEnViewPDF.IO.Params.PDF_Compression := PDFCompression[3];
          ImageEnViewPDF.IO.SaveToPDF;
        end
        else
        begin
          ProgressBarFile.Max := ImageEnMView1.ImageCount - 1;

          for i := 0 to ImageEnMView1.ImageCount - 1 do
          begin
            ProgressBarFile.Position := i;
            Application.ProcessMessages;

            ImageEnViewPDF.IO.Params.ImageIndex := i;
            ImageEnViewPDF.IO.LoadFromFileTIFF(viCurrentFile);
            ImageEnViewPDF.IO.Params.PDF_Compression := PDFCompression[2];
            ImageEnViewPDF.IO.SaveToPDF;
          end;
        end;
      finally
        ImageEnViewPDF.IO.ClosePDFFile;
        FreeAndNil(ImageEnViewPDF);
      end;

      Screen.Cursor := crDefault;
      ProgressBarFile.Position := 0;
      Messagedlg('PDF gerado com sucesso!', mtInformation, [mbOK], 0);
    end;
  end
  else
    Messagedlg('Nenhuma imagem selecionada!', mtInformation, [mbOK], 0);
end;

function TfmeImagem.GetAutoFit: Boolean;
begin
  Result := (ckbAutoFit.EditValue = 'S');
end;

function TfmeImagem.GetColorful: Boolean;
begin
  Result := ckbImagemColorida.EditValue = 'S';
end;

function TfmeImagem.GetCurrentFile: string;
begin
 if not FHistory then
   Result := FCurrentFile
 else
   Result := FHistoryFile;
end;

function TfmeImagem.GetFileNameHistory: string;
var
  viDirHistory : string;
begin
  Result := '';

  viDirHistory := IncludeTrailingPathDelimiter(ExtractFilePath(FCurrentFile)) + 'historico';
  if not DirectoryExists(viDirHistory) then
    ForceDirectories(viDirHistory);

  Result:= IncludeTrailingPathDelimiter(viDirHistory) + 'H_' + ExtractFileName(FCurrentFile);
end;

function TfmeImagem.IsImageColor: Boolean;
begin
  Result := FImageFormat = icColorful;
end;

procedure TfmeImagem.ImageEnMView1DblClick(Sender: TObject);
begin
  ViewImageForm;
end;

procedure TfmeImagem.ImageEnMView1ImageSelect(Sender: TObject; idx: Integer);
begin
  if (ImageEnMView1.ImageCount > 0) then
  begin
    ImageEnMView1.CopyToIEBitmap(ImageEnMView1.SelectedImage, ImageView.IEBitmap );
    ImageView.Update;
    ImageView.Deselect;

    if GetAutoFit then
      Fit;

    UpdateMenu;
    UpdateStatusBar;
  end;
end;

procedure TfmeImagem.ImageViewImageChange(Sender: TObject);
begin
  if not FHistory then
    FUnsavedChangedImage := True;
  UpdateMenu;
end;

procedure TfmeImagem.ImportImage;
var
  fn,
  imagem: string;
  viCaminhoArquivo: string;
begin
  if OpenPictureDialog.Execute then
  begin
    Screen.Cursor := crHourGlass;

    ProgressBarFile.Position := 0;
    ProgressBarFile.Max      := OpenPictureDialog.Files.Count;
    lblConvertendo.Caption   := 'Importando Aguarde...';
    lblConvertendo.Visible   := ivAlways;
    Application.ProcessMessages;

    ImageEnMView1.LockPaint;

    try
      for viCaminhoArquivo in OpenPictureDialog.Files do
      begin
        fn := viCaminhoArquivo;
        Caption := fn;
        ProgressBarFile.Position := ProgressBarFile.Position + 1;
        Application.ProcessMessages;

        if UpperCase(ExtractFileExt(fn)) = '.PDF' then
        begin
          try
            imagem := ConverterPdfToTiff(fn);
          except
            on E: Exception do
            begin
              Messagedlg(E.Message, mtInformation, [mbOK], 0);
              Exit;
            end;
          end;
        end
        else
          imagem := ConvertToTiff(fn);

        // load image
        ImageEnMView1.DeSelect;
        ImageEnMView1.MIO.LoadFromFile(imagem);

        DeleteFile(imagem);
      end;

    finally
      ImageEnMView1.UnlockPaint;
      Screen.Cursor := crDefault;
      ProgressBarFile.Position := 0;
      lblConvertendo.Visible   := ivNever;
      DeleteFile(imagem);
    end;

    SaveImage;

    LoadImage(0);

    TrimAppMemorySize;
  end;
end;

procedure TfmeImagem.AddEmptyImage;
var
  tempbmp: TBitmap;
  idx: integer;
begin
  idx := ImageEnMView1.AppendImage;
  tempbmp := TBitmap.create;

  try
    tempbmp.Width  := 1240;
    tempbmp.Height := 1754;

    if IsImageColor then
      tempbmp.PixelFormat := pf24bit
    else
      tempbmp.PixelFormat := pf1bit;

    ImageEnMView1.SetImage(idx, tempbmp);

    SelectImage(idx);

  finally
    tempbmp.free;
    FUnsavedChangedImage := True;
  end;

end;

procedure TfmeImagem.PopupMenu1Popup(Sender: TObject);
var
  i : Integer;
begin
  for i := 0 to PopupMenu1.Items.Count - 1 do
     PopupMenu1.Items[i].Enabled := ImageEnMView1.ImageCount > 0;
end;

procedure TfmeImagem.UpdateMenu;
var
  viHblt: Boolean;
begin
  viHblt := (not FHistory) and FMenuHblt;

  actScanner.Enabled               := viHblt;
  actImportar.Enabled              := viHblt;
  actImagemEmBranco.Enabled        := viHblt;

  actUndo.Enabled                  := ImageView.Proc.CanUndo and viHblt;
  actMergeSelecao.Enabled          := (ImageView.LayersCount > 1)  and viHblt;
  actDeletarLayer.Enabled          := actMergeSelecao.Enabled and viHblt;
  actCopiarSelecao.Enabled         := ((ImageView.MouseInteract = [miSelect]) or
                                       (ImageView.MouseInteract = [ miMoveLayers, miResizeLayers ])) and viHblt;
  actColarSelecao.Enabled          := actCopiarSelecao.Enabled and viHblt;
  actCortarImagem.Enabled          := actCopiarSelecao.Enabled and viHblt;
  actImprimir.Enabled              := (ImageEnMView1.ImageCount > 0);
  actExportar.Enabled              := actImprimir.Enabled;
  actExportTiff.Enabled            := actImprimir.Enabled;
  actSalvar.Enabled                := actImprimir.Enabled and viHblt;
  actSelecionarArea.Enabled        := actImprimir.Enabled and viHblt;
  actZoomMais.Enabled              := actImprimir.Enabled;
  actZoomMenos.Enabled             := actImprimir.Enabled;
  actFit.Enabled                   := actImprimir.Enabled;
  actPagPrior.Enabled              := actImprimir.Enabled;
  actPagNext.Enabled               := actImprimir.Enabled;
  actGirarEsquerda.Enabled         := actImprimir.Enabled and viHblt;
  actGirarDireita.Enabled          := actImprimir.Enabled and viHblt;
  actAutoAjuste.Enabled            := actImprimir.Enabled and viHblt;
  actRescanner.Enabled             := actImprimir.Enabled and viHblt;
  actDeletarArquivo.Enabled        := actImprimir.Enabled and viHblt;
  actDeletarPagina.Enabled         := actImprimir.Enabled and viHblt;
  actCopiar.Enabled                := actImprimir.Enabled;
  actMover.Enabled                 := actImprimir.Enabled and viHblt;
  actResize.Enabled                := actImprimir.Enabled and viHblt;;

  edtBarPagina.ReadOnly            := not actImprimir.Enabled;

  if actCopiarSelecao.Enabled then
    ImageView.Cursor := 1785
  else
    ImageView.Cursor := crDefault;

  if FHistory then
    actHistorico.Caption := 'Fechar Histórico'
  else
    actHistorico.Caption := 'Histórico';
end;


end.
