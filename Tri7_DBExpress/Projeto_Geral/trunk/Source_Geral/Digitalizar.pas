unit Digitalizar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FrameImagem, StdCtrls, ExtCtrls;

type
  TfrmDigitalizar = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    fmeImagem1: TfmeImagem;
    CheckBox1: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDigitalizar: TfrmDigitalizar;

implementation

uses Controles;

{$R *.dfm}

procedure TfrmDigitalizar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmDigitalizar := nil;
  fmeImagem1.FecharNotate;
end;

procedure TfrmDigitalizar.FormCreate(Sender: TObject);
begin
  vgId := 1;
  dtmControles.CarregarConfig;
  fmeImagem1.CriarTwain;
end;

procedure TfrmDigitalizar.FormKeyPress(Sender: TObject; var Key: Char);
begin
  case Key of
    #27 : begin
            Key := #0;
            Close;
          end;
    #13 : begin
            Key := #0;
            PostMessage (Handle, WM_NEXTDLGCTL, 0, 0);
          end;
  end; {case}
end;

procedure TfrmDigitalizar.Button1Click(Sender: TObject);
begin
  fmeImagem1.vg_NomeArquivo := 'D:\ImagensAparecida\Fichas2\000\F_M_000001#.spd';
  fmeImagem1.CarregaPaginas;
  fmeImagem1.vg_TipoGravacao := 'A';
end;

procedure TfrmDigitalizar.Button2Click(Sender: TObject);
begin
  fmeImagem1.vg_NomeArquivo := 'D:\ImagensAparecida\Livros2\001\L_M_001001#_0002B_108.spd';
  fmeImagem1.CarregaPaginas;
  fmeImagem1.vg_TipoGravacao := 'M';
end;

procedure TfrmDigitalizar.CheckBox1Click(Sender: TObject);
begin
  fmeImagem1.ExibirFichaLado(CheckBox1.Checked);
end;

end.
