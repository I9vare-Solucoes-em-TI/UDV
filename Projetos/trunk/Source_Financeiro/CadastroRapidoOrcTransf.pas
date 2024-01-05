unit CadastroRapidoOrcTransf;

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
  cxPCdxBarPopupMenu, dxCore, cxDateUtils, dxSkinDevExpressDarkStyle,
  dxBarBuiltInMenu, DbxDevartInterBase;

type
  TfrmCadastroRapidoOrcTransf = class(TfrmCadastroAuxSimplificado)
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    lcxOrcamentoDestino: TcxDBLookupComboBox;
    edtValorTransferir: TcxDBCurrencyEdit;
    edtHistorico: TcxDBTextEdit;
    dtsOrcamentoDestino: TDataSource;
    ClientOrcamentoDestino: TClientDataSet;
    ClientOrcamentoDestinoORCAMENTO: TStringField;
    ClientOrcamentoDestinoLIVRO_FINANCEIRO_ID: TIntegerField;
    edtOrcamentoOrigem: TcxTextEdit;
    ClientAncestralLIVRO_FINANCEIRO_ORIGEM_ID: TBCDField;
    ClientAncestralVALOR: TBCDField;
    ClientAncestralDATA: TSQLTimeStampField;
    ClientAncestralOBSERVACAO: TStringField;
    ClientAncestralORCAMENTO_RESERVA_ID: TBCDField;
    ClientAncestralLIVRO_FINANCEIRO_DESTINO_ID: TBCDField;
    edtValorDisponivel: TcxCurrencyEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure SalvarRegistro(vpSalvarComo : Boolean = False);
  private
    vlLivroFinanceiroOrigemId : Integer;

    procedure CarregarOrcamentos;

  public
    vlCriandoForm : Boolean;
    { Public declarations }
  end;

var
  frmCadastroRapidoOrcTransf: TfrmCadastroRapidoOrcTransf;

implementation

uses
  Lookup, Controles, Rotinas,
  Lookup_Contabil, Lookup_Servico, Pessoa, PessoaPreCadastro,
  ValidarPermissaoUsuario, LookupFinanceiro, Previsao;

{$R *.dfm}

procedure TfrmCadastroRapidoOrcTransf.btnConfirmarClick(Sender: TObject);
begin
  SalvarRegistro;
  vgDadosCadastro.Confirmado := True;
  inherited;
end;

procedure TfrmCadastroRapidoOrcTransf.CarregarOrcamentos;
var
  viPosicao : Integer;
begin
  with frmPrevisao do
  begin
    viPosicao := sqlFinanceiroCompromisso.RecNo;
    sqlFinanceiroCompromisso.DisableControls;
    sqlFinanceiroCompromisso.First;
    ClientOrcamentoDestino.EmptyDataSet;
    while not sqlFinanceiroCompromisso.Eof do
    begin
      if (sqlFinanceiroCompromissoOPERACAO.AsString = 'O') and (sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsInteger <> vlLivroFinanceiroOrigemId) then
      begin
        ClientOrcamentoDestino.Append;
        ClientOrcamentoDestinoORCAMENTO.AsString            := sqlFinanceiroCompromissoHISTORICO.AsString + '-'+sqlFinanceiroCompromissocalc_historico.AsString;
        ClientOrcamentoDestinoLIVRO_FINANCEIRO_ID.AsInteger := sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsInteger;
        ClientOrcamentoDestino.Post;
      end;
      sqlFinanceiroCompromisso.Next;
    end;
    sqlFinanceiroCompromisso.RecNo := viPosicao;
    sqlFinanceiroCompromisso.EnableControls;
  end;

end;

procedure TfrmCadastroRapidoOrcTransf.FormActivate(Sender: TObject);
begin
  inherited;
  lcxOrcamentoDestino.SetFocus;

  vlCriandoForm := False;
end;

procedure TfrmCadastroRapidoOrcTransf.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  vgDadosCadastro.SomentePesquisa := False;

  dtmLookupFinanceiro.AbrirFecharTelaBranco(False);
  Action := caFree;
  frmCadastroRapidoOrcTransf := nil;
end;

procedure TfrmCadastroRapidoOrcTransf.FormCreate(Sender: TObject);
var
  viCaixaId : Integer;
begin
  dtmLookupFinanceiro.AbrirFecharTelaBranco;

  with frmPrevisao do
  begin
    edtOrcamentoOrigem.EditValue := sqlFinanceiroCompromissoHISTORICO.AsString +'-'+ sqlFinanceiroCompromissocalc_historico.AsString;
    edtValorDisponivel.EditValue := sqlFinanceiroCompromissocalc_saida.AsCurrency;
    vlLivroFinanceiroOrigemId    := sqlFinanceiroCompromissoLIVRO_FINANCEIRO_ID.AsInteger;
  end;
  CarregarOrcamentos;

  vlCriandoForm := True;
  vgDadosLivroCaixa.Confirmado := False;
  inherited;
end;

procedure TfrmCadastroRapidoOrcTransf.SalvarRegistro(vpSalvarComo: Boolean);
begin
  if edtValorTransferir.EditValue = null then
    edtValorTransferir.EditValue := 0;

  VerificarPreenchimentoLCX_DB(lcxOrcamentoDestino.Text, 'Orçamento Destino', lcxOrcamentoDestino);
  VerificarPreenchimentoCUR_DB(edtValorTransferir.EditValue, 'Valor a Transferir', edtValorTransferir);

  if (edtValorTransferir.EditValue > edtValorDisponivel.EditValue) then
  begin
    Application.MessageBox(Pchar('Valor a Transferir está maior que o valor Disponível!!!'), 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
    edtValorTransferir.SetFocus;
    Abort;
  end;

  if Application.MessageBox('Confirma Transferência do Valor do Orçamento?',
      'Confirmação', MB_YESNO) = IDNO then
    Abort;

  ClientAncestralLIVRO_FINANCEIRO_ORIGEM_ID.AsInteger := vlLivroFinanceiroOrigemId;
  ClientAncestralDATA.AsString := dtmControles.DataHoraBanco(4);
  inherited;
end;

end.
