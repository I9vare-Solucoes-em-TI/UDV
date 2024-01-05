unit FrameRemuneracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDevExpressStyle,
  dxSkinFoggy, dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic,
  dxSkinSharp, dxSkinSharpPlus, dxSkinSilver, dxSkinSpringTime, dxSkinStardust,
  dxSkinSummer2008, dxSkinTheAsphaltWorld, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVS2010, dxSkinWhiteprint, dxSkinXmas2008Blue, Menus,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxImage, cxCurrencyEdit, ComCtrls,
  DBCGrids, cxPC, StdCtrls, cxButtons, cxDropDownEdit, cxCalendar, cxDBEdit,
  cxSpinEdit, cxGroupBox, cxRadioGroup, cxTextEdit, cxMaskEdit, cxImageComboBox,
  cxLabel, ExtCtrls, DB;

type
  TFmeRemuneracao = class(TFrame)
    pnlDadosRemuneracao: TPanel;
    cxLabel5: TcxLabel;
    cxLabel2: TcxLabel;
    icxTipoRenumeracao: TcxDBImageComboBox;
    rdbPagamentoIndependente: TcxRadioButton;
    rdbPagamentoQuitacao: TcxRadioButton;
    cxGroupBox1: TcxGroupBox;
    cxLabel10: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel1: TcxLabel;
    edtValorTotalCliente: TcxDBCurrencyEdit;
    edtPercentual: TcxDBCurrencyEdit;
    edtValorMoeda: TcxDBCurrencyEdit;
    edtValorRepassado: TcxDBCurrencyEdit;
    edtQtd: TcxDBSpinEdit;
    edtValorParcela: TcxDBCurrencyEdit;
    edtDataPrevista: TcxDBDateEdit;
    btnRemuneracaoConfirmar: TcxButton;
    lblInformacao: TcxLabel;
    lblDataContrato: TcxLabel;
    pgcParcelas: TcxPageControl;
    tabParcelas: TcxTabSheet;
    tabVazio: TcxTabSheet;
    cbxParcelas: TcxGroupBox;
    gridParcelas: TDBCtrlGrid;
    edtParcelaDataVencimento: TcxDBDateEdit;
    edtParcelaSituacao: TcxDBImageComboBox;
    edtParcelaValor: TcxDBCurrencyEdit;
    HeaderControl1: THeaderControl;
    edtTotalParcelas: TcxCurrencyEdit;
    edtRestante: TcxCurrencyEdit;
    imgSituacaoEdicao: TcxImage;
    btnAdicionarParcela: TcxButton;
    btnExcluirParcela: TcxButton;
    btnDuplicarParcela: TcxButton;
    lblRestante: TcxLabel;
    procedure icxTipoRenumeracaoPropertiesChange(Sender: TObject);
    procedure icxTipoRenumeracaoPropertiesEditValueChanged(Sender: TObject);
    procedure rdbPagamentoIndependenteClick(Sender: TObject);
    procedure rdbPagamentoQuitacaoClick(Sender: TObject);
    procedure btnRemuneracaoConfirmarClick(Sender: TObject);
    procedure edtPercentualExit(Sender: TObject);
    procedure edtPercentualPropertiesEditValueChanged(Sender: TObject);
    procedure edtValorMoedaExit(Sender: TObject);
    procedure edtValorMoedaPropertiesChange(Sender: TObject);
    procedure edtQtdPropertiesEditValueChanged(Sender: TObject);
    procedure btnAdicionarParcelaClick(Sender: TObject);
    procedure btnExcluirParcelaClick(Sender: TObject);
    procedure btnDuplicarParcelaClick(Sender: TObject);
    procedure edtParcelaDataVencimentoPropertiesChange(Sender: TObject);
    procedure edtParcelaValorPropertiesChange(Sender: TObject);
  private
    vlLocal, vlChave : string;
    vlCalcularValor : Boolean;
    procedure VerificarTipoRemuneracao;
    procedure VerificarItensSelecionadoas;
    procedure CalcularValorPercentualRenumerar(vpValor : Currency; vpTipo : Char);    
  public
    vlCriandoForm : Boolean;
  end;

implementation

uses Lookup_Servico, Controles, Rotinas;

{$R *.dfm}

procedure TFmeRemuneracao.btnAdicionarParcelaClick(Sender: TObject);
begin
  if (icxTipoRenumeracao.EditValue <> '3') then
    exit;

  if not dtmLookupServico.ClientParcelas.Active then
    dtmLookupServico.ClientParcelas.Active := True;

  if not dtmLookupServico.ClientParcelas.IsEmpty then
    dtmLookupServico.ClientParcelas.Append;

  edtParcelaDataVencimento.SetFocus;
end;

procedure TFmeRemuneracao.btnDuplicarParcelaClick(Sender: TObject);
var
  viValor : Currency;
  viData  : TDate;
  viChave : String;
begin
  inherited;
  if not btnDuplicarParcela.Enabled then
    exit;

  dtmLookupServico.ClientParcelas.Last;
  viValor := dtmLookupServico.ClientParcelasVALOR_PARCELA.AsCurrency;
  viData  := CalcularDataVencimento(dtmLookupServico.ClientParcelasDATA_VENCIMENTO.AsDateTime, 4, 1);
  viChave := dtmLookupServico.ClientParcelasCHAVE.AsString;

  dtmLookupServico.ClientParcelas.Append;
  dtmLookupServico.ClientParcelasVALOR_PARCELA.AsCurrency   := viValor;
  dtmLookupServico.ClientParcelasDATA_VENCIMENTO.AsDateTime := viData;
  dtmLookupServico.ClientParcelasCHAVE.AsString             := viChave;
  dtmLookupServico.ClientParcelas.Post;
end;

procedure TFmeRemuneracao.btnExcluirParcelaClick(Sender: TObject);
begin
  if (icxTipoRenumeracao.EditValue <> '3') then
    exit;

  if dtmLookupServico.ClientParcelas.State in [dsInsert, dsedit] then
    dtmLookupServico.ClientParcelas.Cancel;

  inherited;

  dtmLookupServico.ClientParcelas.Delete;
  dtmLookupServico.SomarGridValores(dtmLookupServico.ClientRemuneracao, vlCriandoForm, edtTotalParcelas, edtRestante,2);
end;

procedure TFmeRemuneracao.btnRemuneracaoConfirmarClick(Sender: TObject);
begin
  if not (dtmLookupServico.ClientRemuneracao.state in [dsEdit, dsInsert]) then
    dtmLookupServico.ClientRemuneracao.Edit;

  VerificarPreenchimentoicx_DB(icxTipoRenumeracao.Text, 'Tipo da Remuneração', icxTipoRenumeracao);

  if icxTipoRenumeracao.EditValue <> '3' then
  begin
    VerificarPreenchimentoDTA_DB(edtDataPrevista.Text, 'Data Prevista', edtDataPrevista);
    if edtDataPrevista.Date < StrToDate(vgDadosRemuneracao.DataContrato) then
    begin
      Application.MessageBox('Data Prevista não pode ser menor que a data do Contrato!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      edtDataPrevista.SetFocus;
      Abort;
    end;

  end;

  if dtmLookupServico.ClientRemuneracaoVALOR_PROLABORE.AsCurrency <= 0 then
  begin
    Application.MessageBox('Valor a Renumerar Inválido !!!', 'Atenção', MB_OK + MB_ICONWARNING);
    abort;
  end;

  if icxTipoRenumeracao.EditValue = '3' then
  begin
    if dtmLookupServico.ClientParcelas.RecordCount = 0 then
    begin
      Application.MessageBox('Cadastre as Parcelas Desejadas!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      edtParcelaDataVencimento.SetFocus;
      abort;
    end;

    if edtTotalParcelas.EditValue > edtValorMoeda.EditValue then
    begin
      Application.MessageBox('Valor total das parcelas maior que o valor definido a remunerar!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      edtParcelaDataVencimento.SetFocus;
      abort;
    end;

    if edtRestante.EditValue > 0 then
    begin
      Application.MessageBox('Valor total das parcelas esta menor que o valor definido a remunerar!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      edtParcelaDataVencimento.SetFocus;
      abort;
    end;
  end;

  if rdbPagamentoIndependente.Checked then
       dtmLookupServico.ClientRemuneracaoTIPO_PAGAMENTO.AsInteger := 1
  else dtmLookupServico.ClientRemuneracaoTIPO_PAGAMENTO.AsInteger := 2;

  // Verifica e seta a opção de Garvar Alteração
  if not lblInformacao.Visible then
    dtmLookupServico.ClientRemuneracaoGRAVAR.AsBoolean := True;

  btnRemuneracaoConfirmar.Visible := False;
  dtmLookupServico.ClientRemuneracao.Post;
end;

procedure TFmeRemuneracao.CalcularValorPercentualRenumerar(vpValor: Currency;
  vpTipo: Char);
begin
  with dtmLookupServico do
  begin
    if not (vlCalcularValor) or (ClientRemuneracaoVALOR_DOCUMENTO.AsCurrency = 0) then
      exit;

    if not (ClientRemuneracao.State in [dsEdit, dsInsert]) then
      ClientRemuneracao.Edit;

    if vpTipo = '1' then
    begin
      if edtPercentual.EditValue > 0 then
        ClientRemuneracaoVALOR_PROLABORE.AsCurrency := Arredondamento(((ClientRemuneracaoVALOR_DOCUMENTO.AsCurrency * edtPercentual.EditValue)/100),2)
    end
    else edtPercentual.EditValue := Arredondamento(((ClientRemuneracaoVALOR_PROLABORE.AsCurrency * 100)/ClientRemuneracaoVALOR_DOCUMENTO.AsCurrency),2);

    if ClientRemuneracaoQTD.AsInteger > 0 then
      ClientRemuneracaoVALOR_PARCELA.AsCurrency := Arredondamento(((ClientRemuneracaoVALOR_PROLABORE.AsCurrency - ClientRemuneracaoVALOR_PAGO.AsCurrency)/
                                                                ClientRemuneracaoQTD.AsInteger),2);
    vlCalcularValor := False;

    if icxTipoRenumeracao.EditValue = 3 then
      dtmLookupServico.SomarGridValores(ClientRemuneracao, vlCriandoForm, edtTotalParcelas, edtRestante, 2);

    if edtPercentual.EditValue > 100 then
    begin
      Application.MessageBox('% a remunerar deve ser menor que 100%!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      edtPercentual.SetFocus;
      abort;
    end;
  end;
end;

procedure TFmeRemuneracao.edtParcelaDataVencimentoPropertiesChange(Sender: TObject);
begin
  imgSituacaoEdicao.Visible := True;
end;

procedure TFmeRemuneracao.edtParcelaValorPropertiesChange(Sender: TObject);
begin
  imgSituacaoEdicao.Visible := True;
end;

procedure TFmeRemuneracao.edtPercentualExit(Sender: TObject);
begin
  if edtPercentual.Text = '' then
    edtPercentual.EditValue := 0 ;

  CalcularValorPercentualRenumerar(edtPercentual.EditValue, '1');
end;

procedure TFmeRemuneracao.edtPercentualPropertiesEditValueChanged(Sender: TObject);
begin
  vlCalcularValor := True;
end;

procedure TFmeRemuneracao.edtQtdPropertiesEditValueChanged(Sender: TObject);
begin
  vlCalcularValor := True;
end;

procedure TFmeRemuneracao.edtValorMoedaExit(Sender: TObject);
begin
  if vlCriandoForm then
    exit;

  if dtmLookupServico.ClientRemuneracaoVALOR_PROLABORE.AsVariant = null then
    dtmLookupServico.ClientRemuneracaoVALOR_PROLABORE.AsCurrency := 0;

  CalcularValorPercentualRenumerar(dtmLookupServico.ClientRemuneracaoVALOR_PROLABORE.AsCurrency, '2');
end;

procedure TFmeRemuneracao.edtValorMoedaPropertiesChange(Sender: TObject);
begin
  vlCalcularValor := True;
end;

procedure TFmeRemuneracao.icxTipoRenumeracaoPropertiesChange(Sender: TObject);
var
  viTipo : Integer;
begin
  inherited;
  if (vlCriandoForm) or (icxTipoRenumeracao.EditValue = null) then
    exit;

  VerificarTipoRemuneracao;

  case StrToInt(icxTipoRenumeracao.EditValue) of
    1 : dtmLookupServico.ClientRemuneracaoQTD.AsInteger := 1;
    2 : dtmLookupServico.ClientRemuneracaoQTD.AsInteger := vgDadosRemuneracao.Qtd;
    3 : dtmLookupServico.ClientRemuneracaoQTD.AsInteger := 0;
  end;
end;

procedure TFmeRemuneracao.icxTipoRenumeracaoPropertiesEditValueChanged(Sender: TObject);
begin
  if icxTipoRenumeracao.EditValue = null then
    exit;

  edtValorMoedaExit(self);
  rdbPagamentoQuitacao.Enabled := icxTipoRenumeracao.EditValue = '2';
  edtDataPrevista.Enabled      := icxTipoRenumeracao.EditValue <> '3';

  if icxTipoRenumeracao.EditValue <> '2' then
    rdbPagamentoIndependente.Checked := True;

  dtmLookupServico.FiltrarClienteParcelas(icxTipoRenumeracao.EditValue, 'CHAVE = '+QuotedStr(dtmLookupServico.ClientRemuneracaoCHAVE.AsString));
  dtmLookupServico.ClientParcelas.Edit;
end;

procedure TFmeRemuneracao.rdbPagamentoIndependenteClick(Sender: TObject);
begin
  rdbPagamentoIndependente.Font.Color := clRed;
  rdbPagamentoQuitacao.Font.Color     := clBlack;
  btnRemuneracaoConfirmar.Visible     := True;
end;

procedure TFmeRemuneracao.rdbPagamentoQuitacaoClick(Sender: TObject);
begin
  rdbPagamentoIndependente.Font.Color := clBlack;
  rdbPagamentoQuitacao.Font.Color     := clRed;
  btnRemuneracaoConfirmar.Visible     := True;
end;

procedure TFmeRemuneracao.VerificarItensSelecionadoas;
begin

end;

procedure TFmeRemuneracao.VerificarTipoRemuneracao;
begin
 //
end;

end.
