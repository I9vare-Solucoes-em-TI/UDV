unit VisualizarSROCorreios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  OleCtrls, SHDocVw, cxGraphics, cxLookAndFeels, frxClass, cxGridExportLink;

type
  TfrmVisualizarSROCorreios = class(TForm)
    wbrRastreamento: TWebBrowser;
    Panel1: TPanel;
    Panel4: TPanel;
    pnlEntrada: TPanel;
    Image1: TImage;
    btnFechar: TcxButton;
    btnImprimirApontamento: TcxButton;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnImprimirApontamentoClick(Sender: TObject);
    procedure wbrRastreamentoDocumentComplete(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
  private
    { Private declarations }

    procedure WBPrintWithDialog(WB: TWebBrowser);
    function GetWebSRO(var vpBrowser: TWebBrowser; vpObjeto: String): Boolean;
  public
    { Public declarations }
    vlObjeto : String;
  end;

var
  frmVisualizarSROCorreios: TfrmVisualizarSROCorreios;

implementation

uses Controles;

{$R *.dfm}

{ TfrmVisualizarSROCorreios }

Function TfrmVisualizarSROCorreios.GetWebSRO(var vpBrowser: TWebBrowser; vpObjeto: String) : Boolean;
var
  viSiteSRO : string;
begin
  Result := True;
  viSiteSRO := 'http://websro.correios.com.br/sro_bin/txect01$.QueryList?P_LINGUA=001&P_TIPO=001&P_COD_UNI=';

 vpBrowser.Navigate(viSiteSRO + vpObjeto);

  While vpBrowser.ReadyState <> READYSTATE_COMPLETE do
  begin
    Application.ProcessMessages;
    Sleep(10);
  end;
end;


procedure TfrmVisualizarSROCorreios.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmVisualizarSROCorreios.btnImprimirApontamentoClick(
  Sender: TObject);
begin
  WBPrintWithDialog(wbrRastreamento);
end;

procedure TfrmVisualizarSROCorreios.FormActivate(Sender: TObject);
begin
  GetWebSRO(wbrRastreamento, vlObjeto);
end;

procedure TfrmVisualizarSROCorreios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmVisualizarSROCorreios := Nil;
end;

procedure TfrmVisualizarSROCorreios.WBPrintWithDialog(WB: TWebBrowser);
var
  vIn, vOut: OleVariant;
begin
  WB.ControlInterface.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_PROMPTUSER, vIn, vOut) ;
end;

procedure TfrmVisualizarSROCorreios.wbrRastreamentoDocumentComplete(
  ASender: TObject; const pDisp: IDispatch; const URL: OleVariant);
begin
  pnlEntrada.Visible := False;
end;

end.
