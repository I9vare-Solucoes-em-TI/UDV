unit VisualizarImagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FrameImagem;

type
  TfrmVisualizarImagem = class(TForm)
    fmeImagem1: TfmeImagem;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    class function VisualizarImagem(
      const vpFileName: string;
      const vpIndex: Integer;
      const vpHistory: Boolean;
      const vpAfterScan: TAfterScan
    ):Integer;
  end;

//var
//  frmVisualizarImagem: TfrmVisualizarImagem;

implementation

{$R *.dfm}

procedure TfrmVisualizarImagem.FormCreate(Sender: TObject);
begin
  fmeImagem1.ImageEnMView1.OnDblClick := nil;
end;

class function TfrmVisualizarImagem.VisualizarImagem(const vpFileName: string;
  const vpIndex: Integer;
  const vpHistory: Boolean;
  const vpAfterScan: TAfterScan): Integer;
var
  vifrmVisualizarImagem: TfrmVisualizarImagem;
begin
  Application.CreateForm(
    Self,
    vifrmVisualizarImagem);

    vifrmVisualizarImagem.fmeImagem1.LoadFromFile(vpFileName, vpIndex, True, vpHistory);

    vifrmVisualizarImagem.fmeImagem1.RegisterAfterScan(vpAfterScan);
  try
      vifrmVisualizarImagem.ShowModal;
      Result := vifrmVisualizarImagem.fmeImagem1.ImageEnMView1.SelectedImage;
  finally
    vifrmVisualizarImagem.Free;
  end;

end;

end.
