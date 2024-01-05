unit ModificarFavorecidoCaucaia;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadastroAuxSimplificado, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, Menus,
  cxLookAndFeelPainters, FMTBcd, DB, DBClient, Provider, SqlExpr, StdCtrls,
  cxButtons, ExtCtrls, cxControls, cxContainer, cxEdit, cxLabel, cxCheckBox,
  cxDBEdit, cxTextEdit, cxGroupBox, cxGraphics, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMaskEdit, cxDropDownEdit, SimpleDS, cxSpinEdit,
  cxTimeEdit, cxCalendar, cxMemo, cxRichEdit, cxImageComboBox, cxCurrencyEdit,
  dxSkinscxPCPainter, cxPC, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid, ComCtrls, DBCGrids,
  cxImage, cxRadioGroup, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxPCdxBarPopupMenu, dxSkinDevExpressDarkStyle, dxBarBuiltInMenu,
  DbxDevartInterBase;

type
  TfrmModificarFavorecidoCaucaia = class(TfrmCadastroAuxSimplificado)
    ClientAncestralLIVRO_AGENDAMENTO_ID: TBCDField;
    ClientAncestralDATA_INICIAL: TSQLTimeStampField;
    ClientAncestralDATA_FINAL: TSQLTimeStampField;
    ClientAncestralPERIODO: TStringField;
    ClientAncestralVALOR_PARCELA: TBCDField;
    ClientAncestralQTD: TBCDField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralESPECIE: TStringField;
    ClientAncestralBALANCETE_GRUPO_ID: TBCDField;
    ClientAncestralHISTORICO: TStringField;
    ClientAncestralOBSERVACAO: TStringField;
    ClientAncestralPROCESSO_TRAMITE_ID: TBCDField;
    ClientAncestralCONTABIL_CONTA_ID: TBCDField;
    ClientAncestralPESSOA_ID: TBCDField;
    ClientAncestralDATA_REGISTRO: TSQLTimeStampField;
    ClientAncestralVALOR_PROLABORE: TBCDField;
    ClientAncestralCENTRO_CUSTO_ID: TBCDField;
    ClientAncestralTIPO: TStringField;
    ClientAncestralIR: TStringField;
    ClientAncestralCNJ: TStringField;
    ClientAncestralCAIXA_ID: TBCDField;
    ClientAncestralCONTABIL_GRUPO_ID: TBCDField;
    ClientAncestralDOCUMENTO_NUMERO: TStringField;
    ClientAncestralREGISTRO_PARCIAL: TStringField;
    ClientAncestralOPERACAO: TStringField;
    lblCliente: TcxLabel;
    cxLabel1: TcxLabel;
    lcxFavorecidoAtual: TcxLookupComboBox;
    lcxFavorecidoNovo: TcxLookupComboBox;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnConfirmarClick(Sender: TObject);
  private
  public
    vlCriandoForm, vlAtivandoForm: Boolean;
    { Public declarations }
  end;

var
  frmModificarFavorecidoCaucaia: TfrmModificarFavorecidoCaucaia;
  vgModificarFavorecidoAtual, vgModificarFavorecidoNovo : Integer;

implementation

uses
  Lookup, Controles, Rotinas, LookupFinanceiro;

{$R *.dfm}

procedure TfrmModificarFavorecidoCaucaia.btnConfirmarClick(Sender: TObject);
begin
  if Application.MessageBox('Confirma Alteração do Favorecido dos Itens Selecionado?', 'Confirmação', MB_YESNO) = IDNO then
    exit;

   vgModificarFavorecidoNovo := lcxFavorecidoNovo.EditValue;
   Close;
end;

procedure TfrmModificarFavorecidoCaucaia.FormActivate(Sender: TObject);
begin
  inherited;
  lcxFavorecidoAtual.EditValue := vgModificarFavorecidoAtual;
  lcxFavorecidoNovo.SetFocus;
end;

procedure TfrmModificarFavorecidoCaucaia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  Action := caFree;
  frmModificarFavorecidoCaucaia := nil;
end;

end.








