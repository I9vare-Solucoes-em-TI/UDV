unit Confirmacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxLabel, cxSpinEdit, cxGraphics,
  cxImageComboBox, cxCurrencyEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxGroupBox, cxDBEdit, ComCtrls, DBCGrids, DB, DBClient, SimpleDS,
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinDevExpressDarkStyle;

type

  TDadosConfimacao = Record
    Data: TDateTime;
    Qtd : Integer;
    Confirmado, Multa, GerarBoleto : Boolean;
    Saida : Boolean;
  End;

  TfrmConfirmacao = class(TForm)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    Panel4: TPanel;
    imgReceber: TImage;
    Panel1: TPanel;
    btnConfirmar: TcxButton;
    btnCancelar: TcxButton;
    cbxParcelas: TcxGroupBox;
    gridParcelas: TDBCtrlGrid;
    HeaderControl1: THeaderControl;
    Panel3: TPanel;
    lblRestante: TcxLabel;
    edtTotalParcelas: TcxCurrencyEdit;
    edtRestante: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    cxLabel1: TcxLabel;
    lcxCompromisso: TcxDBLookupComboBox;
    edtVencimento: TcxDBDateEdit;
    edtValorItem: TcxDBCurrencyEdit;
    lcxEspecie: TcxDBImageComboBox;
    edtValorRegistrar: TcxDBCurrencyEdit;
    edtDataRegistrrar: TcxDBDateEdit;
    lcxCaixaLancamento: TcxDBLookupComboBox;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure edtValorRegistrarExit(Sender: TObject);
  private
    { Private declarations }
  public
    Procedure ArmazenarDadosRegistro;
  end;

var
  frmConfirmacao: TfrmConfirmacao;
  vgDadosConfirmacao : TDadosConfimacao;

implementation

uses Controles, LookupFinanceiro, Lookup_Contabil;

{$R *.dfm}

procedure TfrmConfirmacao.ArmazenarDadosRegistro;
begin
  with dtmLookupFinanceiro do
  begin
    if vgDadosLivroCaixa.CaixaId = 0 then
    begin
      vgDadosLivroCaixa.CaixaId := dtmControles.GetInt(' SELECT CAIXA_ID FROM J_CAIXA WHERE PRINCIPAL = '+QuotedStr('S'));
      ClientItem.EmptyDataSet;
    end;

    ClientItem.Append;
    ClientItemDATA_REALIZACAO.AsDateTime := StrToDate(dtmControles.DataHoraBanco(4));
    ClientItemDATA_VENCIMENTO.AsDateTime := StrToDate(vgDadosLivroCaixa.DataVencimento);
    ClientItemVALOR_ITEM.AsCurrency      := vgDadosLivroCaixa.ValorCompromisso - vgDadosLivroCaixa.ValorPago;
    ClientItemVALOR_REGISTRAR.AsCurrency := vgDadosLivroCaixa.ValorCompromisso - vgDadosLivroCaixa.ValorPago;
    ClientItemESPECIE.AsString           := vgDadosLivroCaixa.Especie;
    ClientItemCOMPROMISSO.AsInteger      := vgDadosLivroCaixa.ContabilContaID;
    ClientItemOPERACAO.AsString          := vgDadosLivroCaixa.Operacao;
    ClientItemCAIXA.AsInteger            := vgDadosLivroCaixa.CaixaId;
    ClientItemCENTRO_CUSTO_ID.AsInteger     := vgDadosLivroCaixa.CentroCustoId;
    ClientItemBALANCETE_GRUPO_ID.AsInteger  := vgDadosLivroCaixa.BalanceteGrupoId;
    ClientItemLIVRO_FINANCEIRO_ID.AsInteger := vgDadosLivroCaixa.LivroFinanceiroID;
    ClientItemPESSOA_ID.AsInteger           := vgDadosLivroCaixa.PessoaId;
    ClientItemHISTORICO.AsString            := vgDadosLivroCaixa.Historico;
    ClientItemDETALHES.AsString             := vgDadosLivroCaixa.Observacao;
    ClientItem.post;
  end;
end;

procedure TfrmConfirmacao.btnConfirmarClick(Sender: TObject);
var
  viSituacao : String;

begin
  if dtmLookupFinanceiro.ClientItem.State in [dsEdit] then
    dtmLookupFinanceiro.ClientItem.Post;

  if Application.MessageBox('Confirma Registro de Pagamento?',
      'Confirma��o', MB_YESNO) = IDNO then
    exit;

  try
    dtmControles.StartTransaction;
    with dtmLookupFinanceiro do
    begin
      ClientItem.DisableControls;
      ClientItem.First;
      while not ClientItem.Eof do
      begin
        vgDadosLivroCaixa.CaixaID           := ClientItemCAIXA.AsInteger;
        vgDadosLivroCaixa.DataPagamento     := FormatDateTime('DD.MM.YYYY', ClientItemDATA_REALIZACAO.AsDateTime);
        vgDadosLivroCaixa.DataVencimento    := vgDadosLivroCaixa.DataVencimento;
        vgDadosLivroCaixa.ValorPago         := ClientItemVALOR_REGISTRAR.AsCurrency;
        vgDadosLivroCaixa.Especie           := ClientItemESPECIE.AsString;
        vgDadosLivroCaixa.Referencia        := IntToStr(dtmLookupContabil.PegarAnoMes(ClientItemDATA_VENCIMENTO.AsString));
        vgDadosLivroCaixa.Operacao          := ClientItemOPERACAO.AsString;
        vgDadosLivroCaixa.PessoaId          := ClientItemPESSOA_ID.AsInteger;
        vgDadosLivroCaixa.CentroCustoId     := ClientItemCENTRO_CUSTO_ID.AsInteger;
        vgDadosLivroCaixa.BalanceteGrupoId  := ClientItemBALANCETE_GRUPO_ID.AsInteger;
        vgDadosLivroCaixa.Historico         := ClientItemHISTORICO.AsString;
        vgDadosLivroCaixa.LivroFinanceiroID := ClientItemLIVRO_FINANCEIRO_ID.AsInteger;
        vgDadosLivroCaixa.AnoMesRegistro    := IntToStr(dtmLookupContabil.PegarAnoMes(ClientItemDATA_REALIZACAO.AsString));
        vgDadosLivroCaixa.Observacao        := ClientItemDETALHES.AsString;
        dtmLookupContabil.RegistrarRecebimentoFinanceiro;

        BaixarEstornar('R', '', vgDadosLivroCaixa.LivroFinanceiroID, vgDadosLivroCaixa.LIvroAgendamentoId,
                        ClientItemVALOR_ITEM.AsCurrency, ClientItemVALOR_REGISTRAR.AsCurrency);
        ClientItem.Next;
      end;
      dtmControles.Commit;

      vgDadosLivroCaixa.Confirmado := True;
      ClientItem.EnableControls;
      Close;
    end;
  except
    dtmControles.Roolback;
    ShowMessage('Problemas na Grava��o. Tente Novamente!!!');
  end;
end;

procedure TfrmConfirmacao.cxButton1Click(Sender: TObject);
begin
  vgDadosLivroCaixa.Confirmado := False;
  close;
end;

procedure TfrmConfirmacao.edtValorRegistrarExit(Sender: TObject);
begin
  if (edtValorRegistrar.EditValue > edtValorItem.EditValue) OR
     (edtValorRegistrar.EditValue <= 0) then
  begin
    Application.MessageBox('Valor Inv�lido!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtValorRegistrar.SetFocus;
  end
  else
    if dtmLookupFinanceiro.ClientItem.State in [dsEdit] then
      dtmLookupFinanceiro.ClientItem.Post;
end;

procedure TfrmConfirmacao.FormActivate(Sender: TObject);
begin
  dtmLookupFinanceiro.ClientItem.First;
  dtmLookupFinanceiro.SomarGridValores(edtTotalParcelas, edtRestante);
  dtmLookupFinanceiro.ClientItem.Edit;
  lcxEspecie.SetFocus;
end;

procedure TfrmConfirmacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmConfirmacao := nil;
end;

end.

