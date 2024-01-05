unit MostrarImagem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrameImagem, cxTextEdit, cxTrackBar, cxControls, cxContainer,
  cxEdit, cxMaskEdit, cxDropDownEdit, Buttons, StdCtrls, ComCtrls, ToolWin,
  ExtCtrls, ImgList, AxCtrls, OleCtrls, ImagXpr7_TLB,
  cxLookAndFeelPainters, cxButtons, NOTEXP70Lib_TLB, cxGraphics, Menus,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue;

type
  TfrmMostrarImagem = class(TForm)
    ImageList1: TImageList;
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    ToolButton3: TToolButton;
    btnPrimeiro: TToolButton;
    btnAnterior: TToolButton;
    btnProximo: TToolButton;
    btnUltimo: TToolButton;
    stxFichaLado: TStaticText;
    Panel3: TPanel;
    spbPreviewWhole: TSpeedButton;
    spbPreview100Percent: TSpeedButton;
    spbPreviewWidth: TSpeedButton;
    cbxPaginas: TcxComboBox;
    tbrZoom: TcxTrackBar;
    edtZoom: TcxTextEdit;
    Xpress1: TImagXpress;
    Panel4: TPanel;
    btnCancelar: TcxButton;
    Notate1: TNotateXpress;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnAnteriorClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure spbPreviewWholeClick(Sender: TObject);
    procedure spbPreviewWidthClick(Sender: TObject);
    procedure spbPreview100PercentClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbxPaginasPropertiesChange(Sender: TObject);
    procedure Xpress1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Xpress1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Xpress1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure tbrZoomPropertiesChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure Xpress1DblClick(Sender: TObject);
    procedure Notate1CurrentLayerChange(ASender: TObject;
      newLayer: Integer);
  private
    vg_PosInic : TPoint;
    vg_NumImagem, curLayer : Integer;
    vg_ExibirFicha,
    vg_Capturando,
    vg_trackzoom, vl_ativado : Boolean;

    procedure PegaImagem;
    procedure UpdateZoom;
    { Private declarations }
  public
    { Public declarations }
    vg_ArquivoImagem : String;
    
    procedure ExibirFichaLado(Valor : Boolean);
  end;

var
  frmMostrarImagem: TfrmMostrarImagem;
  vg_NumeroImagemAtual : Integer;
  vg_ExibirFichaMostrarImagem : Boolean;

implementation

uses Controles;

{$R *.dfm}

procedure TfrmMostrarImagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Notate1.SetClientWindow(0);
  Action := caFree;
  frmMostrarImagem := nil;
end;

procedure TfrmMostrarImagem.PegaImagem;
var Npag : Integer;
    Lado : String;
begin
  {Carrega a imagem a ser exibida}
  Screen.Cursor    := crHourglass;
  Xpress1.IResUnits := IRes_Cm;
  Xpress1.PageNbr  := vg_NumImagem;
  Xpress1.FileName := vg_ArquivoImagem;
  Application.ProcessMessages;
  spbPreviewWidthClick(nil);

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
end;

procedure TfrmMostrarImagem.btnPrimeiroClick(Sender: TObject);
begin
  vg_NumImagem := 1;
  PegaImagem;
end;

procedure TfrmMostrarImagem.btnAnteriorClick(Sender: TObject);
begin
  dec(vg_NumImagem);
  PegaImagem;
end;

procedure TfrmMostrarImagem.btnProximoClick(Sender: TObject);
begin
  Inc(vg_NumImagem);
  PegaImagem;
end;

procedure TfrmMostrarImagem.btnUltimoClick(Sender: TObject);
begin
  vg_NumImagem := Xpress1.Pages;
  PegaImagem;
end;

procedure TfrmMostrarImagem.UpdateZoom;
begin
  edtZoom.Text := IntToStr(round(Xpress1.IPZoomF * 100));
end;

procedure TfrmMostrarImagem.FormCreate(Sender: TObject);
var i : Integer;
begin
  vg_ExibirFicha := True;
  curLayer := 0;
  vl_ativado := False;
  Xpress1.FileName := '';
  vg_NumImagem := vg_NumeroImagemAtual;
  {Carrega para o combobox o n�mero de imagen que o arquivo contem}
  Xpress1.FileName := vg_ArquivoImagem;
  cbxPaginas.Properties.Items.Clear;
  for i := 1 to Xpress1.Pages do
      cbxPaginas.Properties.Items.Add(IntToStr(i));

  if vg_ExibirFichaMostrarImagem then
     Panel3.Left := stxFichaLado.Left + stxFichaLado.Width + 1
  else Panel3.Left := stxFichaLado.Left;
end;

procedure TfrmMostrarImagem.spbPreviewWholeClick(Sender: TObject);
begin
  vg_trackzoom := False;
  Xpress1.ZoomToFit(ZOOMFIT_HEIGHT);
  UpdateZoom;
  if edtZoom.Text <> '' then
     tbrZoom.Position := StrToInt(edtZoom.Text);
  vg_trackzoom := True;
end;

procedure TfrmMostrarImagem.spbPreviewWidthClick(Sender: TObject);
begin
  vg_trackzoom := False;
  Xpress1.ZoomToFit(ZOOMFIT_WIDTH);
  UpdateZoom;
  if edtZoom.Text <> '' then
     tbrZoom.Position := StrToInt(edtZoom.Text);
  Application.ProcessMessages;
  vg_trackzoom := True;
end;

procedure TfrmMostrarImagem.spbPreview100PercentClick(Sender: TObject);
begin
  vg_trackzoom := False;
  Xpress1.Zoom(1);
  UpdateZoom;
  if edtZoom.Text <> '' then
     tbrZoom.Position := StrToInt(edtZoom.Text);
  vg_trackzoom := True;
end;

procedure TfrmMostrarImagem.FormShow(Sender: TObject);
begin
  PegaImagem;
  spbPreviewWidthClick(spbPreviewWidth);
end;

procedure TfrmMostrarImagem.cbxPaginasPropertiesChange(Sender: TObject);
begin
  {Exibe a imagem selecionada no combobox}
  if (Trim(cbxPaginas.Text) <> '') and (cbxPaginas.Tag = 0) then
  begin
    vg_NumImagem := StrToInt(cbxPaginas.Text);
    PegaImagem;
  end;
end;

procedure TfrmMostrarImagem.Xpress1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if (Xpress1.MousePointer <> MP_CHand2) then
    if (Button = mbLeft) and (Xpress1.ImagWidth <> 0) then
    begin
      vg_PosInic.X     := X;
      vg_PosInic.Y     := Y;
      vg_Capturando    := true;
      if (Xpress1.MousePointer <> MP_BPush) then
         Xpress1.MousePointer := MP_CHand2;
    end;
end;

procedure TfrmMostrarImagem.Xpress1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
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

procedure TfrmMostrarImagem.Xpress1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
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
      Xpress1.MousePointer := MP_Arrow;
    end;
end;

procedure TfrmMostrarImagem.tbrZoomPropertiesChange(Sender: TObject);
begin
  if vg_trackzoom then
  begin
    Xpress1.Zoom(tbrZoom.Position / 100);
    UpdateZoom;
  end;
end;

procedure TfrmMostrarImagem.FormActivate(Sender: TObject);
begin
  if vl_ativado = false then
  begin
    Notate1.SetClientWindow(Xpress1.hWnd);
    if curLayer = 0 Then Notate1.CreateLayer;
    if (curLayer <> 0) then
       begin
          Notate1.SetToolPaletteVisible (curLayer, False);
          if (Notate1.GrpGetFirstGroupID(curLayer) = 0) Then
             Notate1.GrpCreateGroup(curLayer, '', 0);
       end;
    vl_ativado := True;
    Xpress1.FileName := vg_ArquivoImagem;
  end;
  spbPreviewWidthClick(nil);
end;

procedure TfrmMostrarImagem.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMostrarImagem.Xpress1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMostrarImagem.ExibirFichaLado(Valor: Boolean);
begin
  vg_ExibirFicha := Valor;
  if Valor then
     Panel3.Left := stxFichaLado.Left + stxFichaLado.Width + 1
  else Panel3.Left := stxFichaLado.Left;
end;

procedure TfrmMostrarImagem.Notate1CurrentLayerChange(ASender: TObject;
  newLayer: Integer);
begin
  curLayer := newLayer;
end;

end.
