unit GerenciadorConfirmacao;

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
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, dxGDIPlusClasses,
  cxCurrencyEdit, cxCheckBox;

type

  TfrmGerenciadorConfirmacao = class(TfrmCadAuxiliar)
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
    btnConfirmarItem: TcxButton;
    lcxEscrevente: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    Panel4: TPanel;
    imgPagar: TImage;
    lblInformacaoCertidao: TcxLabel;
    procedure btnConfirmarItemClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lcxEscreventeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
  private
    vlControleId : Integer;
  public
  end;

var
  frmGerenciadorConfirmacao: TfrmGerenciadorConfirmacao;
  vgRegistroConfimado : Boolean;

implementation

uses Lookup, Controles, Rotinas, GerenciadorCadastro;


{$R *.dfm}

procedure TfrmGerenciadorConfirmacao.btnCancelarClick(Sender: TObject);
begin
  vgRegistroConfimado := False;
  inherited;

end;

procedure TfrmGerenciadorConfirmacao.btnConfirmarItemClick(Sender: TObject);

  procedure GravarRegistro;
  begin
    vgLivroDiario.Descricao           := frmGerenciadorCadastro.ClientItemDescricao.AsString;
    vgLivroDiario.Serventia           := frmGerenciadorCadastro.fmeCadastro.icxTipoSistema.EditValue;
    vgLivroDiario.Apresentante        := frmGerenciadorCadastro.fmeCadastro.edtApresentante.Text;
    vgLivroDiario.Valor               := frmGerenciadorCadastro.ClientItemValor.AsCurrency;
    vgLivroDiario.Operacao            := frmGerenciadorCadastro.ClientItemTipoTransacao.AsString;
    vgLivroDiario.Data                := frmGerenciadorCadastro.ClientItemData.AsDateTime;
    vgLivroDiario.Qtd                 := frmGerenciadorCadastro.ClientItemQtd.AsInteger;
    vgLivroDiario.Escrevente          := lcxEscrevente.EditValue;
    vgLivroDiario.CaixaServicoID      := frmGerenciadorCadastro.ClientItemTipoServico.AsInteger;;
    vgLivroDiario.ControleID          := vlControleId;
    vgLivroDiario.LIvro               := frmGerenciadorCadastro.ClientItemLivro.AsString;
    vgLivroDiario.Folha               := frmGerenciadorCadastro.ClientItemFolha.AsString;
    if frmGerenciadorCadastro.ClientItemProtocolo.AsString <> '' then
      vgLivroDiario.Protocolo         := frmGerenciadorCadastro.ClientItemProtocolo.AsInteger;
    vgLivroDiario.Selo                := frmGerenciadorCadastro.ClientItemSelo.AsString;
    dtmLookup.RegistrarLivroDiario;
  end;

begin
  try
    dtmControles.StartTransaction;
    vlControleId := dtmControles.GerarSequencia('C_REGISTRO_DIARIO_CONTROLE');

    with frmGerenciadorCadastro do
    begin
      ClientItem.First;
      while not ClientItem.Eof do
      begin
        GravarRegistro;
        ClientItem.Next;
      end;
    end;
    vgRegistroConfimado := True;
    vgDadosCadastroItem.ControleID       := vlControleId;
    vgDadosCadastroItem.EscreventePadrao := lcxEscrevente.EditValue;
    dtmControles.Commit;
  except
    dtmControles.Roolback;
    Application.MessageBox('Erro na Gravação. Tente Novamente!!!', 'Atenção', MB_OK + MB_ICONWARNING);
  end;
  Close;
end;

procedure TfrmGerenciadorConfirmacao.edtDescricaoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    btnConfirmarItem.SetFocus;

end;

procedure TfrmGerenciadorConfirmacao.FormActivate(Sender: TObject);
begin
  inherited;
  lcxEscrevente.EditValue := dtmControles.BuscarConfig('PRINCIPAL','GERAL','ESCREVENTE_PADRAO','I');
  btnConfirmarItem.SetFocus;
end;

procedure TfrmGerenciadorConfirmacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmGerenciadorConfirmacao := nil;
end;

procedure TfrmGerenciadorConfirmacao.lcxEscreventeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    btnConfirmarItemClick(Self);
end;

end.
