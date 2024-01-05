unit FrameImagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Forms, System.UITypes,
  Dialogs, Menus, ActnList, ExtCtrls, ieview, iemview, iexAcquire, hyiedefs,
  cxLookAndFeelPainters, StdCtrls, cxButtons, dxBar, cxClasses, cxContainer, cxEdit,
  cxLabel, cxGraphics, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxGroupBox,
  cxCheckBox, cxProgressBar, cxBarEditItem, dxBarExtItems, cxSpinEdit, cxCalc,
  imageenview, ievect, imageenio, imageenproc, IniFiles, ExtDlgs, ComCtrls,
  cxLookAndFeels, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinOffice2007Black,
  System.Actions, cxControls, cxSplitter, cxButtonEdit, Vcl.Controls, ievision,
  StrUtils, hyieutils, iexBitmaps, iesettings, iexLayers, iexRulers;

type
  TImageColor = (icColorful, icBlackWhite);
  TImageExport = (ieCurrent, ieAll);
  TImageLoadFormat = (lfTIFF, lfUnknown);
  TImageAction = (iaAlter, iaDelete, iaPrint);
  TImageZoom = (izZoomFit, izZoom100, izZoomWidth);
  TImageActionSet = set of TImageAction;

  TAfterScan = reference to procedure(const vpPages: Integer);
  TBeforeScan = reference to procedure;
  TAfterImport = reference to procedure(const vpPages: Integer);
  TBeforeImport = reference to procedure;
  TAfterDelete = reference to procedure(const vpPage: Integer);
  TBeforeDelete = reference to procedure;
  TAfterSelectImage = reference to procedure(const vpPage: Integer);
  TOnImageChange = reference to procedure;
  TAfterReScan = reference to procedure(const vpPages: Integer);
  TBeforeREScan = reference to procedure;
  TAfterSavePageTiff = reference to function(const vpIdx, vpCount: Integer; var vpChange: Boolean): string;
  TBeforeSavePageTiff = reference to function(const vpIdx, vpCount: Integer; var vpChange: Boolean): string;
  TOnValidate = reference to function(const vpPages: Integer): Boolean;

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
    btnExcluirArquivo: TdxBarButton;
    btnExportarPDF: TdxBarButton;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    btnSalvar: TdxBarButton;
    btnCopyImage: TdxBarButton;
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
    actFit: TAction;
    btnBarPDF: TdxBarButton;
    btnConfig: TdxBarButton;
    ProgressBarFile: TdxBarProgressItem;
    actMover: TAction;
    btnMove: TdxBarButton;
    PopupMenu1: TPopupMenu;
    CopiarPgina1: TMenuItem;
    Deletar1: TMenuItem;
    DeletarPgina1: TMenuItem;
    N1: TMenuItem;
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
    btnCancelarConfig: TcxButton;
    cxLabel3: TcxLabel;
    edtDPIY: TcxTextEdit;
    actImagemEmBranco: TAction;
    dxBarSeparator1: TdxBarSeparator;
    btnImageBlank: TdxBarButton;
    dxBarSeparator2: TdxBarSeparator;
    btnBarImport: TdxBarButton;
    btnBarImpresao: TdxBarButton;
    btnBarZoommais: TdxBarButton;
    btnBarZoommFit: TdxBarButton;
    btnBarZoommenos: TdxBarButton;
    btnBarSelect: TdxBarButton;
    btnBarCrop: TdxBarButton;
    actUndo: TAction;
    btnUndo: TdxBarButton;
    dxBarSeparator3: TdxBarSeparator;
    btnSelect: TdxBarButton;
    btnBarUndo: TdxBarButton;
    actColarSelecao: TAction;
    btnPaste: TdxBarButton;
    dxBarSeparator4: TdxBarSeparator;
    actCopiarSelecao: TAction;
    btnCopy: TdxBarButton;
    actCortarImagem: TAction;
    btnCrop: TdxBarButton;
    btnBarCopy: TdxBarButton;
    btnBarPaste: TdxBarButton;
    actMergeSelecao: TAction;
    btnBarMerge: TdxBarButton;
    actDeletarLayer: TAction;
    btnDelLayer: TdxBarButton;
    ImageView: TImageEnView;
    btnImportar: TdxBarButton;
    ckbAutoFit: TcxBarEditItem;
    btnZoommais: TdxBarButton;
    btnZoommenos: TdxBarButton;
    btnZoommFit: TdxBarButton;
    ckbImagemColorida: TcxBarEditItem;
    cxGroupBox3: TcxGroupBox;
    chxDigitalizacaoColorida: TcxCheckBox;
    chxImagemAutoFit: TcxCheckBox;
    lblConvertendo: TcxBarEditItem;
    actExportTiff: TAction;
    btnExportarTiff: TdxBarButton;
    actHistorico: TAction;
    btnHistorico: TdxBarButton;
    btnBarImagem: TdxBarButton;
    actVisualizar: TAction;
    actResize: TAction;
    btnReduzir: TdxBarSubItem;
    btnReduzir10: TdxBarButton;
    btnReduzir50: TdxBarButton;
    btnReduzir25: TdxBarButton;
    btnBarPagLast: TdxBarButton;
    btnBarPagFirst: TdxBarButton;
    actPagFirst: TAction;
    actPagLast: TAction;
    PrintDialog1: TPrintDialog;
    edtBarZoom: TdxBarEdit;
    btnImprimir: TdxBarButton;
    btnVisualizar: TdxBarButton;
    N2: TMenuItem;
    Visualizar1: TMenuItem;
    Selecionar1: TMenuItem;
    N4: TMenuItem;
    CopiarSeleo1: TMenuItem;
    Selecionar2: TMenuItem;
    N5: TMenuItem;
    ColarSeleo1: TMenuItem;
    FixarImagem1: TMenuItem;
    btnHelp: TdxBarButton;
    actHelp: TAction;
    actDeletarIntervaloPagina: TAction;
    btnExcluirIntevalo: TdxBarButton;
    actZoom100: TAction;
    btnBarZoom100: TdxBarButton;
    btnZoomm100: TdxBarButton;
    actRedigitalizar: TAction;
    btnBarRedigitalizar: TdxBarButton;
    btnRedigitalizar: TdxBarButton;
    btnFixarImage: TdxBarButton;
    btnDeletarLayer: TdxBarButton;
    OpenDialog: TOpenDialog;
    chxImagemMovingScroll: TcxCheckBox;
    DeletarLayer1: TMenuItem;
    Salvar1: TMenuItem;
    N3: TMenuItem;
    GirarparaDireita1: TMenuItem;
    GirarparaEsquerda1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    actVisualizarEdicao: TAction;
    btnBarZoomWidth: TdxBarButton;
    actZoomWidth: TAction;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    ckbAssPDF: TcxBarEditItem;
    procedure actScannerExecute(Sender: TObject);
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
    procedure actAutoAjusteExecute(Sender: TObject);
    procedure actSelecionarAreaExecute(Sender: TObject);
    procedure actCopiarExecute(Sender: TObject);
    procedure btnSalvarConfigClick(Sender: TObject);
    procedure actFitExecute(Sender: TObject);
    procedure splConfigAfterClose(Sender: TObject);
    procedure splConfigAfterOpen(Sender: TObject);
    procedure actMoverExecute(Sender: TObject);
    procedure btnCancelarConfigClick(Sender: TObject);
    procedure actImagemEmBrancoExecute(Sender: TObject);
    procedure actUndoExecute(Sender: TObject);
    procedure actColarSelecaoExecute(Sender: TObject);
    procedure actCopiarSelecaoExecute(Sender: TObject);
    procedure actCortarImagemExecute(Sender: TObject);
    procedure actMergeSelecaoExecute(Sender: TObject);
    procedure actDeletarLayerExecute(Sender: TObject);
    procedure edtBarPaginaKeyPress(Sender: TObject; var Key: Char);
    procedure edtBarPaginaExit(Sender: TObject);
    procedure chxDigitalizacaoColoridaClick(Sender: TObject);
    procedure ckbImagemColoridaChange(Sender: TObject);
    procedure actExportTiffExecute(Sender: TObject);
    procedure actHistoricoExecute(Sender: TObject);
    procedure actVisualizarExecute(Sender: TObject);
    procedure chxImagemAutoFitClick(Sender: TObject);
    procedure btnReduzir10Click(Sender: TObject);
    procedure actPagFirstExecute(Sender: TObject);
    procedure actPagLastExecute(Sender: TObject);
    procedure ActionListExecute(Action: TBasicAction; var Handled: Boolean);
    procedure ImageViewImageChange(Sender: TObject);
    procedure actHelpExecute(Sender: TObject);
    procedure actDeletarIntervaloPaginaExecute(Sender: TObject);
    procedure actZoom100Execute(Sender: TObject);
    procedure cbxScannerPropertiesChange(Sender: TObject);
    procedure actRedigitalizarExecute(Sender: TObject);
    procedure actResizeExecute(Sender: TObject);
    procedure edtDPIXKeyPress(Sender: TObject; var Key: Char);
    procedure chxImagemMovingScrollClick(Sender: TObject);
    procedure ImageViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actVisualizarEdicaoExecute(Sender: TObject);
    procedure actZoomWidthExecute(Sender: TObject);
  private
    {$REGION 'Config'}
    FConfigScanner: Integer;
    FConfigDialog,
    FConfigProgressBar,
    FConfigDuplex: string;
    FConfigDPIX,
    FConfigDPIY,
    FConfigCores: Integer;
    FConfigColorido,
    FConfigAutoFit,
    FConfigMovingScroll,
    FLoadDllIEVision,
    FScannerFirstPage: Boolean;
    {$ENDREGION}

    {$REGION 'Controles'}
    FImageEnMView : TImageEnMView;
    FCurrentFile,
    FHistoryFile,
    FFileSize : string;
    FImageFormat : TImageColor;
    FUnsavedChangedImage,
    FHistory,
    FMenuHblt,
    FSelectedSource: Boolean;
    FImageAction: TImageActionSet;
    FZoomActive: TImageZoom;
    {$ENDREGION}

    {$REGION 'Eventos'}
    FImageCodeBar: TImageEnView;

    FAfterScan: TAfterScan;
    FBeforeScan: TBeforeScan;
    FAfterImport: TAfterImport;
    FBeforeImport: TBeforeImport;
    FAfterDelete: TAfterDelete;
    FBeforeDelete: TBeforeDelete;
    FAfterSelectImage: TAfterSelectImage;
    FOnImageChange: TOnImageChange;
    FAfterReScan: TAfterReScan;
    FBeforeReScan: TBeforeReScan;
    FAfterSavePageTiff: TAfterSavePageTiff;
    FBeforeSavePageTiff: TBeforeSavePageTiff;
    FOnValidate: TOnValidate;
    {$ENDREGION}

    //FrameImagem
    procedure ActivateFrame;
    procedure GetParamConfig;
    procedure SetParamConfig;
    procedure SelectedSource;
    function GetColorful: Boolean;
    function OpenFile(const vpIdx : Integer): Boolean;
    function GetIndex: Integer;
    function GetCount: Integer;
    function GetDPI: Integer;
    function GetWidth:Integer;
    function GetHeight:Integer;
    procedure ClearAllUndo;

    procedure ImageEnMViewLoadFromFile(const vpFile: string);
    procedure ImageViewLoadFromFile(const vpFile: string);

    procedure FillIn(const vpImageEnMView : TImageEnMView);
    procedure FillBack;
    procedure LoadImage(const vpIdx : Integer);
    procedure OpenScanner;
    procedure ReScanner;
    procedure ImportImage;
    procedure AddEmptyImage;

    procedure SetImageFormat(const vpImageEnView: TImageEnView);
    procedure ReplaceImage;

    procedure SaveTiffMultiPage(
      const vpImageEnMView: TImageEnMView;
      const vpInsertImageInFirstPage: Boolean = False);

    procedure PrintImage;
    procedure PrintImageAll;
    procedure GeneratePDF(const vpTipo: TImageExport);
    procedure ExportImage(const vpTipo: TImageExport);

    procedure UpdateStatusBar;
    procedure UpdateMenu;
    procedure UpdateStatusNav(const vpNav: Boolean);
    function SelectImage(const vpIdx: integer): Boolean;
    function ScrollMouseInteract: TIEMouseInteract;
    procedure ImageMouseInteract;
    function IsImageColor: Boolean;
    procedure ImageCopyToClip;
    procedure ImagePasteFromClip;

    procedure CropImage;
    procedure MergeSelect;
    procedure DeleteLayer;
    procedure Undo;
    procedure RotateLeft;
    procedure RotateRight;
    procedure AutoAjuste;
    procedure ResizeImage(const vpPercent: Integer);
    procedure ShowZoom;
    procedure ChangeImage;
    procedure Clear;

    function DeleteSelectedImages(vpVetorIdx: TIEArrayOfInteger): Boolean;
    procedure MoveImage;
    function DeleteImageFile: Boolean;
    function GetFileNameHistory: string;

    procedure SaveFileIndex(const vpFileSave: string; const vpVetorIdx: TIEArrayOfInteger);
    procedure LoadImageHistory;
    procedure SaveHistory(const vpVetorIdx: TIEArrayOfInteger); overload;
    procedure SaveHistory; overload;

    function AutoAjusteImageOldFormat: Boolean;

    procedure ViewImageForm(const vpShowModal: Boolean);

    procedure TrimAppMemorySize;

    procedure CreateDirImagem;

    function IsRegExpInterval(const vpTexto: string): Boolean;
    function IsRegExpPages(const vpTexto: string): Boolean;
    function GetIntervalIndex(const vpTexto: string): TIEArrayOfInteger;

    procedure DoAfterScan(const vpPages: Integer);
    procedure DoBeforeScan;
    procedure DoAfterImport(const vpPages: Integer);
    procedure DoBeforeImport;
    procedure DoAfterDelete(const vpPages: Integer);
    procedure DoBeforeDelete;
    procedure DoAfterSelectImage(const vpPage: Integer);
    procedure DoOnImageChange;
    procedure DoAfterReScan(const vpPages: Integer);
    procedure DoBeforeReScan;
    function DoOnValidate(const vpPages: Integer): Boolean;


    {$REGION 'Eventos para controle de digitaliza��o em lote n�o usar os dois ao mesmo tempo'}
    function DoAfterSavePageTiff(const vpIdx, vpCount: Integer; var vpChange: Boolean):string;
    function DoBeforeSavePageTiff(const vpIdx, vpCount: Integer;
      var vpChange: Boolean):string;
    {$ENDREGION}

    procedure InternalAfterScan(const vpPages: Integer);
    procedure InternalAfterImport(const vpPages: Integer);
    procedure InternalAfterDelete(const vpPages: Integer);

    function FindIEVisionDLLPath : string;
    procedure LoadDllIEVision;
    function ExtractBarCode(const vpImageEnView: TImageEnView): TStrings;

    function GetAssinarPdf: Boolean;
    function GetTextoPadrao: string;

    const FDPI = 200;

  public
    { Public declarations }
    function LoadFromFile(const vpFileName : String; const vpIdx: Integer = 0; const vpMenuHblt: Boolean = True; const vpHistory: Boolean = False): Boolean;
    procedure SetImageColor(const vpColor: TImageColor);
    function GetImageCount: Integer;
    function GetImageIndex: Integer;
    function GetCurrentFile: string;
    procedure ClearImage;
    procedure SetImageAction(const vpActions: TImageActionSet);
    procedure PrintImageAllNoPreview(const vpDialog: Boolean);
    procedure SetScannerFirstPage(const vpFirstPage: Boolean);

    function GetAutoFit: Boolean;
    procedure ZoomIN;
    procedure ZoomOut;
    procedure Zoom100;
    procedure ZoomWidth;
    procedure Fit;
    procedure SetZoomActive;

    procedure Next;
    procedure Prior;
    procedure Last;
    procedure First;

    function DetectBarCode(const vpImagePrincipal: Boolean = True): TStrings;

    procedure RegisterAfterScan(
      const vpAfterScan: TAfterScan);

    procedure RegisterBeforeScan(
      const vpBeforeScan: TBeforeScan);

    procedure RegisterAfterImport(
      const vpAfterImport: TAfterImport);

    procedure RegisterBeforeImport(
      const vpBeforeImport: TBeforeImport);

    procedure RegisterAfterDelete(
      const vpAfterDelete: TAfterDelete);

    procedure RegisterBeforeDelete(
      const vpBeforeDelete: TBeforeDelete);

    procedure RegisterAfterSelectImage(
      const vpAfterSelectImage: TAfterSelectImage);

    procedure RegisterOnImageChange(
      const vpOnImageChange: TOnImageChange);

    procedure RegisterAfterReScan(
      const vpAfterReScan: TAfterReScan);

    procedure RegisterBeforeReScan(
      const vpBeforeReScan: TBeforeReScan);

   procedure RegisterAfterSavePageTiff(
      const vpAfterSavePageTiff: TAfterSavePageTiff);

  procedure RegisterBeforeSavePageTiff(
      const vpBeforeSavePageTiff: TBeforeSavePageTiff);

    function ValidateImage : Boolean;
    procedure ValidateCurrenteFile;

    constructor Create(
      AOwner: TComponent); override;

    destructor Destroy; override;
  end;

implementation

uses
  Printers,
  RotinasImagem,
  VisualizarImagem,
  Geral.Model.Entity.Impl.Assinar.PDF,
  Generics.Collections,
  RegularExpressions,
  ShellApi,
  Rotinas,
  Controles,
  System.IOUtils;

{$R *.dfm}

function GetSizeFileName(const aFilename: String): Int64;
var
  info: TWin32FileAttributeData;
begin
  result := -1;

  if NOT GetFileAttributesEx(PWideChar(aFileName), GetFileExInfoStandard, @info) then
      EXIT;

  result := Int64(info.nFileSizeLow) or Int64(info.nFileSizeHigh shl 32);
end;

function ExtractOnlyFileName(AFileName: string): string;
var
  lFileName, lExt: String;
begin
  lExt      := ExtractFileExt(AFileName);
  lFileName := ExtractFileName(AFileName);
  Result    := StringReplace(lFileName, lExt, '', [rfReplaceAll]);
end;

procedure TfmeImagem.ValidateCurrenteFile;
begin
  if FCurrentFile.Trim.IsEmpty then
  begin
    Application.MessageBox('Nenhum nome de arquivo foi informado!', 'Aten�o', MB_OK + MB_ICONWARNING);
    Clear;
    Abort;
  end;
end;

function TfmeImagem.ValidateImage : Boolean;
begin
  Result := True;
  if FUnsavedChangedImage then
    if Application.MessageBox(PWideChar('Imagem alterada e n�o salva!' +#13#10 +
                                        'Deseja continuar mesmo assim?'), 'Aten��o', MB_YESNO + MB_ICONWARNING) = IDNO then
      Result := False
    else
    begin
      Undo;
      FUnsavedChangedImage := False;
    end;
end;

procedure TfmeImagem.ViewImageForm(const vpShowModal: Boolean);
begin
  if not FCurrentFile.IsEmpty then
    TfrmVisualizarImagem.VisualizarImagem(
      FCurrentFile,
      GetIndex,
      FHistory,
      (FMenuHblt and vpShowModal),
      FImageAction,
      FBeforeScan,
      InternalAfterScan,
      FBeforeReScan,
      FAfterReScan,
      FBeforeImport,
      InternalAfterImport,
      FBeforeDelete,
      InternalAfterDelete,
      FAfterSelectImage,
      procedure
      begin
        if vpShowModal then
          LoadImage(GetIndex);
      end,
      vpShowModal);
end;

procedure TfmeImagem.FillBack;
const
  COLORS: array[0..9] of string = ('Black&White', 'GrayScale', 'RGB', 'Palette', 'CMY', 'CMYK', 'YUV', 'YUVK', 'CIEXYZ', 'LAB');
var
  i,
  v: integer;
begin
  cbxCores.Properties.Items.Clear;

  for i := 0 to FImageEnMView.MIO.TwainParams.PixelType.Count - 1 do
  begin
    v := FImageEnMView.MIO.TwainParams.PixelType[i];
    if v <= high(COLORS) then
      cbxCores.Properties.Items.Add(COLORS[v]);
  end;
  cbxCores.ItemIndex := FConfigCores;

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
  ImageView.Proc.ClearAllUndo;
  UpdateMenu;
  UpdateStatusBar;
  ChangeImage;
end;

function TfmeImagem.AutoAjusteImageOldFormat: Boolean;
{$REGION 'Func��es'}
  function GetFileNameCopyOld: string;
  var
    viDirHistory : string;
  begin
    Result := '';

    viDirHistory := IncludeTrailingPathDelimiter(ExtractFilePath(FCurrentFile)) + 'antiga';
    if not DirectoryExists(viDirHistory) then
      ForceDirectories(viDirHistory);

    Result:= IncludeTrailingPathDelimiter(viDirHistory) +ExtractFileName(FCurrentFile);
  end;

  function ConvertTiffOldToTiffJpeg(const vpFile: string; vpExt: string): Boolean;
  var
    viFileAux: string;
  begin
    Result := False;

    if not DirectoryExists('C:\Temp') then
      CreateDir('C:\Temp');

    viFileAux := 'C:\Temp\IT7_' +  TPath.GetRandomFileName + vpExt;
    try
      if CopyFile(PWideChar(vpFile), PWideChar(viFileAux), False) then
      begin
        if DeleteFile(PWideChar(vpFile)) then
        begin
          Application.ProcessMessages;
          if RotinasImagem.SaveTiffFile(viFileAux, vpFile, True) then
             Result := FileExists(vpFile);
        end;
      end;
    finally
      DeleteFile(PWideChar(viFileAux));
    end;
  end;
{$ENDREGION}
begin
  Result := False;

  if FileExists(FCurrentFile) then
    if (RotinasImagem.GetTiffCompression(FCurrentFile) in [ioTIFF_OLDJPEG, ioTIFF_UNCOMPRESSED, ioTIFF_UNKNOWN]) then
    begin
      Screen.Cursor := crHourGlass;
      lblConvertendo.Caption := 'Convertendo imagens antigas para o novo formato...';
      lblConvertendo.Visible := ivAlways;
      Application.ProcessMessages;

      try
        if CopyFile(PWideChar(FCurrentFile), PWideChar(GetFileNameCopyOld), False) then
         Result := ConvertTiffOldToTiffJpeg(FCurrentFile, '.tiff');
      finally
        Screen.Cursor := crDefault;
        lblConvertendo.Visible := ivNever;
      end;
    end;
end;

procedure TfmeImagem.actColarSelecaoExecute(Sender: TObject);
begin
  ImagePasteFromClip;
end;

procedure TfmeImagem.ImagePasteFromClip;
begin
  if ImageView.Proc.CanPasteFromClipboard() then
  begin
    ImageView.LayersCreateFromClipboard;
    ImageView.MouseInteractGeneral := [miScroll];
    ImageView.MouseInteractLayers  := [miMoveLayers, miResizeLayers];
  end;

  ChangeImage;
end;

procedure TfmeImagem.ImageViewImageChange(Sender: TObject);
begin
  UpdateMenu;
end;

procedure TfmeImagem.ImageViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 case Key of
   vkPrior: Prior;
   vkNext : Next;
 end;
end;

procedure TfmeImagem.actConfigExecute(Sender: TObject);
begin
  if sbxPropriedades.Visible then
    sbxPropriedades.Visible := False
  else
  begin
    SelectedSource;
    FillBack;
    sbxPropriedades.Visible := True;
  end;
end;

procedure TfmeImagem.actCopiarExecute(Sender: TObject);
begin
  ImageView.Proc.CopyToClipboard;
end;

procedure TfmeImagem.actCopiarSelecaoExecute(Sender: TObject);
begin
  ImageCopyToClip;
end;

procedure TfmeImagem.ImageCopyToClip;
begin
  ImageView.Proc.CopyToClipboard(iecpSelection);
  ImageView.DeSelect;
end;

procedure TfmeImagem.ImageEnMViewLoadFromFile(const vpFile: string);
begin
  FImageEnMView.Clear;
  FImageEnMView.MIO.LoadFromFile(vpFile, FindFileFormat(vpFile));
end;

procedure TfmeImagem.ImageViewLoadFromFile(const vpFile: string);
begin
  ImageView.Clear;
  ImageView.IO.LoadFromFile(vpFile, FindFileFormat(vpFile));
end;

procedure TfmeImagem.actDeletarArquivoExecute(Sender: TObject);
begin
 DoBeforeDelete;
 if DeleteImageFile then
   DoAfterDelete(GetCount);
end;

procedure TfmeImagem.actDeletarIntervaloPaginaExecute(Sender: TObject);
var
  viVetorIdx: TIEArrayOfInteger;
  viTextoIntervalo: string;
begin
  DoBeforeDelete;

  viTextoIntervalo := EmptyStr;
  viTextoIntervalo := InputBox('Informar o intevalo (Ex.: 1-3 ou 1;2;3;)','P�ginas:', '');

  if viTextoIntervalo.Trim.IsEmpty then
    Exit;

  viVetorIdx := GetIntervalIndex(viTextoIntervalo.Trim);
  if Length(viVetorIdx) = 0 then
  begin
    Application.MessageBox('Nenhum intevalo valido informado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  try
    if DeleteSelectedImages(viVetorIdx) then
      DoAfterDelete(GetCount);
  finally
    Finalize(viVetorIdx);
  end;
end;

function TfmeImagem.DeleteImageFile: Boolean;
begin
  Result := False;
  if GetCount > 0 then
  begin
    if Application.MessageBox(PWideChar('EST� ROTINA EXCLU�RA O ARQUIVO DE IMAGEM POR COMPLETO!'+ #13#10 +
                                        'Deseja continuar com est� opera��o?'), 'Aten��o',
                                        MB_YESNO + MB_ICONWARNING + MB_DEFBUTTON2) = IDNO then
    Exit;

    if Application.MessageBox('Confirmar excluir arquivo selecionado?', 'Aten��o', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = idNo then
      Exit;

    SaveHistory;

    DeleteFile(FCurrentFile);
    Application.ProcessMessages;

    Clear;

    Result := True;
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
var
  viVetorIdx: TIEArrayOfInteger;
begin
  DoBeforeDelete;
  if Application.MessageBox('Confirmar excluir p�gina selecionada?', 'Aten��o', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    Insert(GetIndex, viVetorIdx, High(viVetorIdx));
    try
      if DeleteSelectedImages(viVetorIdx) then
        DoAfterDelete(GetCount);
    finally
      Finalize(viVetorIdx);
    end;
  end;
end;

function TfmeImagem.DeleteSelectedImages(vpVetorIdx: TIEArrayOfInteger): Boolean;
var
  viIdx,
  viCount,
  viNewIdx: Integer;
begin
  Result  := False;
  viIdx   := GetIndex;
  viCount := GetCount;

  if viCount > 0 then
  begin
    if (viCount = 1) or (viCount = Length(vpVetorIdx)) then
      DeleteImageFile
    else
    if Assigned(vpVetorIdx) then
    begin
      AutoAjusteImageOldFormat;

      Screen.Cursor := crHourGlass;
      lblConvertendo.Caption := 'Excluindo p�gina(s)...';
      lblConvertendo.Visible := ivAlways;

      try
        try
          TArray.Sort<Integer>(vpVetorIdx);
          SaveHistory(vpVetorIdx);
          DeleteTIFFImGroup(FCurrentFile, vpVetorIdx);
          Result := True;
        Except
          on E: Exception do
          begin
            Messagedlg(E.Message, mtError, [mbOK], 0);
            Exit;
          end;
        end;

        viNewIdx := viCount - Length(vpVetorIdx) - 1;
        if viIdx > viNewIdx then
          viIdx := viNewIdx;

        Application.ProcessMessages;

        LoadImage(viIdx);
      finally
        Screen.Cursor := crDefault;
        lblConvertendo.Visible   := ivNever;
      end;
    end;
  end;
end;

procedure TfmeImagem.actExportarExecute(Sender: TObject);
begin
  with CreateMessageDialog('Exportar para PDF', mtConfirmation, [mbYes, MbNo, mbCancel]) do
  begin
    Caption := 'P�ginas';
    (FindComponent('YES') as TButton).Caption := 'Todas';
    (FindComponent('NO') as TButton).Caption := 'Atual';
    (FindComponent('CANCEL') as TButton).Caption := 'Cancelar';
    ShowModal;

    if (ModalResult = mrYes) then
      GeneratePDF(ieAll)
    else
    if (ModalResult = mrNo) then
      GeneratePDF(ieCurrent);

    Free;
  end;
end;

procedure TfmeImagem.actExportTiffExecute(Sender: TObject);
begin
  with CreateMessageDialog('Exportar Imagem TIFF', mtConfirmation, [mbYes, MbNo, mbCancel]) do
  begin
    Caption := 'P�ginas';
    (FindComponent('YES') as TButton).Caption := 'Todas';
    (FindComponent('NO') as TButton).Caption := 'Atual';
    (FindComponent('CANCEL') as TButton).Caption := 'Cancelar';
    ShowModal;

    if (ModalResult = mrYes) then
      ExportImage(ieAll)
    else
    if (ModalResult = mrNo) then
      ExportImage(ieCurrent);

    Free;
  end;
end;

procedure TfmeImagem.actFitExecute(Sender: TObject);
begin
  Fit;
end;

procedure TfmeImagem.Fit;
begin
  ImageView.Fit;
  FZoomActive := izZoomFit;
  ShowZoom;
end;

procedure TfmeImagem.actGirarDireitaExecute(Sender: TObject);
begin
  RotateRight;
end;

procedure TfmeImagem.RotateRight;
begin
  ImageView.Proc.Rotate(270);
  UpdateStatusBar;
  ChangeImage;
end;

procedure TfmeImagem.actGirarEsquerdaExecute(Sender: TObject);
begin
  RotateLeft;
end;

procedure TfmeImagem.actHelpExecute(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.tri7.com.br/help/Apresentacao.html', '', '', 1);
end;

procedure TfmeImagem.actHistoricoExecute(Sender: TObject);
begin
  LoadImageHistory;
end;

procedure TfmeImagem.RotateLeft;
begin
  ImageView.Proc.Rotate(90);
  UpdateStatusBar;
  ChangeImage;
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
  if GetCount > 0 then
  begin
    with CreateMessageDialog('Imprimir?', mtConfirmation, [mbYes, MbNo, mbCancel]) do
    begin
      Caption := 'P�ginas';
      (FindComponent('YES') as TButton).Caption := 'Todas';
      (FindComponent('NO') as TButton).Caption := 'Atual';
      (FindComponent('CANCEL') as TButton).Caption := 'Cancelar';
      ShowModal;

      if (ModalResult = mrYes) then
        PrintImageAll
      else
      if (ModalResult = mrNo) then
        PrintImage;

      Free;
    end;
  end
  else
    Messagedlg('Nenhuma imagem selecionada!', mtInformation, [mbOK], 0);
end;

procedure TfmeImagem.PrintImage;
begin
  ImageView.Proc.SaveUndo(ieuImage);
  ImageView.IO.PrintPreviewParams.MarginTop    := 0.5;
  ImageView.IO.PrintPreviewParams.MarginLeft   := 0.5;
  ImageView.IO.PrintPreviewParams.MarginRight  := 0.5;
  ImageView.IO.PrintPreviewParams.MarginBottom := 0.5;
  ImageView.IO.DoPrintPreviewDialog;
  ImageView.Proc.Undo; // this removes painted annotations

end;

procedure TfmeImagem.PrintImageAll;
begin
  try
    FImageEnMView.Clear;
    ImageEnMViewLoadFromFile(GetCurrentFile);
    FImageEnMView.MIO.PrintPreviewParams.MarginTop    := 0.5;
    FImageEnMView.MIO.PrintPreviewParams.MarginLeft   := 0.5;
    FImageEnMView.MIO.PrintPreviewParams.MarginRight  := 0.5;
    FImageEnMView.MIO.PrintPreviewParams.MarginBottom := 0.5;
    FImageEnMView.MIO.DoPrintPreviewDialog('', False, 'Impress�o');
  finally
    FImageEnMView.Clear;
  end;

end;

procedure TfmeImagem.PrintImageAllNoPreview(const vpDialog: Boolean);
var
  i,
  viCount: Integer;
begin
  PrintDialog1.Copies := 1;

  if vpDialog then
    if not PrintDialog1.Execute then
      Exit;

  try
    FImageEnMView.Clear;
    ImageEnMViewLoadFromFile(GetCurrentFile);

    viCount := FImageEnMView.ImageCount - 1;

    with Printer do
    begin
      Title := 'Impress�o';
      BeginDoc;
      for i := 0 to viCount do
      begin
        FImageEnMView.MIO.PrintImage(i, Printer.Canvas, 0.5, 0.5, 0.5, 0.5, ievpCenter, iehpCenter, iesFitToPage, 0, 0, 1);
        if i < viCount then
          NewPage;
      end;
      EndDoc;
    end;
  finally
    FImageEnMView.Clear;
  end;
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

    ChangeImage;
  end;
end;

procedure TfmeImagem.actMoverExecute(Sender: TObject);
begin
  MoveImage;
end;

procedure TfmeImagem.MoveImage;
var
  viDest,
  viDestIdx,
  viIdx : Integer;
  viValor: String;
begin
  if GetCount > 0 then
  begin
    viValor := InputBox('Mover imagem para', 'Posi��o:', '');
    if Trim(viValor) <> '' then
    begin
       try
         viDest    := StrToInt(viValor);

         if (viDest < 1) or (viDest > GetCount) then
         begin
           Application.MessageBox('Valor informado n�o � valido!', 'Aten��o', MB_OK + MB_ICONWARNING);
           Exit;
         end;

         Dec(viDest);
         viDestIdx := viDest;
         viIdx     := GetIndex;

         if viDest < viIdx then
           Inc(viIdx)
         else
           Inc(viDest);


       except
         Application.MessageBox('Valor informado n�o � valido!', 'Aten��o', MB_OK + MB_ICONWARNING);
         Exit;
       end;
    end
    else Exit;

    ImageView.IO.Params.ImageIndex := viDest;
    ImageView.IO.InsertToFileTIFF(FCurrentFile);
    DeleteTIFFIm(FCurrentFile, viIdx);

    LoadImage(viDestIdx);
  end;
end;

procedure TfmeImagem.actPagFirstExecute(Sender: TObject);
begin
  First;
end;

procedure TfmeImagem.actPagLastExecute(Sender: TObject);
begin
  Last;
end;

procedure TfmeImagem.actPagNextExecute(Sender: TObject);
begin
  Next;
end;

procedure TfmeImagem.Next;
var
  viIdx: Integer;
begin
  if GetCount > 0 then
  begin
    if GetIndex = -1 then
      viIdx := 0
    else
    if GetIndex < GetCount - 1 then
      viIdx := GetIndex + 1
    else
      viIdx := GetIndex;

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
  if GetCount > 0 then
  begin
    if GetIndex = -1 then
      viIdx := 0
    else
    if GetIndex > 0 then
      viIdx := GetIndex - 1
    else
      viIdx := GetIndex;

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

    UpdateStatusBar;

    ChangeImage;
  end;
end;

procedure TfmeImagem.actRedigitalizarExecute(Sender: TObject);
begin
  ReScanner;
end;

procedure TfmeImagem.actResizeExecute(Sender: TObject);
begin
  //N�o Excluir
end;

procedure TfmeImagem.RegisterAfterDelete(const vpAfterDelete: TAfterDelete);
begin
  FAfterDelete := vpAfterDelete;
end;

procedure TfmeImagem.RegisterAfterImport(const vpAfterImport: TAfterImport);
begin
  FAfterImport := vpAfterImport
end;

procedure TfmeImagem.RegisterAfterReScan(const vpAfterReScan: TAfterReScan);
begin
  FAfterReScan := vpAfterReScan;
end;

procedure TfmeImagem.RegisterAfterSelectImage(
  const vpAfterSelectImage: TAfterSelectImage);
begin
  FAfterSelectImage := vpAfterSelectImage;
end;

procedure TfmeImagem.RegisterAfterSavePageTiff(
  const vpAfterSavePageTiff: TAfterSavePageTiff);
begin
  FAfterSavePageTiff := vpAfterSavePageTiff;
end;

procedure TfmeImagem.RegisterBeforeSavePageTiff(
  const vpBeforeSavePageTiff: TBeforeSavePageTiff);
begin
  FBeforeSavePageTiff := vpBeforeSavePageTiff;
end;

procedure TfmeImagem.RegisterAfterScan(
  const vpAfterScan: TAfterScan);
begin
  FAfterScan := vpAfterScan;
end;

procedure TfmeImagem.RegisterBeforeDelete(const vpBeforeDelete: TBeforeDelete);
begin
  FBeforeDelete := vpBeforeDelete;
end;

procedure TfmeImagem.RegisterBeforeImport(const vpBeforeImport: TBeforeImport);
begin
  FBeforeImport := vpBeforeImport;
end;

procedure TfmeImagem.RegisterBeforeReScan(const vpBeforeReScan: TBeforeReScan);
begin
  FBeforeReScan := vpBeforeREScan;
end;

procedure TfmeImagem.RegisterBeforeScan(const vpBeforeScan: TBeforeScan);
begin
  FBeforeScan := vpBeforeScan;
end;

procedure TfmeImagem.RegisterOnImageChange(
  const vpOnImageChange: TOnImageChange);
begin
  FOnImageChange := vpOnImageChange;
end;

procedure TfmeImagem.ResizeImage(const vpPercent: Integer);
var
  vpW: Integer;
begin
  vpW := Trunc(ImageView.IEBitmap.Width - (ImageView.IEBitmap.Width * (vpPercent / 100)));
  ImageView.Proc.Resample(
                      vpW,
                      -1,
                      rfLanczos3,
                      True);
  UpdateStatusBar;
  ChangeImage;
end;

procedure TfmeImagem.actSalvarExecute(Sender: TObject);
begin
  if GetCount > 0 then
    if Application.MessageBox('Confirmar salvar imagem atual?', 'Aten��o', MB_YESNO + MB_ICONQUESTION) = IDYES then
    begin
      if AutoAjusteImageOldFormat then
      begin
        ImageView.IO.Params.TIFF_Compression := ioTIFF_JPEG;
        ImageView.Update;
      end;

      try
        ReplaceImage;
        ClearAllUndo;
      finally
        FUnsavedChangedImage := False;
      end;
    end;
end;

procedure TfmeImagem.actScannerExecute(Sender: TObject);
begin
  OpenScanner;
end;

function TfmeImagem.OpenFile(const vpIdx : Integer): Boolean;
begin
  ImageView.MouseInteractGeneral := ScrollMouseInteract;

  if FileExists(GetCurrentFile) then
  begin
    Result := True;
    LoadImage(vpIdx);
  end
  else
  begin
    Result := False;
    ImageView.Clear;
    ImageView.Blank;
    UpdateMenu;
    UpdateStatusBar;
  end;
end;

procedure TfmeImagem.OpenScanner;
var
  viIdx: Integer;
begin
  AutoAjusteImageOldFormat;

  ValidateCurrenteFile;

  viIdx := GetIndex;

  DoBeforeScan;

  FImageEnMView.OnAcquireBitmap := nil;
  FImageEnMView.Clear;

  SelectedSource;

  try
    if (FImageEnMView.MIO.AcquireParams.SelectedSource.API = ieaNone) then
    begin
      Messagedlg('Nenhum scanner selecionado!', mtInformation, [mbOK], 0);
      Exit;
    end;

    FillIn(FImageEnMView);
    lblConvertendo.Caption := 'Digitalizando...';
    lblConvertendo.Visible := ivAlways;

    if not FImageEnMView.MIO.Acquire then
      Exit;

    try
      SaveTiffMultiPage(
        FImageEnMView,
        FScannerFirstPage);

      DoAfterScan(FImageEnMView.ImageCount);
    finally
      LoadImage(viIdx);
    end;
  finally
    ProgressBarFile.Position := 0;
    lblConvertendo.Visible   := ivNever;
    FImageEnMView.Clear;
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

procedure TfmeImagem.actVisualizarEdicaoExecute(Sender: TObject);
begin
  if TfrmVisualizarImagem.FormAberto and
    (Parent.ClassType <> TfrmVisualizarImagem) then
  begin
    Application.MessageBox('Visualizar de imagem se encontra aberto, feche o mesmo para poder abrir em modo de edi��o!',
                           'Aten��o',
                           MB_OK + MB_ICONWARNING);
    Exit;
  end;
  ViewImageForm(True);
end;

procedure TfmeImagem.actVisualizarExecute(Sender: TObject);
begin
  ViewImageForm(False);
end;

procedure TfmeImagem.Undo;
begin
  ImageView.LayersClear;
  ImageView.Proc.Undo(False);
  ImageView.Proc.ClearAllUndo;
  UpdateMenu;
end;

procedure TfmeImagem.actZoom100Execute(Sender: TObject);
begin
  Zoom100;
end;

procedure TfmeImagem.actZoomMaisExecute(Sender: TObject);
begin
  ZoomIn;
end;

procedure TfmeImagem.Zoom100;
begin
  ImageView.Zoom := 100;
  FZoomActive := izZoom100;
  ShowZoom;
end;

procedure TfmeImagem.ZoomIN;
begin
  ImageView.ZoomIn;
  ShowZoom;
end;

procedure TfmeImagem.ZoomWidth;
begin
  ImageView.FitToWidth;
  FZoomActive := izZoomWidth;
  ShowZoom;
end;

procedure TfmeImagem.actZoomMenosExecute(Sender: TObject);
begin
  ZoomOut;
end;

procedure TfmeImagem.actZoomWidthExecute(Sender: TObject);
begin
  ZoomWidth;
end;

procedure TfmeImagem.ZoomOut;
begin
  ImageView.ZoomOut;
  ShowZoom;
end;

procedure TfmeImagem.ActionListExecute(Action: TBasicAction;
  var Handled: Boolean);
begin
  if Action.Tag = 0 then
    Handled := not ValidateImage;
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
  FUnsavedChangedImage   := False;
  FHistory               := False;
  FMenuHblt              := True;
  FSelectedSource        := True;
  FImageAction           := [iaAlter, iaDelete, iaPrint];
  FLoadDllIEVision       := False;
  FImageCodeBar          := nil;
  FScannerFirstPage      := False;

  SetImageColor(icBlackWhite);

  ImageView.Proc.UndoLimit := 1;
  ImageView.ZoomFilter := rfFastLinear;

  try
    // fills Twain sources
    for i := 0 to ImageView.IO.TwainParams.SourceCount - 1 do
      cbxScanner.Properties.Items.Add(string(ImageView.IO.TwainParams.SourceName[i]));

    viConfig := ExtractFilePath(Application.ExeName) + 'Imagem.ini';
    if FileExists(viConfig) then
    begin
      Ini := TIniFile.Create(viConfig);
      try
        FConfigScanner     := StrToInt(Ini.ReadString('Geral', 'Scanner', '0'));
        if FConfigScanner < 0 then
          FConfigScanner := 0;
        FConfigDialog      := Ini.ReadString('Geral', 'Dialog', 'S');
        FConfigProgressBar := Ini.ReadString('Geral', 'Progress', 'S');
        FConfigDuplex      := Ini.ReadString('Geral', 'Duplex', 'N');
        FConfigDPIX        := StrToInt(IfThen(Ini.ReadString('Geral', 'DPIX', '300').Trim.IsEmpty, '300', Ini.ReadString('Geral', 'DPIX', '300')));
        FConfigDPIY        := StrToInt(IfThen(Ini.ReadString('Geral', 'DPIY', '300').Trim.IsEmpty, '300', Ini.ReadString('Geral', 'DPIY', '300')));
        FConfigCores       := StrToInt(Ini.ReadString('Geral', 'Cores', '0'));
        FConfigColorido    := Ini.ReadString('Geral', 'Colorido', 'N') = 'S';
        FConfigAutoFit     := Ini.ReadString('Geral', 'AutoFit', 'S') = 'S';
        FConfigMovingScroll:= Ini.ReadString('Geral', 'MovingScroll', 'N') = 'S';
      finally
        FreeAndNil(Ini);
      end;

    end
    else
    begin
      FConfigScanner     := 0;
      FConfigDialog      := 'S';
      FConfigProgressBar := 'S';
      FConfigDuplex      := 'N';
      FConfigDPIX        := 300;
      FConfigDPIY        := 300;
      FConfigCores       := 0;
      FConfigColorido    := False;
      FConfigAutoFit     := True;
      FConfigMovingScroll:= False;
    end;

    GetParamConfig;

    FImageEnMView.MIO.TwainParams.AppVersionInfo   := '1.0';
    FImageEnMView.MIO.TwainParams.AppManufacturer  := 'Tri7';
    FImageEnMView.MIO.TwainParams.AppProductFamily := 'Tri7 Imagem';
    FImageEnMView.MIO.TwainParams.AppProductName   := 'GED';

    chxDigitalizacaoColoridaClick(nil);
    chxImagemAutoFitClick(nil);
  except
    on E : Exception do
      Application.MessageBox(PWideChar(E.Message), 'Erro', + MB_OK + MB_ICONERROR);
  end;
end;

procedure TfmeImagem.LoadDllIEVision;
var
  sDLLPath: string;
begin
  FLoadDllIEVision := False;

  sDLLPath := FindIEVisionDLLPath();
  if sDLLPath <> '' then
    IEInitialize_ievision(sDLLPath, False); // Initialize DLL in custom location

  Application.ProcessMessages;

  if not IEVisionAvailable() then
  begin
    ShowMessage('Esta vers�o requer o plug-in, v' + IEVC_EXPECTED_LIBRARY_VERSION);
    Abort;
  end;

  FLoadDllIEVision := True;
end;

function TfmeImagem.LoadFromFile(const vpFileName: String;
  const vpIdx: Integer; const vpMenuHblt: Boolean;
  const vpHistory: Boolean): Boolean;
begin
  FHistory     := vpHistory;
  FMenuHblt    := vpMenuHblt;
  FCurrentFile := vpFileName;
  FHistoryFile := GetFileNameHistory;

  ValidateCurrenteFile;

  Result := OpenFile(vpIdx);

  if TfrmVisualizarImagem.FormAberto and
    (Parent.ClassType <> TfrmVisualizarImagem) then
    ViewImageForm(False);
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

    viCurrentFile := GetCurrentFile;

    FFileSize:= IntToStr(Trunc(GetSizeFileName(viCurrentFile) / 1024)) + ' KB';

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
    LoadFromFile(FCurrentFile, 0, True, FHistory)
  else
    Clear;
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

procedure TfmeImagem.chxImagemMovingScrollClick(Sender: TObject);
begin
  FConfigMovingScroll            := chxImagemMovingScroll.EditValue = 'S';
  ImageView.MouseInteractGeneral := ScrollMouseInteract
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
  if ImageView.Selected or (ImageView.MouseInteractGeneral = [miSelect]) then
    ImageView.MouseInteractGeneral := ScrollMouseInteract
  else
  begin
    ImageView.LayersCurrent := 0;
    ImageView.MouseInteractGeneral := [miSelect];
  end;
  ImageView.Deselect;

  UpdateMenu;
end;

procedure TfmeImagem.Clear;
begin
  ImageView.Clear;
  ImageView.Blank;
  UpdateMenu;
  UpdateStatusBar;
end;

procedure TfmeImagem.ClearAllUndo;
begin
  ImageView.Proc.ClearAllUndo;
end;

procedure TfmeImagem.ClearImage;
begin
  FCurrentFile := EmptyStr;
  FHistoryFile := EmptyStr;
  FMenuHblt    := False;
  Clear;
end;

constructor TfmeImagem.Create(AOwner: TComponent);
begin
  inherited;
  FImageEnMView := TImageEnMView.Create(Self);
  FImageEnMView.Visible     := False;
  FImageEnMView.DisplayMode := mdSingle;
  FImageEnMView.StoreType   := ietNormal;

  ActivateFrame;
end;

procedure TfmeImagem.CreateDirImagem;
var
  viDiretory: string;
begin
  viDiretory := ExtractFilePath(FCurrentFile);
  if not DirectoryExists(viDiretory) then
    ForceDirectories(viDiretory);
end;

destructor TfmeImagem.Destroy;
begin
  FreeAndNil(FImageEnMView);
  TfrmVisualizarImagem.Fechar;
  inherited;
end;

function TfmeImagem.DetectBarCode(const vpImagePrincipal: Boolean = True): TStrings;
begin
  Result := nil;

  if vpImagePrincipal then
    Result := ExtractBarCode(ImageView)
  else
  if Assigned(FImageCodeBar) then
    Result := ExtractBarCode(FImageCodeBar);
end;

function TfmeImagem.ExtractBarCode(const vpImageEnView: TImageEnView): TStrings;
var
  s: TIEVisionBarCodeSymbol;
  i: integer;
  selRect: TIEVisionRect;
  m_symbols: TIEVisionVectorObjRef;
begin
  if not FLoadDllIEVision then
    LoadDllIEVision;

  Result := TStringList.Create;

  try
    Result.Clear;

    vpImageEnView.SelectionBase := iesbBitmap;

    selRect := IEVisionRect(0, 0, 0, 0);
    if vpImageEnView.Selected then
      with vpImageEnView do
        selRect := IEVisionRect(SelX1, SelY1, SelX2 - SelX1 + 1, SelY2 - SelY1 + 1);

    m_symbols := IEVisionLib.createBarCodeScanner().scan(vpImageEnView.IEBitmap.GetIEVisionImage(), selRect);

    for i := 0 to m_symbols.size() - 1 do
    begin
      s := TIEVisionBarCodeSymbol( m_symbols.getObj(i) );
      Result.Add(s.getSymbolType().c_str() + '=' +  s.getData().c_str());
    end;

  except
    on E: Exception do
    begin
      MessageDlg('Ocorreu um erro ao processar esta imagem!', mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfmeImagem.DoAfterDelete(const vpPages: Integer);
begin
  if Assigned(
    FAfterDelete) then
    FAfterDelete(vpPages);
end;

procedure TfmeImagem.DoAfterImport(const vpPages: Integer);
begin
  if Assigned(
    FAfterImport) then
    FAfterImport(vpPages);
end;

procedure TfmeImagem.DoAfterReScan(const vpPages: Integer);
begin
  if Assigned(
    FAfterReScan) then
    FAfterREScan(vpPages);
end;

procedure TfmeImagem.DoAfterSelectImage(const vpPage: Integer);
begin
   if Assigned(
    FAfterSelectImage) then
    FAfterSelectImage(vpPage);
end;

function TfmeImagem.DoAfterSavePageTiff(const vpIdx, vpCount: Integer; var vpChange: Boolean): string;
begin
  Result := EmptyStr;

  if Assigned(
    FAfterSavePageTiff) then
    Result := FAfterSavePageTiff(vpIdx, vpCount, vpChange);
end;

procedure TfmeImagem.DoAfterScan(const vpPages: Integer);
begin
  if Assigned(
    FAfterScan) then
    FAfterScan(vpPages);
end;

procedure TfmeImagem.DoBeforeDelete;
begin
 if Assigned(
    FBeforeDelete) then
    FBeforeDelete;
end;

procedure TfmeImagem.DoBeforeImport;
begin
  if Assigned(
    FBeforeImport) then
    FBeforeImport;
end;

procedure TfmeImagem.DoBeforeReScan;
begin
   if Assigned(
    FBeforeReScan) then
    FBeforeReScan;
end;

function TfmeImagem.DoOnValidate(const vpPages: Integer): Boolean;
begin
  Result := True;

  if not Assigned(FOnValidate) then
    Exit;

  Result := FOnValidate(vpPages);
end;

function TfmeImagem.DoBeforeSavePageTiff(const vpIdx, vpCount: Integer;
  var vpChange: Boolean): string;
begin
  Result := EmptyStr;

  if Assigned(
    FBeforeSavePageTiff) then
    Result := FBeforeSavePageTiff(vpIdx, vpCount, vpChange);
end;

procedure TfmeImagem.DoBeforeScan;
begin
  if Assigned(
    FBeforeScan) then
    FBeforeScan;
end;

procedure TfmeImagem.DoOnImageChange;
begin
  if Assigned(
    FOnImageChange) then
    FOnImageChange;
end;

procedure TfmeImagem.btnReduzir10Click(Sender: TObject);
begin
  ResizeImage(TdxBarButton(Sender).Tag);
end;

procedure TfmeImagem.edtBarPaginaExit(Sender: TObject);
var
  viIdx: Integer;
begin
  if edtBarPagina.Text <> '' then
  begin
    viIdx := StrToInt(edtBarPagina.Text) - 1;

    if viIdx > GetCount then
      Application.MessageBox('P�gina n�o localizada!', 'Aten��o', MB_OK + MB_ICONWARNING)
    else
    if not edtBarPagina.Text.Trim.IsEmpty then
      SelectImage(viIdx);
  end;
end;

procedure TfmeImagem.edtBarPaginaKeyPress(Sender: TObject; var Key: Char);
begin
  if not CharInSet(key , ['0'..'9',#08,#9,#13]) then
    key:=#0;
end;

procedure TfmeImagem.edtDPIXKeyPress(Sender: TObject; var Key: Char);
begin
  if not (CharInSet(Key, ['0'..'9',#8,#13])) then
    Key:= #0;
end;

procedure TfmeImagem.ExportImage(const vpTipo: TImageExport);
var
  viFileExport: string;
begin
  if GetCount > 0 then
  begin
    viFileExport := ImageView.IO.ExecuteSaveDialog('Exportar Imagem TIF', -1, ioTIFF);

    if viFileExport <> '' then
    begin
      Screen.Cursor := crHourGlass;
      try
        DeleteFile(viFileExport);

        if vpTipo = ieAll then
          CopyFile(PWideChar(GetCurrentFile), PWideChar(viFileExport), False)
        else
        if vpTipo = ieCurrent then
          ExtractTIFFImageFile(GetCurrentFile, viFileExport, GetIndex);
      finally
        Screen.Cursor := crDefault;
      end;

      Messagedlg('TIF exportado com sucesso!', mtInformation, [mbOK], 0);

      Rotinas.OpenFileInExplorer(viFileExport);
    end;
  end
  else
    Messagedlg('Nenhuma imagem selecionada!', mtInformation, [mbOK], 0);
end;

procedure TfmeImagem.btnCancelarConfigClick(Sender: TObject);
begin
  sbxPropriedades.Visible := False;
end;

procedure TfmeImagem.btnSalvarConfigClick(Sender: TObject);
var
  Ini : TIniFile;
begin
  if Trim(edtDPIX.Text) = EmptyStr then
  begin
    Application.MessageBox('DPIX n�o pode estar vazio!', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtDPIX.SetFocus;
    Exit;
  end;

  if Trim(edtDPIY.Text) = EmptyStr then
  begin
    Application.MessageBox('DPIY n�o pode estar vazio!', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtDPIY.SetFocus;
    Exit;
  end;

  Ini := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Imagem.ini');
  try
    if cbxScanner.ItemIndex >= 0 then
      Ini.WriteString('Geral', 'Scanner', IntToStr(cbxScanner.ItemIndex));
    Ini.WriteString('Geral', 'Dialog', chxDialog.EditValue);
    Ini.WriteString('Geral', 'Progress', chxProgressBar.EditValue);
    Ini.WriteString('Geral', 'Duplex', chxDuplex.EditValue);
    Ini.WriteString('Geral', 'DPIX', edtDPIX.Text);
    Ini.WriteString('Geral', 'DPIY', edtDPIY.Text);
    Ini.WriteString('Geral', 'Cores', IntToStr(cbxCores.ItemIndex));
    Ini.WriteString('Geral', 'Colorido', chxDigitalizacaoColorida.EditValue);
    Ini.WriteString('Geral', 'AutoFit', chxImagemAutoFit.EditValue);
    Ini.WriteString('Geral', 'MovingScroll', chxImagemMovingScroll.EditValue);
    Ini.Free;
    SetParamConfig;
  finally
    Messagedlg('Configura��es salvas!', mtInformation, [mbOK], 0);
    btnCancelarConfigClick(nil);
  end;
end;

procedure TfmeImagem.cbxScannerPropertiesChange(Sender: TObject);
begin
  if sbxPropriedades.Visible then
    if cbxScanner.ItemIndex >= 0 then
    begin
      //FImageEnMView.MIO.TwainParams.SelectedSource := cbxScanner.ItemIndex;
      FImageEnMView.MIO.AcquireParams.SetSource(ieaTwain, cbxScanner.Properties.Items[cbxScanner.ItemIndex]);
      FillBack;

      FSelectedSource := False;
    end
    else
    begin
      Messagedlg('Nenhum scanner selecionado!', mtInformation, [mbOK], 0);
      Abort;
    end;
end;

procedure TfmeImagem.ChangeImage;
begin
  if not FHistory then
    FUnsavedChangedImage := True;
end;

procedure TfmeImagem.SaveHistory(const vpVetorIdx: TIEArrayOfInteger);
begin
  if FHistoryFile.IsEmpty then
    Exit;

  SaveFileIndex(FHistoryFile, vpVetorIdx);
end;

procedure TfmeImagem.SaveFileIndex(const vpFileSave: string; const vpVetorIdx: TIEArrayOfInteger);
var
  idx,
  viCount : Integer;
  viFileAux: string;
  viImageEnVect : TImageEnVect;
begin
  if not DirectoryExists('C:\Temp') then
    CreateDir('C:\Temp');

  viFileAux := 'C:\Temp\IT7_' +  TPath.GetRandomFileName + '.tiff';

  viImageEnVect := TImageEnVect.Create(Self);
  viImageEnVect.Visible := False;

  try
    for idx in vpVetorIdx do
    begin
      viImageEnVect.Clear;

      DeleteFile(viFileAux);
      ExtractTIFFImageFile(GetCurrentFile, viFileAux, idx);

      if FileExists(viFileAux) then
      begin
        viImageEnVect.IO.Params.ImageIndex := 0;
        viImageEnVect.IO.LoadFromFile(viFileAux, FindFileFormat(viFileAux));

        viCount := RotinasImagem.GetImageCount(vpFileSave);

        if viCount = 0 then
          viImageEnVect.IO.SaveToFileTIFF(vpFileSave)
        else
        begin
          viImageEnVect.IO.Params.ImageIndex := viCount;
          viImageEnVect.IO.InsertToFileTIFF(vpFileSave);
        end;
      end;

    end;
  finally
    FreeAndNil(viImageEnVect);
    DeleteFile(viFileAux);
  end;
end;

procedure TfmeImagem.SaveHistory;
begin
  if FHistoryFile.IsEmpty then
    Exit;

  if not CopyFile(PWideChar(FCurrentFile), PWideChar(FHistoryFile), False) then
    Abort
end;

procedure TfmeImagem.ReplaceImage;
begin
  ImageView.IO.ReplaceFileTIFF(FCurrentFile);
  FFileSize:= IntToStr(Trunc(GetSizeFileName(FCurrentFile) / 1024)) + ' KB';
  UpdateStatusBar;
  DoOnImageChange;
end;

procedure TfmeImagem.ReScanner;
var
  viIdx: Integer;
begin
  if GetCount = 0 then
  begin
    Application.MessageBox('Est� rotina n�o pode ser executada, pois n�o existe nenhuma imagem selecionada para redigitalizar!', 'Aten��o', MB_OK + MB_ICONWARNING);
    Exit;
  end;

  AutoAjusteImageOldFormat;

  DoBeforeReScan;

  if Application.MessageBox(PWideChar('Est� rotina exclu�ra apenas a p�gina atual e substituir� pela nova digitaliza��o.' + #13#10 +
                                      'Deseja continuar com est� opera��o?'), 'Aten��o',
                                      MB_YESNO + MB_ICONQUESTION) = IDNO then
    Exit;

  viIdx := GetIndex;

  FImageEnMView.Clear;
  SelectedSource;

  try
    if (FImageEnMView.MIO.AcquireParams.SelectedSource.API = ieaNone) then
    begin
      Messagedlg('Nenhum scanner selecionado!', mtInformation, [mbOK], 0);
      Exit;
    end;

    FillIn(FImageEnMView);
    lblConvertendo.Caption := 'Redigitalizando...';
    lblConvertendo.Visible := ivAlways;

    FImageEnMView.LockUpdate;

    if FImageEnMView.MIO.Acquire then
    begin
      Try
        FImageEnMView.CopyToIEBitmap(0, ImageView.IEBitmap );
        SetImageFormat(ImageView);
        ReplaceImage;
        ClearAllUndo;
        DoAfterReScan(GetCount);
      finally
        LoadImage(viIdx);
      end;
    end;
  finally
    ProgressBarFile.Position := 0;
    lblConvertendo.Visible   := ivNever;
    FImageEnMView.Clear;
    FImageEnMView.UnLockUpdate;
    TrimAppMemorySize;
  end;

end;

procedure TfmeImagem.SaveTiffMultiPage(
  const vpImageEnMView: TImageEnMView;
  const vpInsertImageInFirstPage: Boolean = False);
var
 viCount,
 i: Integer;
 viImageEnVect : TImageEnVect;
 viCurrentFileAux: string;
 viChangeImage: Boolean;
begin
  CreateDirImagem;

  viCount := RotinasImagem.GetImageCount(GetCurrentFile);
  viCurrentFileAux := EmptyStr;

  lblConvertendo.Caption := 'Salvando...';
  Application.ProcessMessages;

  ProgressBarFile.Position := 0;
  ProgressBarFile.Max      := vpImageEnMView.ImageCount - 1;

  viImageEnVect := TImageEnVect.Create(Self);
  viImageEnVect.Visible := False;
  FImageCodeBar := viImageEnVect;

  try
    for i := 0 to vpImageEnMView.ImageCount - 1 do
    begin
      ProgressBarFile.Position := i;
      Application.ProcessMessages;

      viImageEnVect.Clear;
      vpImageEnMView.CopyToIEBitmap(i, viImageEnVect.IEBitmap );

      //Executa evento externo
      {$REGION 'Before Save Imagem'}
      viCurrentFileAux := DoBeforeSavePageTiff(i+1, vpImageEnMView.ImageCount, viChangeImage);

      if not viCurrentFileAux.Trim.IsEmpty then
        if (viCurrentFileAux <> FCurrentFile) or (viChangeImage) then
        begin
          FCurrentFile := viCurrentFileAux;
          CreateDirImagem;
          viCount := RotinasImagem.GetImageCount(FCurrentFile);
        end;
      {$ENDREGION}

      SetImageFormat(viImageEnVect);

      if viCount = 0 then
        viImageEnVect.IO.SaveToFileTIFF(FCurrentFile)
      else
      begin
        if vpInsertImageInFirstPage then
          viImageEnVect.IO.Params.ImageIndex := 0
        else
          viImageEnVect.IO.Params.ImageIndex := viCount;

        viImageEnVect.IO.InsertToFileTIFF(FCurrentFile);
      end;

      Inc(viCount);

      //Executa evento externo
      {$REGION 'After Save Imagem'}
      viChangeImage := False;
      viCurrentFileAux := DoAfterSavePageTiff(i+1, vpImageEnMView.ImageCount, viChangeImage);

      if not viCurrentFileAux.Trim.IsEmpty then
        if (viCurrentFileAux <> FCurrentFile) or (viChangeImage) then
        begin
          FCurrentFile := viCurrentFileAux;
          CreateDirImagem;
          viCount := RotinasImagem.GetImageCount(FCurrentFile);
        end;
      {$ENDREGION}

    end;
  finally
    FreeAndNil(viImageEnVect);
    ProgressBarFile.Position := 0;
  end;
end;

function TfmeImagem.ScrollMouseInteract: TIEMouseInteract;
begin
  if FConfigMovingScroll then
    Result := [miScroll, miMovingScroll]
  else
    Result := [miScroll];
end;

procedure TfmeImagem.SetImageFormat(const vpImageEnView: TImageEnView);
begin
  if IsImageColor then
  begin
    vpImageEnView.IO.Params.BitsPerSample   := 8;
    vpImageEnView.IO.Params.SamplesPerPixel := 3;
    vpImageEnView.IO.Params.DpiX  := FDPI;
    vpImageEnView.IO.Params.DpiY  := FDPI;
    vpImageEnView.IO.Params.TIFF_JPEGQuality := 50;
    vpImageEnView.IO.Params.TIFF_Compression := ioTIFF_JPEG;
    vpImageEnView.IO.Update;
  end
  else
  begin
    vpImageEnView.Proc.ConvertToBWThreshold(165);
    vpImageEnView.IO.Params.TIFF_PhotometInterpret := ioTIFF_BLACKISZERO;
    vpImageEnView.IO.Params.BitsPerSample    := 1;
    vpImageEnView.IO.Params.SamplesPerPixel  := 1;
    vpImageEnView.IO.Params.DpiX  := FDPI + 100;
    vpImageEnView.IO.Params.DpiY  := FDPI + 100;
    vpImageEnView.IO.Params.TIFF_Compression := ioTIFF_G4FAX;
    vpImageEnView.IO.Update;
  end;
end;

function TfmeImagem.SelectImage(const vpIdx: integer): Boolean;
begin
  Result := False;

  if (vpIdx >= 0) then
  begin
    ImageView.IO.Params.ImageIndex := vpIdx;

    ImageViewLoadFromFile(GetCurrentFile);

    ImageView.Deselect;

    ImageView.Proc.ClearAllUndo;

    SetZoomActive;

    UpdateStatusBar;
    DoAfterSelectImage(vpIdx + 1);

    Result := True;
  end
  else
    DoAfterSelectImage(-1);
end;

procedure TfmeImagem.SetImageAction(const vpActions: TImageActionSet);
begin
  FImageAction := vpActions;
  UpdateMenu;
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

procedure TfmeImagem.SetParamConfig;
begin
  FConfigScanner     := cbxScanner.ItemIndex;
  FConfigDialog      := chxDialog.EditValue;
  FConfigProgressBar := chxProgressBar.EditValue;
  FConfigDuplex      := chxDuplex.EditValue;
  FConfigDPIX        := StrToInt(edtDPIX.Text);
  FConfigDPIY        := StrToInt(edtDPIY.Text);
  FConfigCores       := cbxCores.ItemIndex;
  FConfigColorido    := chxDigitalizacaoColorida.EditValue = 'S';
  FConfigAutoFit     := chxImagemAutoFit.EditValue = 'S';
  FConfigMovingScroll:= chxImagemMovingScroll.EditValue = 'S';
end;

procedure TfmeImagem.SetScannerFirstPage(const vpFirstPage: Boolean);
begin
  FScannerFirstPage := vpFirstPage;
end;

procedure TfmeImagem.SetZoomActive;
begin
  if GetAutoFit then
   Fit
  else
  begin
    case FZoomActive of
      izZoomFit: Fit;
      izZoom100: Zoom100;
      else
        ZoomWidth;
    end;
  end;
end;

procedure TfmeImagem.GetParamConfig;
begin
  if cbxScanner.Properties.Items.Count > 0 then
    cbxScanner.ItemIndex           := FConfigScanner;

  chxDialog.Checked                := FConfigDialog = 'S';
  chxProgressBar.Checked           := FConfigProgressBar = 'S';
  chxDuplex.Checked                := FConfigDuplex = 'S';
  edtDPIX.Text                     := FConfigDPIX.ToString;
  edtDPIY.Text                     := FConfigDPIY.ToString;
  cbxCores.ItemIndex               := FConfigCores;
  chxDigitalizacaoColorida.Checked := FConfigColorido;
  chxImagemAutoFit.Checked         := FConfigAutoFit;
  chxImagemMovingScroll.Checked    := FConfigMovingScroll;

  if not FConfigAutoFit then
    FZoomActive := izZoomWidth;
end;

procedure TfmeImagem.ShowZoom;
begin
  if not ImageView.IsEmpty then
    edtBarZoom.Text := IntToStr(Round(ImageView.Zoom))
  else
    edtBarZoom.Text := '';

  btnBarZoommFit.Down  := FZoomActive = izZoomFit;
  btnBarZoom100.Down   := FZoomActive = izZoom100;
  btnBarZoomWidth.Down := FZoomActive = izZoomWidth;
end;

procedure TfmeImagem.Last;
begin
  SelectImage(GetCount-1);
end;

procedure TfmeImagem.SelectedSource;
begin
  if FSelectedSource then
  begin
    if cbxScanner.Properties.Items.Count > 0 then
      FImageEnMView.MIO.TwainParams.SelectedSource   := FConfigScanner;
    FSelectedSource := False;
  end;
end;

procedure TfmeImagem.UpdateStatusBar;
var
  viDpi: Integer;
begin
  if GetCount > 0 then
  begin
    viDpi := GetDPI;

    StatusBar1.Panels[1].Text := FormatFloat( '0.00', (GetWidth / viDpi * 2.54 )) + ' x ' +
                                 FormatFloat( '0.00', (GetHeight / viDpi * 2.54 )) + ' cm';

    StatusBar1.Panels[3].Text := FFileSize;

    StatusBar1.Panels[5].Text := IntToStr(GetIndex+1) + ' / ' + IntToStr(GetCount);

    if FHistory then
      StatusBar1.Panels[6].Text := 'Hist�rico'
    else
      StatusBar1.Panels[6].Text := '';

    edtBarPagina.Text      := IntToStr(GetIndex + 1);
    edtBarTotalPagina.Text := IntToStr(GetCount);
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

procedure TfmeImagem.UpdateStatusNav(const vpNav: Boolean);
var
  viPrev,
  viNext: Boolean;
begin
  viPrev := ( GetIndex > 0 );
  viNext := ( GetIndex < (GetCount - 1) );

  actPagFirst.Enabled  := vpNav and viPrev;
  actPagPrior.Enabled  := vpNav and viPrev;
  actPagNext.Enabled   := vpNav and viNext;;
  actPagLast.Enabled   := vpNav and viNext;
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

procedure TfmeImagem.FillIn(const vpImageEnMView : TImageEnMView);
begin
  vpImageEnMView.MIO.TwainParams.VisibleDialog            := FConfigDialog = 'S';
  vpImageEnMView.MIO.TwainParams.ProgressIndicators       := FConfigProgressBar = 'S';
  vpImageEnMView.MIO.TwainParams.AcquireFrameLeft         := 0;
  vpImageEnMView.MIO.TwainParams.AcquireFrameTop          := 0;
  vpImageEnMView.MIO.TwainParams.AcquireFrameRight        := 0;
  vpImageEnMView.MIO.TwainParams.AcquireFrameBottom       := 0;
  vpImageEnMView.MIO.TwainParams.PixelType.CurrentValue   := FConfigCores;
  vpImageEnMView.MIO.TwainParams.YResolution.CurrentValue := FConfigDPIX;
  vpImageEnMView.MIO.TwainParams.XResolution.CurrentValue := FConfigDPIY;
  vpImageEnMView.MIO.TwainParams.BufferedTransfer         := True;
  vpImageEnMView.MIO.TwainParams.DuplexEnabled            := FConfigDuplex = 'S';
end;

procedure TfmeImagem.First;
begin
  SelectImage(0);
end;

function TfmeImagem.GetTextoPadrao: string;
begin
  Result := dtmControles.BuscarParametroOutroSistema(
              'WATERMARK_FRASE_PADRAO_TEXTO',
              'PDF',
              'PRINCIPAL',
              '5');
end;

procedure TfmeImagem.GeneratePDF(const vpTipo: TImageExport);
Const
  PaperWidth: array[0..11] of integer = (2380, 1684, 1190, 842, 595, 421, 297, 501, 612, 612, 1224, 792);
  PaperHeight: array[0..11] of integer = (3368, 2380, 1684, 1190, 842, 595, 421, 709, 792, 1008, 792, 1224);

var
  ImageEnViewPDF : TImageEnView;
  i,
  viPaginas :Integer;
  viCurrentFile,
  viFraseIdent : String;
  viAssinatura: TAssinarPDF;
  viAssinarPDF: Boolean;
begin
  viPaginas := GetCount;

  if viPaginas > 0 then
  begin
    viCurrentFile := GetCurrentFile;
    viAssinarPDF  := GetAssinarPdf;

    SaveDialogPDF.FileName := ExtractOnlyFileName(viCurrentFile) + '.PDF';

    if SaveDialogPDF.Execute then
    begin
      //Assinar PDF - Criar Assinador
      viAssinatura := TAssinarPDF.Create(taPADES);

      try
        if viAssinarPDF then
          if not viAssinatura.SelecionarCertificadoDigital then
            Exit;

        Screen.Cursor := crHourGlass;
        ProgressBarFile.Position := 0;
        // Adobe PDF
        ImageEnViewPDF := TImageEnView.Create(nil);
        ImageEnViewPDF.IO.Params.PDF_PaperWidth := PaperWidth[4];
        ImageEnViewPDF.IO.Params.PDF_PaperHeight := PaperHeight[4];
        ImageEnViewPDF.IO.CreatePDFFile(SaveDialogPDF.FileName);

        try
          if vpTipo = ieCurrent then
          begin
            ProgressBarFile.Max := 1;
            ProgressBarFile.Position := 1;
            Application.ProcessMessages;

            ImageEnViewPDF.IO.Params.ImageIndex := GetIndex;
            ImageEnViewPDF.IO.LoadFromFile(viCurrentFile, FindFileFormat(viCurrentFile));

            //Assinar PDF - Incluir Texto Assinatura
            if viAssinarPDF then
            begin
              RotinasImagem.CreateBorderedImage(ImageEnViewPDF);
              viFraseIdent := GetTextoPadrao +#13#10+
                              'P�gina: 1 de 1 ' +#13#10+
                              'Data: ' + DateToStr(date);
              RotinasImagem.SetTextoRodapeImage(ImageEnViewPDF, viFraseIdent);
            end;

            ImageEnViewPDF.IO.Params.PDF_Compression := ioPDF_JPEG;
            ImageEnViewPDF.IO.SaveToPDF;
          end
          else
          begin
            ProgressBarFile.Max := viPaginas - 1;

            for i := 0 to viPaginas - 1 do
            begin
              ProgressBarFile.Position := i;
              Application.ProcessMessages;

              ImageEnViewPDF.IO.Params.ImageIndex := i;
              ImageEnViewPDF.IO.LoadFromFile(viCurrentFile, FindFileFormat(viCurrentFile));

              //Assinar PDF - Incluir Texto Assinatura
              if viAssinarPDF then
              begin
                RotinasImagem.CreateBorderedImage(ImageEnViewPDF);
                viFraseIdent := 'Documento assinado digitalmente.' +#13#10+
                                'P�gina: ' + IntToStr(i+1) + ' de ' + IntToStr(viPaginas-1) +#13#10+
                                'Data: ' + DateToStr(date);
                RotinasImagem.SetTextoRodapeImage(ImageEnViewPDF, viFraseIdent);
              end;

              ImageEnViewPDF.IO.Params.PDF_Compression := ioPDF_JPEG;
              ImageEnViewPDF.IO.SaveToPDF;
            end;
          end;
        finally
          ImageEnViewPDF.IO.ClosePDFFile;
          FreeAndNil(ImageEnViewPDF);

          //Assinar PDF
          if viAssinarPDF then
             viAssinatura.AssinarPDF(SaveDialogPDF.FileName);

          //Assinar PDF
{          if viAssinarPDF then
            if viAssinatura.ConveterPDFA(SaveDialogPDF.FileName, SaveDialogPDF.FileName) then
              viAssinatura.AssinarPDF(SaveDialogPDF.FileName);}
        end;
      finally
        Screen.Cursor := crDefault;
        ProgressBarFile.Position := 0;
        FreeAndNil(viAssinatura);
      end;
      Messagedlg('PDF exportado com sucesso!', mtInformation, [mbOK], 0);
      Rotinas.OpenFileInExplorer(SaveDialogPDF.FileName);
    end;
  end
  else
    Messagedlg('Nenhuma imagem selecionada!', mtInformation, [mbOK], 0);
end;

function TfmeImagem.GetAssinarPdf: Boolean;
begin
  Result := ckbAssPDF.EditValue = True;
end;

function TfmeImagem.GetAutoFit: Boolean;
begin
  Result := (ckbAutoFit.EditValue = 'S');
end;

function TfmeImagem.GetColorful: Boolean;
begin
  Result := (ckbImagemColorida.EditValue = 'S');
end;

function TfmeImagem.GetCount: Integer;
begin
  if not ImageView.IsEmpty then
    Result := ImageView.IO.Params.ImageCount
  else
    Result := 0;
end;

function TfmeImagem.GetCurrentFile: string;
begin
 if not FHistory then
   Result := FCurrentFile
 else
   Result := FHistoryFile;
end;

function TfmeImagem.GetDPI: Integer;
begin
  Result := ImageView.IO.Params.Dpi;

  if (Result = 0) then
    Result := ImageView.DpiX;
end;

function TfmeImagem.GetFileNameHistory: string;
var
  viDirHistory : string;
begin
  Result := '';

  if FCurrentFile.Trim.IsEmpty then
    Exit;

  viDirHistory := IncludeTrailingPathDelimiter(ExtractFilePath(FCurrentFile)) + 'historico';
  if not DirectoryExists(viDirHistory) then
    ForceDirectories(viDirHistory);

  Result:= IncludeTrailingPathDelimiter(viDirHistory) + 'H_' + ExtractFileName(FCurrentFile);
end;

function TfmeImagem.GetHeight: Integer;
begin
  Result := ImageView.IEBitmap.Height;
end;

function TfmeImagem.GetImageCount: Integer;
begin
  Result := GetCount;
end;

function TfmeImagem.GetImageIndex: Integer;
begin
  Result := GetIndex;
end;

function TfmeImagem.GetIndex: Integer;
begin
  if GetCount > 0 then
    Result := ImageView.IO.Params.ImageIndex
  else
    Result := 0;
end;

function TfmeImagem.GetIntervalIndex(const vpTexto: string): TIEArrayOfInteger;
  function TrataRegExpPages(const vpTexto: string): string;
  begin
    if vpTexto[Length(vpTexto)] = ';' then
      Result := vpTexto
    else
      Result := vpTexto + ';';
  end;

var
  viArrayIdx: TArray<string>;
  i,
  viIni,
  viFim: Integer;
  idx: string;
begin
  Initialize(Result);

  if IsRegExpInterval(vpTexto) then
  begin
    viArrayIdx := vpTexto.Split(['-']);
    viIni      := StrToInt(viArrayIdx[0]);
    viFim      := StrToInt(viArrayIdx[1]);

    if viIni = 0 then
      Inc(viIni);

    for i := viIni to viFim do
      Insert(i-1, Result, High(Result));
  end
  else
  if IsRegExpPages(TrataRegExpPages(vpTexto)) then
  begin
    viArrayIdx := vpTexto.Split([';']);
    for idx in viArrayIdx do
      if not idx.IsEmpty then
      begin
        i := StrToInt(idx);
        if i > 0 then
          Insert(i-1, Result, High(Result));
      end;
  end;
end;

function TfmeImagem.GetWidth: Integer;
begin
  Result := ImageView.IEBitmap.Width;
end;

function TfmeImagem.IsImageColor: Boolean;
begin
  Result := FImageFormat = icColorful;
end;

function TfmeImagem.IsRegExpInterval(const vpTexto: string): Boolean;
var
  iRegExp : String;
begin
  iRegExp := '^\d{1,3}\-\d{1,3}$';
  Result := TRegEx.IsMatch(vpTexto, iRegExp);
end;

function TfmeImagem.IsRegExpPages(const vpTexto: string): Boolean;
var
  iRegExp : String;
begin
  iRegExp := '^(\d{1,3}\;)+$';
  Result := TRegEx.IsMatch(vpTexto, iRegExp);
end;

procedure TfmeImagem.ImportImage;
var
  fn,
  imagem: string;
  viCaminhoArquivo: string;
  viPos,
  viIdx,
  viCount: Integer;
begin
  AutoAjusteImageOldFormat;

  ValidateCurrenteFile;

  viCount := GetCount;
  viIdx   := GetIndex;

  DoBeforeImport;

  if OpenDialog.Execute then
  begin
    imagem := EmptyStr;

    Screen.Cursor := crHourGlass;

    FImageEnMView.Clear;

    ProgressBarFile.Position := 0;
    ProgressBarFile.Max      := OpenDialog.Files.Count;
    lblConvertendo.Caption   := 'Inciando Importa��o...';
    lblConvertendo.Visible   := ivAlways;
    Application.ProcessMessages;

    try
      for viCaminhoArquivo in OpenDialog.Files do
      begin
        fn := viCaminhoArquivo;
        Caption := fn;

        if UpperCase(ExtractFileExt(fn)) = '.PDF' then
        begin
          try
            lblConvertendo.Caption   := 'Convertendo PDF...';
            Application.ProcessMessages;

            imagem := RotinasImagem.GetPdfToTiffDebenu(fn);
          except
            on E: Exception do
            begin
              Messagedlg(E.Message, mtError, [mbOK], 0);
              Exit;
            end;
          end;
        end
        else
        begin
          viPos := ProgressBarFile.Position;

          if not DirectoryExists('C:\Temp') then
           CreateDir('C:\Temp');

          imagem := 'C:\Temp\IT7_' +  TPath.GetRandomFileName + '.tiff';

          if not RotinasImagem.SaveTiffFile(fn, imagem, GetColorful) then
           imagem := EmptyStr;

          ProgressBarFile.Max := OpenDialog.Files.Count;
          ProgressBarFile.Position := viPos;
        end;

        //load image
{        FImageEnMView.DeSelect;
        if not imagem.IsEmpty then
        begin
          ImageEnMViewLoadFromFile(imagem);

          try
            if not DoOnValidate(FImageEnMView.ImageCount) then
              Exit;

            SaveTiffMultiPage(FImageEnMView);
          finally
            DeleteFile(imagem);
          end;
        end;  }

        //load image
        FImageEnMView.DeSelect;
        if not imagem.IsEmpty then
        begin
          ImageEnMViewLoadFromFile(imagem);

          try
            if not DoOnValidate(FImageEnMView.ImageCount) then
              Exit;

            SaveTiffMultiPage(FImageEnMView);
          finally
            DeleteFile(imagem);
          end;
        end;


        ProgressBarFile.Position := ProgressBarFile.Position + 1;
        Application.ProcessMessages;
      end;

    finally
      FImageEnMView.Clear;
      Screen.Cursor := crDefault;
      ProgressBarFile.Position := 0;
      lblConvertendo.Visible   := ivNever;
    end;

    if FileExists(GetCurrentFile) then
    begin
      LoadImage(viIdx);

      DoAfterImport(GetCount-viCount);
    end;

    TrimAppMemorySize;
  end;
end;

procedure TfmeImagem.InternalAfterDelete(const vpPages: Integer);
var
  viIdx: integer;
begin
  DoAfterDelete(vpPages);

  if FileExists(GetCurrentFile) then
  begin
    viIdx := GetIndex;
    if viIdx > vpPages-1 then
      viIdx := vpPages-1;
    LoadFromFile(FCurrentFile, viIdx, FMenuHblt, FHistory);
  end
  else
   Clear;
end;

procedure TfmeImagem.InternalAfterImport(const vpPages: Integer);
begin
  DoAfterImport(vpPages);

  if FileExists(GetCurrentFile) then
    LoadFromFile(FCurrentFile, GetIndex, FMenuHblt, FHistory)
  else
    Clear;
end;

procedure TfmeImagem.InternalAfterScan(const vpPages: Integer);
begin
  DoAfterScan(vpPages);

  if FileExists(GetCurrentFile) then
    LoadFromFile(FCurrentFile, GetIndex, FMenuHblt, FHistory)
  else
    Clear;
end;

procedure TfmeImagem.AddEmptyImage;
var
  tempbmp: TBitmap;
  idx: integer;
begin
  AutoAjusteImageOldFormat;

  ValidateCurrenteFile;

  FImageEnMView.Clear;
  idx := GetCount;
  tempbmp := TBitmap.create;

  try
    tempbmp.Width  := 1240;
    tempbmp.Height := 1754;

    if IsImageColor then
      tempbmp.PixelFormat := pf24bit
    else
      tempbmp.PixelFormat := pf1bit;

    FImageEnMView.InsertImageEx(0);
    FImageEnMView.SetImage(0, tempbmp);

    SaveTiffMultiPage(FImageEnMView);

    SelectImage(idx);
  finally
    FImageEnMView.Clear;
    tempbmp.free;
  end;

end;

procedure TfmeImagem.UpdateMenu;
var
  viHblt,
  viNav,
  viAlter,
  viDelete,
  viPrint: Boolean;
begin
  viHblt := (not FHistory) and FMenuHblt;
  viNav  := (GetCount > 0);

  //Permission
  viAlter  := iaAlter  in FImageAction;
  viDelete := iaDelete in FImageAction;
  viPrint  := iaPrint  in FImageAction;

  actScanner.Enabled               := viHblt and viAlter;
  actImportar.Enabled              := viHblt and viAlter;
  actRedigitalizar.Enabled         := viHblt and viAlter;
  actImagemEmBranco.Enabled        := viHblt and viAlter;

  actUndo.Enabled                  := ImageView.Proc.CanUndo and viHblt and viAlter;
  actMergeSelecao.Enabled          := (ImageView.LayersCount > 1)  and viHblt and viAlter;
  actDeletarLayer.Enabled          := actMergeSelecao.Enabled and viHblt and viAlter;
  actCopiarSelecao.Enabled         := ((ImageView.MouseInteractGeneral = [miSelect]) or
                                       (ImageView.MouseInteractLayers = [ miMoveLayers, miResizeLayers ])) and viHblt and viAlter;
  actColarSelecao.Enabled          := actCopiarSelecao.Enabled and viHblt and viAlter;
  actCortarImagem.Enabled          := actCopiarSelecao.Enabled and viHblt and viAlter;

  actSalvar.Enabled                := viNav and viHblt and viAlter;
  actSelecionarArea.Enabled        := viNav and viHblt and viAlter;
  actGirarEsquerda.Enabled         := viNav and viHblt and viAlter;
  actGirarDireita.Enabled          := viNav and viHblt and viAlter;
  actAutoAjuste.Enabled            := viNav and viHblt and viAlter;
  actMover.Enabled                 := viNav and viHblt and viAlter;
  actResize.Enabled                := viNav and viHblt and viAlter;

  actImprimir.Enabled              := viNav and viPrint;
  actExportar.Enabled              := viNav and viPrint;
  actExportTiff.Enabled            := viNav and viPrint;
  actCopiar.Enabled                := viNav and viPrint;

  actZoomMais.Enabled              := viNav;
  actZoomMenos.Enabled             := viNav;
  actZoom100.Enabled               := viNav;
  actZoomWidth.Enabled             := viNav;
  actFit.Enabled                   := viNav;

  actDeletarArquivo.Enabled        := viNav and viHblt and viDelete;
  actDeletarPagina.Enabled         := viNav and viHblt and viDelete;
  actDeletarIntervaloPagina.Enabled:= viNav and viHblt and viDelete;

  UpdateStatusNav(viNav);

  edtBarPagina.ReadOnly            := not viNav;

  if actCopiarSelecao.Enabled then
    ImageView.Cursor := 1785
  else
    ImageView.Cursor := crDefault;

  if FHistory then
    actHistorico.Caption := 'Fechar Hist�rico'
  else
    actHistorico.Caption := 'Hist�rico';
end;


function TfmeImagem.FindIEVisionDLLPath : string;
var
  sExePath, sDLLName: string;
begin
  // DEMO CODE ONLY
  // The IEVision.DLL may not be located in the EXE folder, so check other common locations
  {$ifdef WIN64}
  sDLLName := IEVISION_64BIT_DLL_FILENAME;
  {$else}
  sDLLName := IEVISION_32BIT_DLL_FILENAME1;
  {$endif}

  sExePath := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));

  // In same folder as EXE?
  Result := sExePath + sDLLName;
  if FileExists(Result) then
    exit;

  Result := ''; // Not found, try system path
end;

end.
