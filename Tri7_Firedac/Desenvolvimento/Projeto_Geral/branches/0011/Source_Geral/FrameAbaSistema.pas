unit FrameAbaSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxPC,
  System.Generics.Collections, Geral.Model.Sistema;

type
  TOnTabChange = reference to procedure(
    const vpSistema: TSistema);

  TfmeAbasSistema = class(TFrame)
    tbcAbas: TcxTabControl;
    procedure tbcAbasChange(Sender: TObject);
  private
    { Private declarations }
    FOnTabChange: TOnTabChange;
    FSistema_List: TObjectList<TSistema>;

    function GetSistema: TSistema;

    procedure DOnTabChange;
    procedure CriarAbas;
  public
    { Public declarations }
    procedure RegisterSistema_List(
      const vpSistema_List: TObjectList<TSistema>);

    procedure RegisterOnTabChange(
      const vpOnTabChange: TOnTabChange);
  end;

implementation

{$R *.dfm}

uses
  Controles,
  Rotinas;

{ TfmeAbasDigitalizar }

procedure TfmeAbasSistema.CriarAbas;
var
  viSistema: TSistema;
begin
  if FSistema_List.Count > 0 then
  begin
    for viSistema in FSistema_List do
      tbcAbas.Properties.Tabs.Add(Trim(viSistema.Descricao));

    tbcAbas.TabIndex := 0;
  end
  else
    Self.Visible := False;
end;

procedure TfmeAbasSistema.DOnTabChange;
begin
  if Assigned(
    FOnTabChange) then
     FOnTabChange(
      GetSistema);
end;

function TfmeAbasSistema.GetSistema: TSistema;
begin
  Result := FSistema_List[tbcAbas.TabIndex];
end;

procedure TfmeAbasSistema.RegisterSistema_List(
  const vpSistema_List: TObjectList<TSistema>);
begin
  FSistema_List := vpSistema_List;
  CriarAbas;
end;

procedure TfmeAbasSistema.RegisterOnTabChange(
  const vpOnTabChange: TOnTabChange);
begin
  FOnTabChange := vpOnTabChange;
end;

procedure TfmeAbasSistema.tbcAbasChange(Sender: TObject);
begin
  DOnTabChange;
end;

end.
