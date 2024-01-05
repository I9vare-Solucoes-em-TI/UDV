unit Aporte;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadastroAuxSimplificado, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Menus, FMTBcd, DB, DBClient, Provider,
  SqlExpr, StdCtrls, cxButtons, ExtCtrls, cxLabel, cxDropDownEdit, cxCalendar,
  cxDBEdit, cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox;

type
  TfrmAporte = class(TfrmCadastroAuxSimplificado)
    cxLabel10: TcxLabel;
    cxLabel16: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    lblCliente: TcxLabel;
    cxLabel2: TcxLabel;
    lcxCliente: TcxDBLookupComboBox;
    lcxCompromisso: TcxDBLookupComboBox;
    edtHistorico: TcxDBTextEdit;
    edtValorFixo: TcxDBCurrencyEdit;
    edtDataVencimentoFixa: TcxDBDateEdit;
    lcxConta: TcxDBLookupComboBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAporte: TfrmAporte;

implementation

{$R *.dfm}

end.
