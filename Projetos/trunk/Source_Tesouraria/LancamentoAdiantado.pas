unit LancamentoAdiantado;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, cxLookAndFeelPainters, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans,
  dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky,
  dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue, cxGraphics,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxControls, cxContainer, cxEdit, cxLabel, StdCtrls, cxButtons,
  ExtCtrls, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxCheckBox;

type
  TLancamentoAdiantado = Record
    Compromisso, Periodo, Pessoa, LancamentoCompromissoId,
    Tipo, CentroCustoId, BalanceteGrupoId, ReservaId : Integer;
    AnoMesInicial, AnoMesFinal, Obrigatorio, Caption :String;
    Valor : Currency;
    vgOK, LancarTodosCompromissos, LancamentoIniciado : Boolean
  End;

  TfrmLancamentoAdiantado = class(TForm)
    Panel1: TPanel;
    Shape1: TShape;
    cxLabel1: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel2: TcxLabel;
    chxTodos: TcxCheckBox;
    lcxCompromisso: TcxLookupComboBox;
    cbxMesAnoInicial: TcxComboBox;
    cbxMesAnoFinal: TcxComboBox;
    cxButton1: TcxButton;
    btnConfirmarCompromisso: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure btnConfirmarCompromissoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLancamentoAdiantado: TfrmLancamentoAdiantado;
  vgLancamentoAdiantado : TLancamentoAdiantado;

implementation

uses Lookup, Controles, Lookup_Contabil;

{$R *.dfm}

procedure TfrmLancamentoAdiantado.btnConfirmarCompromissoClick(Sender: TObject);
begin
  if (cbxMesAnoFinal.Text = '') then
  begin
    Application.MessageBox('Período Final inválido!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    cbxMesAnoFinal.SetFocus;
    abort;
  end;

  dtmLookup.ValidarIntervalodeAnoMes(cbxMesAnoInicial, cbxMesAnofinal, IntToStr(vgLancamentoAdiantado.Periodo));
  with dtmLookupContabil do
  begin
    vgCompromissoVencido.PessoaId          := vgLancamentoAdiantado.Pessoa;
    vgCompromissoVencido.ContabilContaId   := lcxCompromisso.EditValue;
    vgCompromissoVencido.Valor             := vgLancamentoAdiantado.Valor;
    vgCompromissoVencido.CentroCustoId     := vgLancamentoAdiantado.CentroCustoId;
    vgCompromissoVencido.BalanceteGrupoId  := vgLancamentoAdiantado.BalanceteGrupoId;
    vgCompromissoVencido.PeriodoInicial    := copy(cbxMesAnoInicial.EditValue,4,4) + copy(cbxMesAnoInicial.EditValue,1,2);
    vgCompromissoVencido.PeriodoTipo       := vgLancamentoAdiantado.Periodo;
    vgCompromissoVencido.PeriodoFinal      := copy(cbxMesAnoFinal.EditValue,4,4) + copy(cbxMesAnoFinal.EditValue,1,2);
    vgCompromissoVencido.AtualizarAgendado := True;
    vgCompromissoVencido.MostrarMensagem   := True;
    vgCompromissoVencido.Obrigatorio       := vgLancamentoAdiantado.Obrigatorio;
    vgCompromissoVencido.MostrarMensagem   := True;
    vgCompromissoVencido.BoletoId          := '';
    vgCompromissoVencido.ReciboId          := '';
    vgCompromissoVencido.SituacaoLocal     := '1';
    vgCompromissoVencido.ReservaId         := vgLancamentoAdiantado.ReservaId;

    if not chxTodos.Checked then
    begin
      if vgLancamentoAdiantado.LancamentoCompromissoId > 0 then
           vgCompromissoVencido.LancamentoCompromissoId := IntToStr(vgLancamentoAdiantado.LancamentoCompromissoId)
      else vgCompromissoVencido.LancamentoCompromissoId := '';
      dtmLookup.AdicionarCompromisso(True, False, True, 'C');
    end
    else vgLancamentoAdiantado.LancarTodosCompromissos := True;
  end;

  vgLancamentoAdiantado.vgOK := True;
  Close;
end;

procedure TfrmLancamentoAdiantado.cxButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmLancamentoAdiantado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action                 := caFree;
  frmLancamentoAdiantado := nil
end;

procedure TfrmLancamentoAdiantado.FormCreate(Sender: TObject);
begin
  Caption := vgLancamentoAdiantado.Caption;
end;

procedure TfrmLancamentoAdiantado.FormShow(Sender: TObject);
begin
  lcxCompromisso.EditValue   := vgLancamentoAdiantado.Compromisso;
  vgLancamentoAdiantado.vgOK := False;
  if vgLancamentoAdiantado.Periodo = 1 then
  begin
    if vgLancamentoAdiantado.Tipo = 1 then
    begin
      dtmLookup.CarregarPeriodo(cbxMesAnoInicial,4,'','');
      dtmLookup.CarregarPeriodo(cbxMesAnoFinal,4,'','');
    end
    else
    begin
      dtmLookup.CarregarPeriodo(cbxMesAnoInicial,8,'',IntToStr(vgPeriodoAtual));
      dtmLookup.CarregarPeriodo(cbxMesAnoFinal,8,'',IntToStr(vgPeriodoAtual));
    end;
  end
  else
  begin
    dtmLookup.CarregarPeriodo(cbxMesAnoInicial,5, vgLancamentoAdiantado.AnoMesInicial, vgLancamentoAdiantado.AnoMesFinal);
    dtmLookup.CarregarPeriodo(cbxMesAnoFinal,5,vgLancamentoAdiantado.AnoMesInicial, vgLancamentoAdiantado.AnoMesFinal);
  end;

  cbxMesAnoFinal.EditValue   := null;
  cbxMesAnoInicial.ItemIndex := 0;
  cbxMesAnoInicial.SetFocus;
end;

end.
