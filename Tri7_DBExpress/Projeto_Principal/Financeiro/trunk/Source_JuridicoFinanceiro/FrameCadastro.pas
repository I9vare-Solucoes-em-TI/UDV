unit FrameCadastro;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxGraphics, Menus, cxLookAndFeelPainters, DB, DBClient,
  SimpleDS, cxSpinEdit, cxCurrencyEdit, cxDropDownEdit, cxCalendar,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxGroupBox, StdCtrls,
  cxButtons, cxTextEdit, cxMaskEdit, cxImageComboBox, cxControls, cxContainer,
  cxEdit, cxLabel, ExtCtrls;

type
  TfmeCadastro = class(TFrame)
    pnlDadosPrincipais: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    icxTipoSistema: TcxImageComboBox;
    edtApresentante: TcxTextEdit;
    btnConfirmarItem: TcxButton;
    cbxValores: TcxGroupBox;
    lblValor: TcxLabel;
    lblTotal: TcxLabel;
    lblQtd: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel35: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel5: TcxLabel;
    sqlTipoServico: TI9Query;
    sqlTipoServicoDESCRICAO: TStringField;
    sqlTipoServicoCAIXA_SERVICO_ID: TBCDField;
    dtsTipoServico: TDataSource;
    cxLabel3: TcxLabel;
    icxTipoTransacao: TcxImageComboBox;
    lcxTipoServico: TcxLookupComboBox;
    edtPesqDtRegIni: TcxDateEdit;
    edtPesqProtocolo: TcxTextEdit;
    edtLivro: TcxTextEdit;
    edtFolha: TcxTextEdit;
    edtDescricao: TcxTextEdit;
    edtSelo: TcxTextEdit;
    edtEmolumentos: TcxCurrencyEdit;
    edtQtd: TcxSpinEdit;
    edtTotal: TcxCurrencyEdit;
    cxLabel8: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    procedure btnConfirmarItemClick(Sender: TObject);
    procedure icxTipoTransacaoPropertiesEditValueChanged(Sender: TObject);
    procedure icxTipoSistemaPropertiesEditValueChanged(Sender: TObject);
    procedure lcxTipoServicoPropertiesEditValueChanged(Sender: TObject);
    procedure edtEmolumentosPropertiesEditValueChanged(Sender: TObject);
    procedure edtQtdPropertiesEditValueChanged(Sender: TObject);
    procedure edtApresentanteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure CalcularTotal;
  public
    { Public declarations }
  end;

implementation

uses
  Controles, Rotinas;

{$R *.dfm}

procedure TfmeCadastro.btnConfirmarItemClick(Sender: TObject);
var
  viQtdPalavras : Integer;
begin
  inherited;
  VerificarPreenchimentoICX_tx(icxTipoSistema.Text, 'Serventia',icxTipoSistema);
  VerificarPreenchimentoEDT_tx(edtApresentante.Text, 'Apresentante',edtApresentante);

  viQtdPalavras := Rotinas.RetornatQdtPalavras(edtApresentante.text);
  if viQtdPalavras < 2 then
  begin
    Application.MessageBox('Nome Apresentante Inválido!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
    edtApresentante.SetFocus;
    exit;
  end;

  icxTipoTransacao.EditValue := 'C';
  edtPesqDtRegIni.EditValue := dtmControles.DataHoraBanco(4);

  btnConfirmarItem.Enabled   := False;
  pnlDadosPrincipais.Enabled := False;
  cbxValores.Enabled         := True;

  icxTipoTransacao.SetFocus;
end;

procedure TfmeCadastro.CalcularTotal;
begin
  edtTotal.EditValue := (edtEmolumentos.EditValue  * edtQtd.EditValue);
end;

procedure TfmeCadastro.edtApresentanteKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 13 then
    btnConfirmarItemClick(Self);
end;

procedure TfmeCadastro.edtEmolumentosPropertiesEditValueChanged(Sender: TObject);
begin
  CalcularTotal;
end;

procedure TfmeCadastro.edtQtdPropertiesEditValueChanged(Sender: TObject);
begin
  CalcularTotal;
end;

procedure TfmeCadastro.icxTipoSistemaPropertiesEditValueChanged(Sender: TObject);
begin
  btnConfirmarItem.Enabled := icxTipoSistema.EditValue <> null;
end;

procedure TfmeCadastro.icxTipoTransacaoPropertiesEditValueChanged(Sender: TObject);
begin
  edtPesqProtocolo.Enabled  := icxTipoTransacao.EditValue = 'C';
  edtFolha.Enabled          := icxTipoTransacao.EditValue = 'C';
  edtLivro.Enabled          := icxTipoTransacao.EditValue = 'C';
  edtSelo.Enabled           := icxTipoTransacao.EditValue = 'C';

  sqlTipoServico.Active := False;
  if icxTipoTransacao.EditValue <> null then
  begin
    sqlTipoServico.ParamByName('TIPO_TRANSACAO').AsString := icxTipoTransacao.EditValue;
    sqlTipoServico.ParamByName('SERVENTIA').AsString      := icxTipoSistema.EditValue;
    sqlTipoServico.Active  := True;
    lcxTipoServico.enabled := True;

    if icxTipoTransacao.EditValue = 'C' then
    begin
      edtPesqProtocolo.Clear;
      edtFolha.Clear;
      edtLivro.Clear;
      edtSelo.Clear;
      lblValor.Caption         := 'Emolumento';
      lblValor.Style.TextColor := clGreen;
      lblQtd.Style.TextColor   := clGreen;
      lblTotal.Style.TextColor := clGreen;
    end
    else
    begin
      lblValor.Caption         := 'Despesa';
      lblValor.Style.TextColor := clRed;
      lblQtd.Style.TextColor   := clRed;
      lblTotal.Style.TextColor := clRed;
    end;
  end;

  lcxTipoServico.Clear;
end;

procedure TfmeCadastro.lcxTipoServicoPropertiesEditValueChanged(Sender: TObject);
begin
  edtDescricao.EditValue := lcxTipoServico.Text;
end;

end.
