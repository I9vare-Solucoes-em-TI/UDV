unit Geral.View.Input.RadioGroup;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Controles,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Geral.View.Input,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  Vcl.Menus,
  dxSkinsCore,
  dxSkinMcSkin,
  dxSkinOffice2007Black,
  dxSkinOffice2007Blue,
  dxSkinOffice2007Green,
  dxSkinOffice2007Pink,
  dxSkinOffice2007Silver,
  cxControls,
  cxContainer,
  cxEdit,
  cxGroupBox,
  cxRadioGroup,
  Vcl.StdCtrls,
  cxButtons,
  Vcl.ExtCtrls;

type
  TFrmInputRadiogroup = class(TFrmInput)
    rgpOpcoes: TcxRadioGroup;
    procedure BtnConfirmarClick(Sender: TObject);
  private
  public
    class function InputBoxRadioGroup(
      const vpTitulo: string;
      const vpTexto: string;
      const vpOpcoes: TArray<string>;
      out vpResposta: Integer;
      const vpRespostaPadrao: Integer = 0): Boolean;
  end;

implementation

uses
  MensagemUtils;

{$R *.dfm}

class function TFrmInputRadiogroup.InputBoxRadioGroup(
  const vpTitulo: string;
  const vpTexto: string;
  const vpOpcoes: TArray<string>;
  out vpResposta: Integer;
  const vpRespostaPadrao: Integer): Boolean;
var
  viFrmInput: TFrmInputRadiogroup;
  viItem: TcxRadioGroupItem;
  viOpcao: string;
  i: Integer;
begin
  Result := False;

  viFrmInput := nil;
  try
    viFrmInput := TFrmInputRadiogroup.Create(Screen.ActiveForm);
    viFrmInput.Parent := Screen.ActiveForm;
    viFrmInput.Position := poMainFormCenter;
    viFrmInput.Height := 120;
    viFrmInput.rgpOpcoes.Clear;

    for i := Low(vpOpcoes) to High(vpOpcoes) do
    begin
      viOpcao := vpOpcoes[i];
      viItem := viFrmInput.rgpOpcoes.Properties.Items.Add;
      viItem.Caption := viOpcao;
      viFrmInput.Height := viFrmInput.Height + 20;
    end;

    viFrmInput.Caption := ' ' + vpTitulo + ' ';
    viFrmInput.rgpOpcoes.Caption := ' ' + vpTexto + ' ';
    viFrmInput.rgpOpcoes.ItemIndex := vpRespostaPadrao;

    if viFrmInput.ShowModal = mrOk then
    begin
      vpResposta := viFrmInput.RgpOpcoes.ItemIndex;
      Result := True;
      Exit;
    end;

  finally
    FreeAndNil(viFrmInput);
  end;
end;

procedure TFrmInputRadiogroup.BtnConfirmarClick(Sender: TObject);
begin
  if rgpOpcoes.ItemIndex < 0 then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Nenhuma opção foi selecionada!');
    Exit;
  end;

  inherited;
end;

end.
