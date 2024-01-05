unit FrameAbasDigitalizar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxPC,
  System.Generics.Collections,
  Geral.Model.GED;

type
  TOnTabChange = reference to procedure(
    const vpGED: TGED);

  TfmeAbasDigitalizar = class(TFrame)
    tbcAbas: TcxTabControl;
    procedure tbcAbasChange(Sender: TObject);
  private
    { Private declarations }
    FOnTabChange: TOnTabChange;
    FGED_List: TObjectList<TGED>;

    function GetGED: TGED;

    procedure DOnTabChange;
    procedure CriarAbas;
  public
    { Public declarations }

    function GetSubPasta: string;

    procedure RegisterGED_List(
      const vpGED_List: TObjectList<TGED>);

    procedure RegisterOnTabChange(
      const vpOnTabChange: TOnTabChange);
  end;

implementation

{$R *.dfm}

uses
  Controles,
  Rotinas;

{ TfmeAbasDigitalizar }

procedure TfmeAbasDigitalizar.CriarAbas;
var
  viGED: TGED;
  viDescricaoOutros: string;
begin
  viDescricaoOutros := Trim(dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'DESCRICAO_PERSONALIZADA_IMAGEM_OUTROS', 'S'));

  if FGED_List.Count > 0 then
  begin
    for viGED in FGED_List do
      if (viGED.Descricao = 'Outros') and (not viDescricaoOutros.IsEmpty) then
        tbcAbas.Properties.Tabs.Add(viDescricaoOutros)
      else
        tbcAbas.Properties.Tabs.Add(Trim(viGED.Descricao));

    tbcAbas.TabIndex := 0;
  end
  else
    Self.Visible := False;
end;

procedure TfmeAbasDigitalizar.DOnTabChange;
begin
  if Assigned(
    FOnTabChange) then
     FOnTabChange(
      GetGED);
end;

function TfmeAbasDigitalizar.GetGED: TGED;
begin
  Result := FGED_List[tbcAbas.TabIndex];
end;

function TfmeAbasDigitalizar.GetSubPasta: string;
begin
  if tbcAbas.Tabs.Count = 0 then
    Result := EmptyStr
  else
    Result := Trim(tbcAbas.Tabs.Tabs[tbcAbas.TabIndex].Caption);
end;

procedure TfmeAbasDigitalizar.RegisterGED_List(
  const vpGED_List: TObjectList<TGED>);
begin
  FGED_List := vpGED_List;
  CriarAbas;
end;

procedure TfmeAbasDigitalizar.RegisterOnTabChange(
  const vpOnTabChange: TOnTabChange);
begin
  FOnTabChange := vpOnTabChange;
end;

procedure TfmeAbasDigitalizar.tbcAbasChange(Sender: TObject);
begin
  DOnTabChange;
end;

end.
