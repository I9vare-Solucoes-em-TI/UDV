unit VisualizarImagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FrameImagem;

type
  TfrmVisualizarImagem = class(TForm)
    fmeImagem1: TfmeImagem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class procedure VisualizarImagem(
      const vpFileName: string;
      const vpIndex: Integer;
      const vpHistory: Boolean;
      const vpMenuHblt: Boolean;
      const vpImageAction: TImageActionSet;
      const vpBeforeScan: TBeforeScan;
      const vpAfterScan: TAfterScan;
      const vpBeforeReScan: TBeforeReScan;
      const vpAfterReScan: TAfterReScan;
      const vpBeforeImport: TBeforeImport;
      const vpAfterImport: TAfterImport;
      const vpBeforeDelete: TBeforeDelete;
      const vpAfterDelete: TAfterDelete;
      const vpAfterSelectImage: TAfterSelectImage;
      const vpOnImageChange: TOnImageChange;
      const vpShowModal: Boolean);

    class procedure VisualizarImagemSimplificado(
      const vpFileName: string;
      const vpIndex: Integer;
      const vpHistory: Boolean;
      const vpMenuHblt: Boolean;
      const vpImageAction: TImageActionSet);

    class function FormAberto: Boolean;
    class procedure Fechar;

    class procedure ViewZoomIn;
    class procedure ViewZoomOut;

    class procedure ViewNext;
    class procedure ViewPrior;
    class procedure ViewLast;
    class procedure ViewFirst;
  end;

implementation

var
  frmVisualizarImagem: TfrmVisualizarImagem;

{$R *.dfm}

class procedure TfrmVisualizarImagem.Fechar;
begin
  if FormAberto then
    frmVisualizarImagem.Close;
end;

class function TfrmVisualizarImagem.FormAberto: Boolean;
begin
  Result := Assigned(frmVisualizarImagem) and
    frmVisualizarImagem.Showing;
end;

procedure TfrmVisualizarImagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmVisualizarImagem := nil;
end;

procedure TfrmVisualizarImagem.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := fmeImagem1.ValidateImage;
end;

procedure TfrmVisualizarImagem.FormShow(Sender: TObject);
begin
 if fmeImagem1.GetAutoFit then
   fmeImagem1.Fit
 else
   fmeImagem1.ZoomWidth;
end;

class procedure TfrmVisualizarImagem.ViewFirst;
begin
  if FormAberto then
   frmVisualizarImagem.fmeImagem1.First;
end;

class procedure TfrmVisualizarImagem.ViewLast;
begin
  if FormAberto then
   frmVisualizarImagem.fmeImagem1.Last;
end;

class procedure TfrmVisualizarImagem.ViewNext;
begin
  if FormAberto then
   frmVisualizarImagem.fmeImagem1.Next;
end;

class procedure TfrmVisualizarImagem.ViewPrior;
begin
  if FormAberto then
   frmVisualizarImagem.fmeImagem1.Prior;
end;

class procedure TfrmVisualizarImagem.ViewZoomIn;
begin
  if FormAberto then
   frmVisualizarImagem.fmeImagem1.ZoomIN;
end;

class procedure TfrmVisualizarImagem.ViewZoomOut;
begin
  if FormAberto then
   frmVisualizarImagem.fmeImagem1.ZoomOut;
end;

class procedure TfrmVisualizarImagem.VisualizarImagem(
  const vpFileName: string;
  const vpIndex: Integer;
  const vpHistory: Boolean;
  const vpMenuHblt: Boolean;
  const vpImageAction: TImageActionSet;
  const vpBeforeScan: TBeforeScan;
  const vpAfterScan: TAfterScan;
  const vpBeforeReScan: TBeforeReScan;
  const vpAfterReScan: TAfterReScan;
  const vpBeforeImport: TBeforeImport;
  const vpAfterImport: TAfterImport;
  const vpBeforeDelete: TBeforeDelete;
  const vpAfterDelete: TAfterDelete;
  const vpAfterSelectImage: TAfterSelectImage;
  const vpOnImageChange: TOnImageChange;
  const vpShowModal: Boolean);
begin
  if not Assigned(frmVisualizarImagem) then
    Application.CreateForm(
      Self,
      frmVisualizarImagem);

  frmVisualizarImagem.fmeImagem1.actHistorico.Visible        := False;
  frmVisualizarImagem.fmeImagem1.actVisualizar.Enabled       := False;
  frmVisualizarImagem.fmeImagem1.actVisualizarEdicao.Enabled := False;

  frmVisualizarImagem.fmeImagem1.LoadFromFile(vpFileName, vpIndex, vpMenuHblt, vpHistory);

  //Permission
  frmVisualizarImagem.fmeImagem1.SetImageAction(vpImageAction);

  //Digitalizar
  frmVisualizarImagem.fmeImagem1.RegisterBeforeScan(
    vpBeforeScan);
  frmVisualizarImagem.fmeImagem1.RegisterAfterScan(
    vpAfterScan);

  //Redigitalizar
  frmVisualizarImagem.fmeImagem1.RegisterBeforeReScan(
    vpBeforeReScan);
  frmVisualizarImagem.fmeImagem1.RegisterAfterReScan(
    vpAfterReScan);

  //Importar
  frmVisualizarImagem.fmeImagem1.RegisterAfterImport(
    vpAfterImport);
  frmVisualizarImagem.fmeImagem1.RegisterBeforeImport(
    vpBeforeImport);

  //Deletar
  frmVisualizarImagem.fmeImagem1.RegisterAfterDelete(
    vpAfterDelete);
  frmVisualizarImagem.fmeImagem1.RegisterBeforeDelete(
    vpBeforeDelete);

  //Selecionar Imagem
  frmVisualizarImagem.fmeImagem1.RegisterAfterSelectImage(
    vpAfterSelectImage);

  //Alterar
  frmVisualizarImagem.fmeImagem1.RegisterOnImageChange(
    vpOnImageChange);

   if not vpShowModal then
   begin
    frmVisualizarImagem.Caption := 'Visualizador';
    frmVisualizarImagem.Show;
   end
  else
  begin
    frmVisualizarImagem.Caption := 'Visualizador (Edição)';
    frmVisualizarImagem.ShowModal;
  end;
end;

class procedure TfrmVisualizarImagem.VisualizarImagemSimplificado(
  const vpFileName: string; const vpIndex: Integer; const vpHistory,
  vpMenuHblt: Boolean; const vpImageAction: TImageActionSet);
begin
  TfrmVisualizarImagem.VisualizarImagem(
    vpFileName,
    vpIndex,
    vpHistory,
    vpMenuHblt,
    vpImageAction,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    nil,
    False
  );
end;

end.
