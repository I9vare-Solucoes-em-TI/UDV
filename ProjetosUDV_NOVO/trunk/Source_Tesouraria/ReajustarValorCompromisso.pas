unit ReajustarValorCompromisso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, Menus, cxLookAndFeelPainters, cxGraphics, cxCheckBox,
  cxDBEdit, cxImageComboBox, cxGroupBox, cxDropDownEdit, cxTextEdit, cxMaskEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ExtCtrls, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxLabel, cxRadioGroup,
  cxCurrencyEdit, Math, cxLookAndFeels, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, frxClass;

type

  TfrmReajustarValorCompromisso = class(TForm)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    Panel4: TPanel;
    imgEMAIL: TImage;
    imgImprimir: TImage;
    Panel1: TPanel;
    Panel3: TPanel;
    Shape1: TShape;
    rdbAjustarTodosValorAtual: TcxRadioButton;
    cxLabel2: TcxLabel;
    lcxCompromisso: TcxLookupComboBox;
    cxLabel1: TcxLabel;
    rdbAjustarAumento: TcxRadioButton;
    edtAumento: TcxCurrencyEdit;
    chxCompromissosProgramados: TcxCheckBox;
    chxArrendondar: TcxCheckBox;
    rdbAjustarValorAbsoluto: TcxRadioButton;
    edtValorAbsoluto: TcxCurrencyEdit;
    btnConfirmarCompromisso: TcxButton;
    cxButton1: TcxButton;
    rdbAcrescentarValor: TcxRadioButton;
    edtAcrescentar: TcxCurrencyEdit;
    chxSomenteValorAgendado: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxButton1Click(Sender: TObject);
    procedure btnConfirmarCompromissoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure rdbAjustarTodosValorAtualClick(Sender: TObject);
    procedure rdbAjustarAumentoClick(Sender: TObject);
    procedure rdbAjustarValorAbsolutoClick(Sender: TObject);
    procedure rdbAcrescentarValorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReajustarValorCompromisso: TfrmReajustarValorCompromisso;
  vgReajustarCompromissoId : Integer;
  vgReajustarValor, vgNovoValor : Currency;
  vgReajustarOK : Boolean;

implementation

uses Lookup, Controles, Lookup_Contabil;

{$R *.dfm}

procedure TfrmReajustarValorCompromisso.btnConfirmarCompromissoClick(Sender: TObject);
var
  viCondicao : string;
begin
  if Application.MessageBox('Confirma ajuste do valor do compromisso selecionado?', 'Pergunta', MB_YESNO) = IDNO then
    exit;

  if chxSomenteValorAgendado.Checked then
    vgNovoValor := edtValorAbsoluto.EditValue
  else
  begin
    if chxCompromissosProgramados.checked then
      viCondicao := '  AND NOT COMPROMISSO_AGENDADO_ID IN (SELECT COMPROMISSO_AGENDADO_ID '+
                       '                                    FROM T_PROGRAMACAO_AJUSTE '+
                       '                                    WHERE SITUACAO = ''A'')'
    else viCondicao := '';

    ExecutaSimpleDSAux(' SELECT VALOR_ATUAL, VALOR_ANTERIOR, COMPROMISSO_AGENDADO_ID, REAJUSTE_AUTOMATICO '+
                       ' FROM T_COMPROMISSO_AGENDADO '+
                       ' WHERE ((SITUACAO_GERAL = ''1'') OR (SITUACAO_GERAL IS NULL)) '+
                       '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo)+
                       '   AND CONTABIL_CONTA_ID = '+ IntToStr(vgReajustarCompromissoId)+ viCondicao +
                       ' ORDER BY PESSOA_ID',0);

    vgNovoValor := 0;
    With dtmControles.SimpleAuxiliar do
    begin
      First;
      while not eof do
      begin
        edit;
        FieldByName('VALOR_ANTERIOR').AsCurrency    := FieldByName('VALOR_ATUAL').AsCurrency;
        FieldByName('REAJUSTE_AUTOMATICO').AsString := 'S';
        if rdbAjustarTodosValorAtual.Checked then
          FieldByName('VALOR_ATUAL').AsCurrency := vgReajustarValor
        else
          if rdbAjustarAumento.Checked then
          begin
            if chxArrendondar.Checked then
                 FieldByName('VALOR_ATUAL').AsCurrency := RoundTo(FieldByName('VALOR_ATUAL').AsCurrency +
                                                          ((FieldByName('VALOR_ATUAL').AsCurrency * edtAumento.EditValue)/100),-1)
            else FieldByName('VALOR_ATUAL').AsCurrency := (FieldByName('VALOR_ATUAL').AsCurrency +
                                                          ((FieldByName('VALOR_ATUAL').AsCurrency * edtAumento.EditValue)/100));

          end
        else
          if rdbAjustarValorAbsoluto.Checked then
            FieldByName('VALOR_ATUAL').AsCurrency := edtValorAbsoluto.EditValue
        else
          if rdbAcrescentarValor.Checked then
            FieldByName('VALOR_ATUAL').AsCurrency :=  (FieldByName('VALOR_ATUAL').AsCurrency) + edtAcrescentar.EditValue;


        ApplyUpdates(-1);
        next;
      end;
    end;

    if rdbAjustarAumento.Checked then
    begin
      if chxArrendondar.Checked then
           vgNovoValor :=  RoundTo(vgReajustarValor + ((vgReajustarValor * edtAumento.EditValue)/100),-1)
      else vgNovoValor :=  vgReajustarValor + ((vgReajustarValor * edtAumento.EditValue)/100);
    end
    else
      if rdbAjustarValorAbsoluto.Checked then
         vgNovoValor := edtValorAbsoluto.EditValue
      else
        if rdbAcrescentarValor.Checked then
          vgNovoValor := vgReajustarValor + edtAcrescentar.EditValue;
  end;

  Application.MessageBox('Ajuste Realizado com Sucesso!!!', 'Informa��o', MB_OK + MB_ICONINFORMATION);
  vgReajustarOK := True;
  Close;
end;

procedure TfrmReajustarValorCompromisso.cxButton1Click(Sender: TObject);
begin
  vgReajustarOK := False;
  Close;
end;

procedure TfrmReajustarValorCompromisso.rdbAjustarValorAbsolutoClick(Sender: TObject);
begin
  edtAumento.Enabled        := False;
  chxArrendondar.Enabled    := False;
  edtValorAbsoluto.Enabled  := True;
  edtAcrescentar.Enabled    := False;
  chxSomenteValorAgendado.Enabled := True;
  edtValorAbsoluto.SetFocus;
end;

procedure TfrmReajustarValorCompromisso.FormActivate(Sender: TObject);
begin
  rdbAjustarTodosValorAtualClick(self);
  lcxCompromisso.EditValue := vgReajustarCompromissoId;
end;

procedure TfrmReajustarValorCompromisso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action                       := caFree;
  frmReajustarValorCompromisso := nil
end;

procedure TfrmReajustarValorCompromisso.rdbAcrescentarValorClick(
  Sender: TObject);
begin
  edtAcrescentar.Enabled    := True;
  chxArrendondar.Enabled    := False;
  edtValorAbsoluto.Enabled  := False;
  edtAumento.Enabled        := False;
  chxSomenteValorAgendado.Enabled := False;
  chxSomenteValorAgendado.Checked := False;
  edtAcrescentar.SetFocus;
end;

procedure TfrmReajustarValorCompromisso.rdbAjustarAumentoClick(Sender: TObject);
begin
  edtAumento.Enabled        := True;
  chxArrendondar.Enabled    := True;
  edtValorAbsoluto.Enabled  := False;
  edtAcrescentar.Enabled    := False;
  chxSomenteValorAgendado.Enabled := False;
  chxSomenteValorAgendado.Checked := False;
  edtAumento.SetFocus;
end;

procedure TfrmReajustarValorCompromisso.rdbAjustarTodosValorAtualClick(Sender: TObject);
begin
  edtAumento.Enabled        := False;
  chxArrendondar.Enabled    := False;
  edtValorAbsoluto.Enabled  := False;
  edtAcrescentar.Enabled    := False;
  chxSomenteValorAgendado.Enabled := False;
  chxSomenteValorAgendado.Checked := False;
  edtAumento.Clear;
end;

end.