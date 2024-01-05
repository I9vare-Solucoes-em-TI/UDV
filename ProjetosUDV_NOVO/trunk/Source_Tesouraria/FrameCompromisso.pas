unit FrameCompromisso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxGraphics, Menus, cxLookAndFeelPainters, StdCtrls,
  cxRadioGroup, cxButtons, cxDropDownEdit, cxImageComboBox, cxCurrencyEdit,
  cxTextEdit, cxMaskEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxControls, cxContainer, cxEdit, cxLabel, ExtCtrls, dxSkinscxPCPainter, cxPC,
  dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  cxLookAndFeels, dxSkinDevExpressDarkStyle, dxBarBuiltInMenu;

type
  TfmeCompromisso = class(TFrame)
    tabBalancete: TcxTabControl;
    Panel1: TPanel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel2: TcxLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    lblReserva: TcxLabel;
    btnEfetuarPagamento: TcxLabel;
    rdbCompromissosDiversos: TcxRadioButton;
    rdbCompromissosMensais: TcxRadioButton;
    lcxCompromisso: TcxLookupComboBox;
    lcxCentroCusto: TcxLookupComboBox;
    lcxReserva: TcxLookupComboBox;
    icxPeriodo: TcxImageComboBox;
    cbxMesAnoInicial: TcxComboBox;
    cbxMesAnoFinal: TcxComboBox;
    edtValor: TcxCurrencyEdit;
    btnConfirmarCompromisso: TcxButton;
    btnLimparCompromisso: TcxButton;
    procedure rdbCompromissosDiversosClick(Sender: TObject);
    procedure rdbCompromissosMensaisClick(Sender: TObject);
    procedure lcxCompromissoPropertiesEditValueChanged(Sender: TObject);
    procedure icxPeriodoPropertiesEditValueChanged(Sender: TObject);
    procedure cbxMesAnoInicialPropertiesEditValueChanged(Sender: TObject);
    procedure btnConfirmarCompromissoClick(Sender: TObject);
    procedure btnLimparCompromissoClick(Sender: TObject);
    procedure tabBalanceteChange(Sender: TObject);
  private
  public
    procedure LimparCamposCompromisso;
  end;

var
  vgFiltrarGerenciamento : Boolean;

implementation

uses Lookup, Controles, Lookup_Contabil;

{$R *.dfm}

procedure TfmeCompromisso.btnConfirmarCompromissoClick(Sender: TObject);
var
  viPeriodoInicial, viPeriodoFinal : String;

  Procedure Validacao;
  begin
    VerificarPreenchimentoLCX_TX(lcxCompromisso.Text, 'Compromisso', lcxCompromisso);
    VerificarPreenchimentoLCX_TX(lcxCentroCusto.Text, 'Centro de Custo', lcxCentroCusto);

    if rdbCompromissosDiversos.Checked then
      VerificarPreenchimentoLCX_TX(lcxReserva.Text, 'Reserva', lcxReserva);

    VerificarPreenchimentoicx_TX(icxPeriodo.Text, 'Per�odo', icxPeriodo);

    if (edtValor.Text = '') or (edtValor.EditValue <= 0) then
    begin
      Application.MessageBox('Valor Inv�lido!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
      edtValor.SetFocus;
      abort;
    end;

    dtmLookup.ValidarIntervalodeAnoMes(cbxMesAnoInicial, cbxMesAnofinal, icxPeriodo.EditValue);
  end;

begin
  Validacao;

  //CalcularDataVencimento(sqlContasAgendadasDATA_VENCIMENTO.AsDateTime, viFrequencia, viCount);

end;

procedure TfmeCompromisso.btnLimparCompromissoClick(Sender: TObject);
begin
  rdbCompromissosDiversos.Checked := True;
  rdbCompromissosDiversosClick(Self);
end;

procedure TfmeCompromisso.cbxMesAnoInicialPropertiesEditValueChanged(
  Sender: TObject);
begin
  if icxPeriodo.EditValue = '2' then
    cbxMesAnoFinal.EditValue := cbxMesAnoInicial.EditValue;

end;

procedure TfmeCompromisso.icxPeriodoPropertiesEditValueChanged(Sender: TObject);
var
   viPeriodo : Integer;
begin
  cbxMesAnoFinal.Enabled := icxPeriodo.EditValue = '3';

  if icxPeriodo.EditValue = '1' then
       cbxMesAnoFinal.EditValue := null
  else cbxMesAnoFinal.EditValue := cbxMesAnoinicial.EditValue;

  if icxPeriodo.EditValue <> null then
  begin
    viPeriodo := StrToInt(icxPeriodo.EditValue);
    case viPeriodo of
      1 : begin
            if icxPeriodo.RepositoryItem = dtmLookup.Combo_PeriodoLimitado then
                 dtmLookup.CarregarPeriodo(cbxMesAnoInicial,2,'','')
            else dtmLookup.CarregarPeriodo(cbxMesAnoInicial,7,'',dtmLookup.InclementarAnoMes(IntToStr(vgPeriodoAtual)));
            dtmLookup.CarregarPeriodo(cbxMesAnoFinal,3,'','');
          end;
      2 : begin
            dtmLookup.CarregarPeriodo(cbxMesAnoInicial,1,'','');
            dtmLookup.CarregarPeriodo(cbxMesAnoFinal,1,'','');
          end;
      3 : begin
            dtmLookup.CarregarPeriodo(cbxMesAnoInicial,1,'','');
            dtmLookup.CarregarPeriodo(cbxMesAnoFinal,1,'','');
          end;
    end;
    cbxMesAnoinicial.EditValue := dtmLookup.FormatarAnoMes(IntToStr(vgPeriodoAtual));
  end;

end;

procedure TfmeCompromisso.lcxCompromissoPropertiesEditValueChanged(
  Sender: TObject);
begin
  if dtmLookup.sqlCompromissoMensal.RecordCount = 0 then
    exit;

  if (rdbCompromissosMensais.Checked) and (not vgFiltrarGerenciamento) then
  begin
      edtValor.EditValue   := dtmLookup.sqlCompromissoMensalVALOR_ATUAL.AsCurrency;
      icxPeriodo.EditValue := dtmLookup.sqlCompromissoMensalPERIODO.AsString;
    if dtmLookup.sqlCompromissoMensalANO_MES_FINAL.AsString <> '' then
    begin
      cbxMesAnoFinal.EditValue := dtmLookup.FormatarAnoMes(dtmLookup.sqlCompromissoMensalANO_MES_FINAL.AsString);
      if dtmLookup.sqlCompromissoMensalANO_MES_FINAL.AsInteger = vgPeriodoAtual then
      begin
        cbxMesAnoInicial.Enabled   := False;
        cbxMesAnoInicial.EditValue := cbxMesAnoFinal.EditValue;
      end
      else cbxMesAnoInicial.Enabled  := True;
      dtmLookup.CarregarPeriodo(cbxMesAnoInicial,5, dtmLookup.sqlCompromissoMensalANO_MES_INICIAL.AsString,
                                dtmLookup.sqlCompromissoMensalANO_MES_FINAL.AsString);
    end;
    cbxMesAnoFinal.Enabled := False;
  end
  else cbxMesAnoInicial.Enabled := True;
end;

procedure TfmeCompromisso.LimparCamposCompromisso;
begin
  lcxCompromisso.EditValue        := null;
  lcxCentroCusto.EditValue        := vgCentroCustoPrincipal[tabBalancete.TabIndex];

  cbxMesAnoInicial.editValue      := vgPeriodoAtualS;
  icxPeriodo.EditValue            := 2;
  edtValor.EditValue              := 0;
  lcxCompromisso.SetFocus;
end;

procedure TfmeCompromisso.rdbCompromissosDiversosClick(Sender: TObject);
begin
  rdbCompromissosDiversos.Font.Color := clBlue;
  rdbCompromissosMensais.Font.Color  := clBlack;
  lcxReserva.Visible := True;
  lblReserva.Visible := True;

  LimparCamposCompromisso;
  tabBalanceteChange(self);

  icxPeriodo.Enabled := True;
end;

procedure TfmeCompromisso.rdbCompromissosMensaisClick(Sender: TObject);
begin
  rdbCompromissosDiversos.Font.Color := clBlack;
  rdbCompromissosMensais.Font.Color  := clBlue;
  lcxReserva.Visible := False;
  lblReserva.Visible := False;
  lcxReserva.EditValue := null;

  LimparCamposCompromisso;
  tabBalanceteChange(self);

  icxPeriodo.EditValue := '1';
  icxPeriodo.Enabled   := False;
end;

procedure TfmeCompromisso.tabBalanceteChange(Sender: TObject);
begin
  if tabBalancete.Tabs.Count = 0 then
    exit;

  LimparCamposCompromisso;

  edtValor.Enabled := True;
  if rdbCompromissosDiversos.Checked then
  begin
    dtmLookup.sqlPlanoContasReceitas.Filtered := False;
    dtmLookup.sqlPlanoContasReceitas.Filter   := 'FIXO = '+QuotedStr('N') + 'AND BALANCETE_GRUPO_ID = ' +IntToStr(vgTabBalancete[tabBalancete.TabIndex]);
    dtmLookup.sqlPlanoContasReceitas.Filtered := True;
    lcxCompromisso.RepositoryItem := dtmLookup.Lista_PlanoContasReceitas;
  end
  else
  begin
    if not vgFiltrarGerenciamento then
    begin
      dtmLookup.sqlCompromissoMensal.Filtered := False;
      dtmLookup.sqlCompromissoMensal.Filter   := 'BALANCETE_GRUPO_ID = ' +IntToStr(vgTabBalancete[tabBalancete.TabIndex]);
      dtmLookup.sqlCompromissoMensal.Filtered := True;
      lcxCompromisso.RepositoryItem := dtmLookup.Lista_ContasAgendadasMensal;
      edtValor.Enabled := False;
    end
    else
    begin
      dtmLookup.sqlPlanoContasReceitas.Filtered := False;
      dtmLookup.sqlPlanoContasReceitas.Filter   := 'FIXO = '+QuotedStr('S') + 'AND BALANCETE_GRUPO_ID = ' +IntToStr(vgTabBalancete[tabBalancete.TabIndex]);
      dtmLookup.sqlPlanoContasReceitas.Filtered := True;
      lcxCompromisso.RepositoryItem := dtmLookup.Lista_PlanoContasReceitas;
    end;
  end;

  dtmLookup.sqlCentroCustoAtivo.Filtered := False;
  dtmLookup.sqlCentroCustoAtivo.Filter   := 'BALANCETE_GRUPO_ID = ' +IntToStr(vgTabBalancete[tabBalancete.TabIndex]);
  dtmLookup.sqlCentroCustoAtivo.Filtered := True;

  dtmLookup.sqlReservasAtivas.Filtered := False;
  dtmLookup.sqlReservasAtivas.Filter   := 'BALANCETE_GRUPO_ID = ' +IntToStr(vgTabBalancete[tabBalancete.TabIndex]);
  dtmLookup.sqlReservasAtivas.Filtered := True;

  if dtmLookup.sqlReservasAtivas.RecordCount = 1 then
       lcxReserva.EditValue := dtmLookup.sqlReservasAtivasRESERVA_ID.AsInteger
  else lcxReserva.EditValue := null;
end;

end.
