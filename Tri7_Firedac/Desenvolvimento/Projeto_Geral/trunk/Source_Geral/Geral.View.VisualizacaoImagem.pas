unit Geral.View.VisualizacaoImagem;

interface

uses
  Windows,
  Messages,
  SysUtils,
  Variants,
  Classes,
  Graphics,
  Controls,
  Forms,
  Dialogs,
  cxTextEdit,
  cxTrackBar,
  cxControls,
  cxContainer,
  cxEdit,
  cxMaskEdit,
  cxDropDownEdit,
  Buttons,
  StdCtrls,
  ComCtrls,
  ToolWin,
  ExtCtrls,
  ImgList,
  AxCtrls,
  OleCtrls,
  ImagXpr7_TLB,
  cxButtons,
  NOTEXP70Lib_TLB,
  Menus,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  Vcl.ExtDlgs,
  Geral.Model.Entity.Spec.List,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  dxBarBuiltInMenu,
  cxPC;

type
  TfrmVisualizacaoImagem = class(TForm)
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
    btnExportar: TcxButton;
    SavePictureDialog1: TSavePictureDialog;
    tblImagem: TFDMemTable;
    tblImagemINDEX: TIntegerField;
    tblImagemNOME: TStringField;
    tblImagemCAMINHO: TStringField;
    tbcImagem: TcxTabControl;
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
    procedure btnExportarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tbcImagemChange(Sender: TObject);
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
    
    class function AdicionarImagens(
      const vpNomes: IList<string>;
      const vpCaminhos: IList<string>): IList<Integer>;

    procedure ExibirFichaLado(Valor : Boolean);
  end;

var
  vg_NumeroImagemAtual : Integer;
  vg_ExibirFichaMostrarImagem : Boolean;

implementation

uses
  Controles,
  Geral.Model.Entity.Impl.Factory.List,
  System.Math,
  System.Types;

var
  frmVisualizacaoImagem: TfrmVisualizacaoImagem;

{$R *.dfm}

procedure TfrmVisualizacaoImagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Notate1.SetClientWindow(0);
  Action := caFree;
  frmVisualizacaoImagem := nil;
end;

procedure TfrmVisualizacaoImagem.PegaImagem;
var Npag : Integer;
    Lado : String;
begin
  if not FileExists(vg_ArquivoImagem) then
  begin
    Xpress1.FileName := '';
    Exit;
  end;

  {Carrega a imagem a ser exibida}
  Screen.Cursor    := crHourglass;
  Xpress1.IResUnits := IRes_Cm;
  Xpress1.PageNbr  := vg_NumImagem;
  Xpress1.FileName := vg_ArquivoImagem;
  Application.ProcessMessages;
  spbPreviewWidthClick(nil);

  //Controla a habilitação dos botões de movimentação entre as imagens
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

procedure TfrmVisualizacaoImagem.btnPrimeiroClick(Sender: TObject);
begin
  vg_NumImagem := 1;
  PegaImagem;
end;

class function TfrmVisualizacaoImagem.AdicionarImagens(
  const vpNomes: IList<string>;
  const vpCaminhos: IList<string>): IList<Integer>;
{$REGION 'Variáveis'}
var
  I: Integer;
  viNome: string;
  viCaminho: string;
  viIndex: Integer;
{$ENDREGION}
begin
  Result := TListFactory<Integer>.New.GetInstance;

  if not Assigned(
    frmVisualizacaoImagem) then
    Application.CreateForm(
      Self,
      frmVisualizacaoImagem);

  for I := ZeroValue to Pred(
    vpNomes.Count) do
  begin
    viNome := vpNomes[I];
    viCaminho := vpCaminhos[I];

    if frmVisualizacaoImagem.tblImagem.Locate(
      'CAMINHO',
      viCaminho) then
    begin
      viIndex := frmVisualizacaoImagem.tblImagemINDEX.AsInteger;

      frmVisualizacaoImagem.tbcImagem.Tabs[viIndex].Caption := viNome;
      frmVisualizacaoImagem.tbcImagem.Tabs[viIndex].Selected := True;

      frmVisualizacaoImagem.tblImagem.Edit;
    end
    else
    begin
      viIndex := frmVisualizacaoImagem.tbcImagem.Tabs.Add(
        viNome);

      frmVisualizacaoImagem.tblImagem.Append;
      frmVisualizacaoImagem.tblImagemINDEX.AsInteger := viIndex;
      frmVisualizacaoImagem.tblImagemCAMINHO.AsString := viCaminho;

      Result.Add(
        viIndex);
    end;

    frmVisualizacaoImagem.tblImagemNOME.AsString := viNome;
    frmVisualizacaoImagem.tblImagem.Post;
  end;

  frmVisualizacaoImagem.Show;
end;

procedure TfrmVisualizacaoImagem.btnAnteriorClick(Sender: TObject);
begin
  dec(vg_NumImagem);
  PegaImagem;
end;

procedure TfrmVisualizacaoImagem.btnProximoClick(Sender: TObject);
begin
  Inc(vg_NumImagem);
  PegaImagem;
end;

procedure TfrmVisualizacaoImagem.btnUltimoClick(Sender: TObject);
begin
  vg_NumImagem := Xpress1.Pages;
  PegaImagem;
end;

procedure TfrmVisualizacaoImagem.UpdateZoom;
begin
  edtZoom.Text := IntToStr(round(Xpress1.IPZoomF * 100));
end;

procedure TfrmVisualizacaoImagem.FormCreate(Sender: TObject);
var i : Integer;
begin
  vg_ExibirFicha := True;
  curLayer := 0;
  vl_ativado := False;
  Xpress1.FileName := '';
  vg_NumImagem := 1;
  cbxPaginas.Properties.Items.Clear;

  if FileExists(vg_ArquivoImagem) then
  begin
    Xpress1.PageNbr := vg_NumImagem;
    Xpress1.FileName := vg_ArquivoImagem;

    for i := 1 to Xpress1.Pages do
      cbxPaginas.Properties.Items.Add(IntToStr(i));
  end
  else
    Xpress1.FileName := '';

  if vg_ExibirFichaMostrarImagem then
     Panel3.Left := stxFichaLado.Left + stxFichaLado.Width + 1
  else Panel3.Left := stxFichaLado.Left;

  btnPrimeiroClick(nil);
  tblImagem.Open;
end;

procedure TfrmVisualizacaoImagem.FormDestroy(Sender: TObject);
begin
  tblImagem.Close;
end;

procedure TfrmVisualizacaoImagem.spbPreviewWholeClick(Sender: TObject);
begin
  vg_trackzoom := False;
  Xpress1.ZoomToFit(ZOOMFIT_HEIGHT);
  UpdateZoom;
  if edtZoom.Text <> '' then
     tbrZoom.Position := StrToInt(edtZoom.Text);
  vg_trackzoom := True;
end;

procedure TfrmVisualizacaoImagem.spbPreviewWidthClick(Sender: TObject);
begin
  vg_trackzoom := False;
  Xpress1.ZoomToFit(ZOOMFIT_WIDTH);
  UpdateZoom;
  if edtZoom.Text <> '' then
     tbrZoom.Position := StrToInt(edtZoom.Text);
  Application.ProcessMessages;
  vg_trackzoom := True;
end;

procedure TfrmVisualizacaoImagem.spbPreview100PercentClick(Sender: TObject);
begin
  vg_trackzoom := False;
  Xpress1.Zoom(1);
  UpdateZoom;
  if edtZoom.Text <> '' then
     tbrZoom.Position := StrToInt(edtZoom.Text);
  vg_trackzoom := True;
end;

procedure TfrmVisualizacaoImagem.FormShow(Sender: TObject);
begin
  //PegaImagem;

  tbcImagemChange(
    nil);

  spbPreviewWidthClick(spbPreviewWidth);
end;

procedure TfrmVisualizacaoImagem.cbxPaginasPropertiesChange(Sender: TObject);
begin
  {Exibe a imagem selecionada no combobox}
  if (Trim(cbxPaginas.Text) <> '') and (cbxPaginas.Tag = 0) then
  begin
    vg_NumImagem := StrToInt(cbxPaginas.Text);
    PegaImagem;
  end;
end;

procedure TfrmVisualizacaoImagem.Xpress1MouseDown(Sender: TObject;
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

procedure TfrmVisualizacaoImagem.Xpress1MouseMove(Sender: TObject;
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

procedure TfrmVisualizacaoImagem.Xpress1MouseUp(Sender: TObject;
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

procedure TfrmVisualizacaoImagem.tbcImagemChange(Sender: TObject);
begin
  tblImagem.Locate(
    'INDEX',
    tbcImagem.TabIndex);

  vg_ArquivoImagem := tblImagemCAMINHO.AsString;
  PegaImagem;
end;

procedure TfrmVisualizacaoImagem.tbrZoomPropertiesChange(Sender: TObject);
begin
  if vg_trackzoom then
  begin
    Xpress1.Zoom(tbrZoom.Position / 100);
    UpdateZoom;
  end;
end;

procedure TfrmVisualizacaoImagem.FormActivate(Sender: TObject);
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
  end;
end;

procedure TfrmVisualizacaoImagem.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVisualizacaoImagem.btnExportarClick(Sender: TObject);
begin
  SavePictureDialog1.FileName := 'IMEGEM_HISTORICO.JPEG';
  if SavePictureDialog1.Execute then
  begin
    Xpress1.SaveFileType := FT_JPEG;
    Xpress1.SaveFileName := SavePictureDialog1.FileName;
    Xpress1.SaveFile;
  end;
end;

procedure TfrmVisualizacaoImagem.Xpress1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVisualizacaoImagem.ExibirFichaLado(Valor: Boolean);
begin
  vg_ExibirFicha := Valor;
  if Valor then
     Panel3.Left := stxFichaLado.Left + stxFichaLado.Width + 1
  else Panel3.Left := stxFichaLado.Left;
end;

procedure TfrmVisualizacaoImagem.Notate1CurrentLayerChange(ASender: TObject;
  newLayer: Integer);
begin
  curLayer := newLayer;
end;

end.
