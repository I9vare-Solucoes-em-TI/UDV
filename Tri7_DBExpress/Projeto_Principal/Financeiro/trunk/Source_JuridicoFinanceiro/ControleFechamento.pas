unit ControleFechamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, cxLookAndFeelPainters, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, StdCtrls, cxButtons, frxpngimage, ExtCtrls, cxContainer, cxLabel,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxPC, cxGroupBox;

type
  TfrmControleFechamento = class(TForm)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    Panel4: TPanel;
    imgReceber: TImage;
    PanelBotaoFechar: TPanel;
    cxBtnFechar: TcxButton;
    Panel3: TPanel;
    cxGroupBox4: TcxGroupBox;
    btnPesquisarRegistro: TcxButton;
    cxPageControl1: TcxPageControl;
    tabPeriodosFechados: TcxTabSheet;
    tabPeriodoAberto: TcxTabSheet;
    icxAno: TcxImageComboBox;
    lblAno: TcxLabel;
    btnBalanceteFechar: TcxButton;
    btnReabrirBalancete: TcxButton;
    btnBalanceteAnual: TcxButton;
    cxGridSelos: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridLevel4: TcxGridLevel;
    cxGridDBTableView5Column1: TcxGridDBColumn;
    cxGridDBTableView5Column2: TcxGridDBColumn;
    cxGridDBTableView5Column3: TcxGridDBColumn;
    cxGridDBTableView5Column4: TcxGridDBColumn;
    cxGridDBTableView5Column5: TcxGridDBColumn;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmControleFechamento: TfrmControleFechamento;

implementation

{$R *.dfm}

procedure TfrmControleFechamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmControleFechamento := nil;
end;

end.
