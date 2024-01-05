unit CalculoMultaJuros;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, Vcl.Menus, Vcl.StdCtrls,
  cxButtons, Vcl.ExtCtrls, cxLabel, cxRadioGroup, cxTextEdit, cxCurrencyEdit,
  Vcl.ComCtrls, dxCore, cxDateUtils, cxDropDownEdit, cxImageComboBox,
  cxGroupBox, cxMaskEdit, cxCalendar;

type

  TCalculoTaxa = record
    ValorCalcular, MultaTaxa, JurosTaxa, Desconto, OutraDeducao, OutrasTaxas : Currency;
    DataVencimento, DataCalculo : TDate;
    MultaTipo, LivroFinanceiroId : String;
    Confirmado : Boolean;
  end;

  TfrmCalculoMultaJuros = class(TForm)
    Panel2: TPanel;
    lblInformaca: TcxLabel;
    Panel4: TPanel;
    imgTitulo: TImage;
    Panel6: TPanel;
    btnCancelar: TcxButton;
    btnConfirmar: TcxButton;
    Panel1: TPanel;
    cxLabel10: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    edtValorAtual: TcxCurrencyEdit;
    edtDataCalculo: TcxDateEdit;
    edtDataVencimento: TcxDateEdit;
    edtQtdDias: TcxTextEdit;
    cxGroupBox1: TcxGroupBox;
    lblMulta: TcxLabel;
    lblJuros: TcxLabel;
    lblDesconto: TcxLabel;
    lblOutrasDeducao: TcxLabel;
    edtObservacaoMonetaria: TcxTextEdit;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    rdbMultaJUros: TcxRadioButton;
    rdbDesconto: TcxRadioButton;
    icxMultaTipo: TcxImageComboBox;
    edtMultaTaxa: TcxCurrencyEdit;
    edtValorMulta: TcxCurrencyEdit;
    edtJurosTaxa: TcxCurrencyEdit;
    edtJurosValor: TcxCurrencyEdit;
    edtOutrasTaxas: TcxCurrencyEdit;
    edtValorDesconto: TcxCurrencyEdit;
    edtValorOutros: TcxCurrencyEdit;
    cxGroupBox2: TcxGroupBox;
    edtValorCalculado: TcxCurrencyEdit;
    cxLabel5: TcxLabel;
    btnCalcular: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure rdbMultaJUrosClick(Sender: TObject);
    procedure rdbDescontoClick(Sender: TObject);
    procedure edtDataVencimentoExit(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure edtMultaTaxaExit(Sender: TObject);
    procedure edtJurosTaxaExit(Sender: TObject);
    procedure icxMultaTipoPropertiesEditValueChanged(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure cxLabel6Click(Sender: TObject);
    procedure edtOutrasTaxasExit(Sender: TObject);
  private
    procedure HabilitarCampos(vpHabilitado : Boolean);
  public
    { Public declarations }
  end;

var
  frmCalculoMultaJuros: TfrmCalculoMultaJuros;
  vgCalculoTaxa : TCalculoTaxa;

implementation

uses
  Rotinas, Controles, Lookup;

{$R *.dfm}

procedure TfrmCalculoMultaJuros.btnCalcularClick(Sender: TObject);
begin
  edtMultaTaxaExit(self);
  edtJurosTaxaExit(self);
  edtValorCalculado.EditValue := (vgCalculoTaxa.ValorCalcular + edtValorMulta.EditValue + edtJurosValor.EditValue + edtOutrasTaxas.EditValue) -
                                 (edtValorDesconto.EditValue + edtValorOutros.EditValue);
end;

procedure TfrmCalculoMultaJuros.btnCancelarClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCalculoMultaJuros.btnConfirmarClick(Sender: TObject);
begin
  btnCalcularClick(self);

  if Application.MessageBox('Confirma c�lculo realizado?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_LIVRO_FINANCEIRO SET VALOR_DESCONTO = :VALOR_DESCONTO, '+
                     '                          VALOR_JUROS    = :VALOR_JUROS, '+
                     '                          VALOR_MULTA    = :VALOR_MULTA, '+
                     '                  VALOR_OUTRA_DEDUCAO    = :VALOR_OUTRA_DEDUCAO, '+
                     '                  VALOR_OUTRAS_TAXAS     = :VALOR_OUTRAS_TAXAS, '+
                     '                       VALOR_CALCULO     = :VALOR_CALCULO, '+
                     '                 OBSERVACAO_MONETARIA    = :OBSERVACAO_MONETARIA '+
                     ' WHERE LIVRO_FINANCEIRO_ID = '+ vgCalculoTaxa.LivroFinanceiroId,2);
  with dtmControles.sqlAuxiliar do
  begin
    ParamByName('VALOR_DESCONTO').AsCurrency      := edtValorDesconto.EditValue;
    ParamByName('VALOR_JUROS').AsCurrency         := edtJurosValor.EditValue;
    ParamByName('VALOR_MULTA').AsCurrency         := edtValorMulta.EditValue;
    ParamByName('VALOR_OUTRA_DEDUCAO').AsCurrency := edtValorOutros.EditValue;
    ParamByName('VALOR_OUTRAS_TAXAS').AsCurrency  := edtOutrasTaxas.EditValue;
    ParamByName('VALOR_CALCULO').AsCurrency       := edtValorCalculado.EditValue;
    ParamByName('OBSERVACAO_MONETARIA').AsString  := edtObservacaoMonetaria.Text;
    ExecSQL(FALSE)
  end;
  vgCalculoTaxa.Confirmado := True;
  Close;
end;

procedure TfrmCalculoMultaJuros.cxLabel6Click(Sender: TObject);
begin
  if Application.MessageBox('Alterar/Salvar Taxa Padr�o Multa/Juros?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  dtmLookup.AtualizarParametro('TAXA_MULTA_TIPO', 'VALORES', 'FINANCEIRO', IntToStr(vgId), inttostr(icxMultaTipo.EditValue));
  dtmLookup.AtualizarParametro('TAXA_MULTA_PADRAO', 'VALORES', 'FINANCEIRO', IntToStr(vgId), CurrToStr(edtMultaTaxa.EditValue));
  dtmLookup.AtualizarParametro('TAXA_JUROS_PADRAO', 'VALORES', 'FINANCEIRO', IntToStr(vgId), CurrToStr(edtJurosTaxa.EditValue));
end;

procedure TfrmCalculoMultaJuros.edtDataVencimentoExit(Sender: TObject);
var
  viDataVcto, viDataPgto: TDate;
  viDiasAtraso: Integer;
begin
  viDataVcto             := StrToDate(edtDataCalculo.Text);
  viDataPgto             := StrToDate(edtDataVencimento.Text);
  viDiasAtraso           := Trunc(viDataPgto - viDataVcto);
  edtQtdDias.EditValue := IntToStr(viDiasAtraso);
end;

procedure TfrmCalculoMultaJuros.edtJurosTaxaExit(Sender: TObject);
var
  viValorCalculado, viPercentual : Currency;
begin
  if edtJurosTaxa.Text = '' then
    edtJurosTaxa.EditValue := 0;

  viPercentual            := ((edtJurosTaxa.EditValue)/30)*edtQtdDias.EditValue;
  viValorCalculado        := Arredondamento(dtmControles.MetodoArredondamento, ((vgCalculoTaxa.ValorCalcular+edtValorMulta.EditValue) * (viPercentual/100)),2);
  edtJurosValor.EditValue := viValorCalculado;
end;

procedure TfrmCalculoMultaJuros.edtMultaTaxaExit(Sender: TObject);
var
  viValorCalculado, viPercentual : Currency;
begin
  if edtMultaTaxa.Text = '' then
    edtMultaTaxa.EditValue := 0;

  viPercentual := edtMultaTaxa.EditValue;
  if icxMultaTipo.ItemIndex = 0 then
       viValorCalculado := Arredondamento(dtmControles.MetodoArredondamento, (vgCalculoTaxa.ValorCalcular * (viPercentual/100)),2)
  else viValorCalculado := viPercentual;
  edtValorMulta.EditValue := viValorCalculado;
end;

procedure TfrmCalculoMultaJuros.edtOutrasTaxasExit(Sender: TObject);
begin
  if edtOutrasTaxas.Text = '' then
    edtOutrasTaxas.EditValue := 0;
end;

procedure TfrmCalculoMultaJuros.FormActivate(Sender: TObject);
begin
  vgCalculoTaxa.Confirmado   := False;
  edtValorAtual.EditValue    := vgCalculoTaxa.ValorCalcular;
  edtDataCalculo.Date        := vgCalculoTaxa.DataCalculo;
  edtDataVencimento.Date     := vgCalculoTaxa.DataVencimento;
  icxMultaTipo.EditValue     := vgCalculoTaxa.MultaTipo;
  edtOutrasTaxas.EditValue   := vgCalculoTaxa.OutrasTaxas;

  edtDataVencimentoExit(self);
  rdbDesconto.Checked := (vgCalculoTaxa.Desconto > 0) or (vgCalculoTaxa.OutraDeducao > 0);
  if rdbMultaJUros.Checked then
       rdbMultaJUrosClick(self)
  else rdbDescontoClick(self);

  edtDataCalculo.SetFocus;
end;

procedure TfrmCalculoMultaJuros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  frmCalculoMultaJuros := nil;
end;

procedure TfrmCalculoMultaJuros.HabilitarCampos(vpHabilitado: Boolean);
begin
  lblMulta.Enabled        := vpHabilitado;
  icxMultaTipo.Enabled    := vpHabilitado;
  edtMultaTaxa.Enabled    := vpHabilitado;

  lblJuros.Enabled        := vpHabilitado;
  edtJurosTaxa.Enabled    := vpHabilitado;

  lblDesconto.Enabled     := not vpHabilitado;
  edtValorDesconto.Enabled:= not vpHabilitado;

  lblOutrasDeducao.Enabled:= not vpHabilitado;
  edtValorOutros.Enabled  := not vpHabilitado;
end;


procedure TfrmCalculoMultaJuros.icxMultaTipoPropertiesEditValueChanged(
  Sender: TObject);
begin
  if (edtMultaTaxa.EditValue = null) or (edtJurosTaxa.EditValue = null) then
   exit;

  btnCalcularClick(self);
end;

procedure TfrmCalculoMultaJuros.rdbDescontoClick(Sender: TObject);
begin
  HabilitarCampos(False);

  edtMultaTaxa.EditValue  := 0;
  edtJurosTaxa.EditValue  := 0;
  edtValorMulta.EditValue := 0;
  edtJurosValor.EditValue := 0;

  edtValorDesconto.EditValue := vgCalculoTaxa.Desconto;
  edtValorOutros.EditValue   := vgCalculoTaxa.OutraDeducao;
  btnCalcularClick(self);
  edtValorDesconto.SetFocus;
end;

procedure TfrmCalculoMultaJuros.rdbMultaJUrosClick(Sender: TObject);
begin
  HabilitarCampos(True);

  edtMultaTaxa.EditValue  := vgCalculoTaxa.MultaTaxa;
  edtJurosTaxa.EditValue  := vgCalculoTaxa.JurosTaxa;
  edtMultaTaxaExit(self);
  edtJurosTaxaExit(Self);

  edtValorDesconto.EditValue := 0;
  edtValorOutros.EditValue   := 0;
  btnCalcularClick(self);
  edtMultaTaxa.SetFocus;
end;

end.
