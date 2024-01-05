unit Financeiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCurrencyEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxTextEdit, cxMaskEdit, cxLabel,
  cxContainer, cxGroupBox, cxPC, StdCtrls, cxButtons, ExtCtrls, cxLookAndFeels,
  dxBarBuiltInMenu, cxNavigator;

type
  TfrmFinanceiro = class(TForm)
    PanelBotoes: TPanel;
    PanelBotoesBasicos: TPanel;
    PanelBotaoFechar: TPanel;
    cxBtnFechar: TcxButton;
    cxPageControl1: TcxPageControl;
    Pesquisa: TcxTabSheet;
    cxGroupBox6: TcxGroupBox;
    cxLabel6: TcxLabel;
    edtPesquisarCPF: TcxMaskEdit;
    edtPesquisarCliente: TcxTextEdit;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    cxGrid2: TcxGrid;
    cxGridDBTableView3: TcxGridDBTableView;
    cxGridDBTableVinculoPESSOANOME: TcxGridDBColumn;
    cxGridDBTableVinculoPESSOATIPO: TcxGridDBColumn;
    cxGridDBTableVinculoPERCENTUAL: TcxGridDBColumn;
    cxGridDBTableVinculoVALORRECEBER: TcxGridDBColumn;
    cxGridDBTableVinculoSITUACAO: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxBtnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFinanceiro: TfrmFinanceiro;

implementation

{$R *.dfm}

procedure TfrmFinanceiro.cxBtnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmFinanceiro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action        := caFree;
  frmFinanceiro := nil;
end;

end.
