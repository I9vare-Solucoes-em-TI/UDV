unit CadastroAuxSimplificado;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,  Menus, StdCtrls, cxButtons,
  ExtCtrls,
  cxControls, cxContainer, cxEdit, cxLabel,

  FMTBcd, DB, DBClient, Provider, SqlExpr, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinMcSkin, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinsDefaultPainters, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type

  TfrmCadastroAuxSimplificado = class(TForm)
    Panel2: TPanel;
    lblInformaca: TcxLabel;
    Panel4: TPanel;
    imgTitulo: TImage;
    Panel1: TPanel;
    DataSetAncestral: TI9Query;
    ProviderAncestral: TDataSetProvider;
    ClientAncestral: TClientDataSet;
    SourceAncestral: TDataSource;
    Panel6: TPanel;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  frmCadastroAuxSimplificado: TfrmCadastroAuxSimplificado;

implementation

uses Controles, Lookup;

{$R *.dfm}

procedure TfrmCadastroAuxSimplificado.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCadastroAuxSimplificado.btnConfirmarClick(Sender: TObject);
begin
  vgDadosCadastro.Confirmado := True;
  if vgDadosCadastro.SomentePesquisa then
    close
  else
  begin
    if ClientAncestral.State in [dsInsert] then
      ClientAncestral.Fields[0].AsInteger := dtmControles.GerarSequencia
        (vgDadosCadastro.Tabela);
    ClientAncestral.ApplyUpdates(-1);
    vgDadosCadastro.ChaveIdPrincipal := ClientAncestral.Fields[0].AsInteger;
    if not vgDadosCadastro.SalvarNovo then
      close;
  end;
end;

procedure TfrmCadastroAuxSimplificado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  vgDadosCadastro.SomentePesquisa := False;

  Action := caFree;
  frmCadastroAuxSimplificado := nil;
end;

procedure TfrmCadastroAuxSimplificado.FormCreate(Sender: TObject);
begin
  vgDadosCadastro.Confirmado := False;

  if vgDadosCadastro.SomentePesquisa then
    exit;

  ClientAncestral.Active := False;
  DataSetAncestral.SQL.Text := 'SELECT * FROM ' + vgDadosCadastro.Tabela +
    ' WHERE ' + vgDadosCadastro.CampoId + ' = :' + vgDadosCadastro.CampoId;

  if vgDadosCadastro.ChaveIdPrincipal > 0 then
  begin
    DataSetAncestral.Params[0].AsBCD := vgDadosCadastro.ChaveIdPrincipal;
    ClientAncestral.Active := True;
    ClientAncestral.Edit;
  end
  else
  begin
    DataSetAncestral.Params[0].AsBCD := 0;
    ClientAncestral.Active := True;
    ClientAncestral.Insert;
  end;

end;

end.
