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
  cxSpinEdit, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxPCdxBarPopupMenu,
  dxBarBuiltInMenu;

type
  TfmeCompromisso = class(TFrame)
    tabBalancete: TcxTabControl;
    Panel1: TPanel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    lcxCompromisso: TcxLookupComboBox;
    lcxCentroCusto: TcxLookupComboBox;
    edtValor: TcxCurrencyEdit;
    icxEspecie: TcxImageComboBox;
    icxPeriodo: TcxImageComboBox;
    cbxMesAnoInicial: TcxComboBox;
    cbxMesAnoFinal: TcxComboBox;
    edtDia: TcxSpinEdit;
    btnConfirmarCompromisso: TcxButton;
    btnLimparCompromisso: TcxButton;
    cxLabel6: TcxLabel;
    procedure icxPeriodoPropertiesEditValueChanged(Sender: TObject);
    procedure cbxMesAnoInicialPropertiesEditValueChanged(Sender: TObject);
    procedure btnConfirmarCompromissoClick(Sender: TObject);
    procedure tabBalanceteChange(Sender: TObject);
    procedure edDiaKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparCompromissoClick(Sender: TObject);
  private
  public
    procedure LimparCamposCompromisso;
  end;

var
  vgFiltrarGerenciamento : Boolean;

implementation

uses Lookup, Controles, Lookup_Contabil, Rotinas;

{$R *.dfm}

procedure TfmeCompromisso.btnConfirmarCompromissoClick(Sender: TObject);
  Procedure Validacao;
  begin
    VerificarPreenchimentoLCX_TX(lcxCompromisso.Text, 'Compromisso', lcxCompromisso);
    VerificarPreenchimentoLCX_TX(lcxCentroCusto.Text, 'Centro de Custo', lcxCentroCusto);
    VerificarPreenchimentoicx_TX(icxPeriodo.Text, 'Período', icxPeriodo);
    VerificarPreenchimentoicx_TX(icxEspecie.Text, 'Especie', icxEspecie);

    if (edtValor.Text = '') or (edtValor.EditValue <= 0) then
    begin
      Application.MessageBox('Valor Inválido!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      edtValor.SetFocus;
      abort;
    end;

    dtmLookupContabil.ValidarIntervalodeAnoMes(cbxMesAnoInicial, cbxMesAnofinal, icxPeriodo.EditValue);
  end;

begin
  Validacao;
end;

procedure TfmeCompromisso.btnLimparCompromissoClick(Sender: TObject);
begin
  LimparCamposCompromisso;
  tabBalanceteChange(self);
end;

procedure TfmeCompromisso.cbxMesAnoInicialPropertiesEditValueChanged(
  Sender: TObject);
begin
  if icxPeriodo.EditValue = '2' then
    cbxMesAnoFinal.EditValue := cbxMesAnoInicial.EditValue;

end;

procedure TfmeCompromisso.edDiaKeyPress(Sender: TObject; var Key: Char);
begin
  DigitaInteiro(key);
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
            if icxPeriodo.RepositoryItem = dtmLookupContabil.Combo_PeriodoLimitado then
                 dtmLookupContabil.CarregarPeriodo(cbxMesAnoInicial, nil, 2,'','')
            else dtmLookupContabil.CarregarPeriodo(cbxMesAnoInicial, nil, 7,'',dtmLookupContabil.InclementarAnoMes(IntToStr(vgPeriodoAtual)));
            dtmLookupContabil.CarregarPeriodo(cbxMesAnoFinal, nil, 3,'','');
          end;
      2 : begin
            dtmLookupContabil.CarregarPeriodo(cbxMesAnoInicial, nil, 1,'','');
            dtmLookupContabil.CarregarPeriodo(cbxMesAnoFinal, nil, 1,'','');
          end;
      3 : begin
            dtmLookupContabil.CarregarPeriodo(cbxMesAnoInicial, nil, 2,'','');
            dtmLookupContabil.CarregarPeriodo(cbxMesAnoFinal, nil, 2,'','');
          end;
    end;
    cbxMesAnoinicial.EditValue := dtmLookupContabil.FormatarAnoMes(IntToStr(vgPeriodoAtual));
  end;

end;

procedure TfmeCompromisso.LimparCamposCompromisso;
begin
  lcxCompromisso.EditValue        := null;
  lcxCentroCusto.EditValue        := vgCentroCustoPrincipal[tabBalancete.TabIndex];
  cbxMesAnoInicial.editValue      := vgPeriodoAtualS;
  icxPeriodo.EditValue            := 2;
  edtValor.EditValue              := 0;
  icxEspecie.EditValue            := null;
end;

procedure TfmeCompromisso.tabBalanceteChange(Sender: TObject);
begin
  if tabBalancete.Tabs.Count = 0 then
    exit;

  LimparCamposCompromisso;

  edtValor.Enabled := True;
  dtmLookupContabil.sqlPlanoContasReceitas.Filtered := False;
  dtmLookupContabil.sqlPlanoContasReceitas.Filter   := 'BALANCETE_GRUPO_ID = ' +IntToStr(vgTabBalancete[tabBalancete.TabIndex]);
  dtmLookupContabil.sqlPlanoContasReceitas.Filtered := True;
  lcxCompromisso.RepositoryItem := dtmLookupContabil.Lista_PlanoContasReceitas;

  dtmLookupContabil.sqlCentroCustoAtivo.Filtered := False;
  dtmLookupContabil.sqlCentroCustoAtivo.Filter   := 'BALANCETE_GRUPO_ID = ' +IntToStr(vgTabBalancete[tabBalancete.TabIndex]);
  dtmLookupContabil.sqlCentroCustoAtivo.Filtered := True;
end;

end.
