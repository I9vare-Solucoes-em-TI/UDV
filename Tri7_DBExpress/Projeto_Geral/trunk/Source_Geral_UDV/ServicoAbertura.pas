unit ServicoAbertura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, StdCtrls, cxButtons, ExtCtrls, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxGroupBox, frxClass,
  frxDBSet, cxLabel, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Menus, dxSkinsCore, dxSkinsDefaultPainters, cxGraphics,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, dxGDIPlusClasses;

type
  TNovoServico = Record
    Apresentante : String;
    Escrevente : Integer;
    Confirmado : Boolean;
  end;


  TfrmServicoAbertura = class(TfrmCadAuxiliar)
    ClientAncestralDOCUMENTO_ID: TBCDField;
    ClientAncestralNUMERO_REGISTRO: TBCDField;
    ClientAncestralLIVRO: TStringField;
    ClientAncestralNUMERO_PAGINAS: TBCDField;
    ClientAncestralNUMERO_VIAS: TBCDField;
    ClientAncestralDATA_REGISTRO: TSQLTimeStampField;
    ClientAncestralAPRESENTANTE: TStringField;
    ClientAncestralOBSERVACAO: TBlobField;
    ClientAncestralVALOR_DOCUMENTO: TBCDField;
    ClientAncestralTAXA_JUDICIARIA: TBCDField;
    ClientAncestralVALOR_CUSTAS: TBCDField;
    ClientAncestralTIPO_DOCUMENTO_ID: TBCDField;
    ClientAncestralEMOLUMENTO_ID: TBCDField;
    ClientAncestralVALOR_TOTAL: TBCDField;
    ClientAncestralLIVRO_NUMERO: TBCDField;
    ClientAncestralLIVRO_PAGINA: TBCDField;
    ClientAncestralNUMERO_PESSOAS: TBCDField;
    ClientAncestralPAGINA_ID: TIntegerField;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    Panel4: TPanel;
    imgPagar: TImage;
    lblInformacaoCertidao: TcxLabel;
    lcxEscrevente: TcxLookupComboBox;
    edtDescricao: TcxTextEdit;
    btnConfirmarItem: TcxButton;
    procedure btnConfirmarItemClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure lcxEscreventeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private

  public
    { Public declarations }
  end;

var
  frmServicoAbertura: TfrmServicoAbertura;
  vgNovoServico: TNovoServico;
  vgNovoApresentante : String;

implementation

uses Lookup, Controles, Rotinas;

{$R *.dfm}

procedure TfrmServicoAbertura.btnConfirmarItemClick(Sender: TObject);
var
  viQtdPalavras : Integer;
begin
  inherited;
  VerificarPreenchimentoLCX_TX(lcxEscrevente.Text, 'Escrevente',lcxEscrevente);

  viQtdPalavras := Rotinas.RetornatQdtPalavras(edtDescricao.text);
  if viQtdPalavras < 2 then
  begin
    Application.MessageBox('Nome Inválido!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
    edtDescricao.SetFocus;
    exit;
  end;

  vgNovoServico.Apresentante := edtDescricao.editValue;
  vgNovoServico.Escrevente   := lcxEscrevente.editValue;
  vgNovoServico.Confirmado   := True;
  Close;
end;

procedure TfrmServicoAbertura.edtDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    btnConfirmarItem.SetFocus;

end;

procedure TfrmServicoAbertura.FormActivate(Sender: TObject);
begin
  inherited;
  if vgNovoApresentante <> '' then
    edtDescricao.Text := vgNovoApresentante;
  edtDescricao.SetFocus;
end;

procedure TfrmServicoAbertura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  vgNovoApresentante := '';
  Action := caFree;
  frmServicoAbertura := nil;
end;

procedure TfrmServicoAbertura.FormCreate(Sender: TObject);
begin
  inherited;
  lcxEscrevente.EditValue  := vgNovoServico.Escrevente;

  vgNovoServico.Confirmado := False;
end;

procedure TfrmServicoAbertura.lcxEscreventeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    btnConfirmarItemClick(Self);
end;

end.
