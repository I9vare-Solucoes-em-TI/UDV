unit RelatorioGeral;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxGraphics,
  Menus, cxCustomData, cxStyles, cxTL, cxMaskEdit, cxImageComboBox,
  cxDBLookupComboBox, cxInplaceContainer, cxDBTL, cxTLData, cxTextEdit,
  StdCtrls, cxButtons, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxLabel,
  cxControls, cxContainer, cxEdit, cxGroupBox;

type
  TfrmRelatorioGeral = class(TForm)
    cxGroupBox6: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    edtPesquisarResponsavel: TcxLookupComboBox;
    edtPesquisarSituacao: TcxImageComboBox;
    edtPesquisarTipoAcao: TcxLookupComboBox;
    edtPesquisarNatureza: TcxLookupComboBox;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    edtPesquisarCliente: TcxTextEdit;
    cxDBTreeList1: TcxDBTreeList;
    cxDBTreeList1cxDBTreeListColumn11: TcxDBTreeListColumn;
    cxDBTreeListColumn1: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn10: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn5: TcxDBTreeListColumn;
    cxDBTreeListColumn2: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn6: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn7: TcxDBTreeListColumn;
    cxDBTreeListColumn3: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeListColumn4: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn9: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn8: TcxDBTreeListColumn;
    cxDBTreeList1cxDBTreeListColumn12: TcxDBTreeListColumn;
    cxTextEdit1: TcxTextEdit;
    cxLabel1: TcxLabel;
    btnFechar: TcxButton;
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioGeral: TfrmRelatorioGeral;

implementation

{$R *.dfm}

procedure TfrmRelatorioGeral.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelatorioGeral.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action            := caFree;
  frmRelatorioGeral := nil;
end;

end.
