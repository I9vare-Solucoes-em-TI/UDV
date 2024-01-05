unit CadastroRapidoContrato;

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
  dxSkinscxPCPainter, cxPC, cxCheckComboBox, cxDBCheckComboBox, cxCheckListBox,
  cxDBCheckListBox, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint;

type
  TCadastroContrato = Record
    ContratoNumero, ContratoNovoNumero : String;
    Aditivo : Integer;
  End;

  TfrmCadastroRapidoContrato = class(TfrmCadastroAuxSimplificado)
    cxLabel28: TcxLabel;
    sqlClientePrincipal: TSimpleDataSet;
    dtsClientePrincipal: TDataSource;
    cxLabel4: TcxLabel;
    lblDemaisClientes: TcxLabel;
    edtContrato: TcxDBTextEdit;
    btnAlterarContrato: TcxButton;
    lcxClientePrincipal: TcxDBLookupComboBox;
    cbxVincular: TcxCheckBox;
    ClientAncestralPROCESSO_CONTRATO_ID: TFMTBCDField;
    ClientAncestralPROCESSO_ID: TFMTBCDField;
    ClientAncestralPROCESSO_PARTE_ID: TFMTBCDField;
    ClientAncestralPARTE_ADICIONAL: TStringField;
    ClientAncestralCONTRATO_NUMERO: TFMTBCDField;
    sqlDemaisPartes: TSimpleDataSet;
    dtsDemaisPartes: TDataSource;
    sqlClientePrincipalPROCESSO_PARTE_ID: TFMTBCDField;
    sqlClientePrincipalNOME: TStringField;
    sqlDemaisPartesPROCESSO_PARTE_ID: TFMTBCDField;
    sqlDemaisPartesNOME: TStringField;
    lcxDemaisClientes: TcxCheckListBox;
    sqlClientePrincipalCPFCNPJ: TStringField;
    ClientAncestralPROCESSO_TRAMITE_ID: TFMTBCDField;
    ClientAncestralADICIONAL: TStringField;
    ClientAncestralADITIVO: TFMTBCDField;
    sqlClientePrincipalPRINCIPAL: TStringField;
    procedure FormActivate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure icxTipoPeriodoPropertiesEditValueChanged(Sender: TObject);
    procedure icxTipoCobrancaPropertiesEditValueChanged(Sender: TObject);
    procedure btnAlterarContratoClick(Sender: TObject);
    procedure cbxVincularClick(Sender: TObject);
    procedure lcxClientePrincipalPropertiesEditValueChanged(Sender: TObject);
  private
    vlLocal : string;
    vlCriandoForm : Boolean;
  public
    { Public declarations }
  end;

var
  frmCadastroRapidoContrato: TfrmCadastroRapidoContrato;
  vlCadastroContrato : TCadastroContrato;

implementation

uses
  Lookup, Controles, GerenciadorServico, LookupJuridico, Rotinas;

{$R *.dfm}

procedure TfrmCadastroRapidoContrato.btnAlterarContratoClick(Sender: TObject);
var
  viContrato : String;
begin
  inherited;

  viContrato := ClientAncestralCONTRATO_NUMERO.AsString;
  repeat
    if not InputQuery('Numero Contrato', 'Numero', viContrato) then
      exit;

    try
      viContrato := IntToStr(StrToInt(viContrato));
    except
      Application.MessageBox('Número Inválido!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    end;
  until (viContrato <> '');

  ClientAncestralCONTRATO_NUMERO.AsInteger := StrToInt(viContrato);
end;

procedure TfrmCadastroRapidoContrato.btnConfirmarClick(Sender: TObject);
var
  viDemaisPartes : String;
  i : Integer;
begin
  VerificarPreenchimentoLCX_DB(lcxClientePrincipal.Text, 'Nome do Cliente do Contrato', lcxClientePrincipal);

  viDemaisPartes := '';
  if cbxVincular.Checked then
  begin
    for i := 1 to lcxDemaisClientes.Count do
    begin
      if lcxDemaisClientes.Items[i-1].Checked then
      begin
         sqlDemaisPartes.RecNo := i;
         viDemaisPartes := viDemaisPartes + sqlDemaisPartesPROCESSO_PARTE_ID.AsString+';';
      end;
    end;

    if viDemaisPartes = '' then
    begin
      Application.MessageBox('Selecione o(s) Cliente(s) Adicionais do Contrato!!!', 'Atenção', MB_OK + MB_ICONWARNING);
      lcxDemaisClientes.SetFocus;
      exit;
    end;
    ClientAncestralPARTE_ADICIONAL.AsString := viDemaisPartes
  end
  else ClientAncestralPARTE_ADICIONAL.AsVariant := null;

  ClientAncestralPROCESSO_TRAMITE_ID.AsInteger := vgDadosCadastro.ChaveIdSecundaria;
  ClientAncestralPROCESSO_ID.AsInteger         := vgDadosCadastro.ChaveIdTerciaria;

  if vlCadastroContrato.Aditivo > 0 then
       ClientAncestralADICIONAL.AsString := 'S'
  else ClientAncestralADICIONAL.AsString := 'N';

  if ClientAncestralCONTRATO_NUMERO.AsString = '' then
  begin
    if vlCadastroContrato.Aditivo = 0 then
      ClientAncestralCONTRATO_NUMERO.AsString  := vlCadastroContrato.ContratoNovoNumero
    else
    begin
      ClientAncestralCONTRATO_NUMERO.AsString  := vlCadastroContrato.ContratoNumero;
      ClientAncestralADITIVO.AsInteger         := vlCadastroContrato.Aditivo;
    end;
  end;

  inherited;
end;

procedure TfrmCadastroRapidoContrato.cbxVincularClick(Sender: TObject);
begin
  inherited;
  lcxDemaisClientes.Enabled := cbxVincular.Checked;
  lblDemaisClientes.Enabled := cbxVincular.Checked;

  if not cbxVincular.Checked then
    ClientAncestralPARTE_ADICIONAL.AsVariant := null;
end;

procedure TfrmCadastroRapidoContrato.FormActivate(Sender: TObject);
begin
  inherited;
  lcxClientePrincipal.SetFocus;
  vlCriandoForm := False;

  if vlCadastroContrato.Aditivo > 0 then
    lblInformaca.Caption := 'Aditivo de Contrato';
end;

procedure TfrmCadastroRapidoContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadastroRapidoContrato := nil;
end;

procedure TfrmCadastroRapidoContrato.FormCreate(Sender: TObject);
begin
  vlCriandoForm := True;
  inherited;
  sqlClientePrincipal.Connection := dtmControles.DB;
  sqlDemaisPartes.Connection     := dtmControles.DB;

  sqlClientePrincipal.Active := False;
  sqlClientePrincipal.DataSet.ParamByName('PROCESSO_TRAMITE_ID').AsBCD := vgDadosCadastro.ChaveIdSecundaria;
  sqlClientePrincipal.Active := True;

  cbxVincular.Enabled := sqlClientePrincipal.RecordCount > 1;

  if not sqlClientePrincipal.IsEmpty then
    ClientAncestralPROCESSO_PARTE_ID.AsInteger := sqlClientePrincipalPROCESSO_PARTE_ID.AsInteger;

  if ClientAncestral.State in [dsEdit] then
    cbxVincular.Checked := ClientAncestralPARTE_ADICIONAL.AsVariant <> null
  else
  begin
    cbxVincular.Checked := False;
    sqlClientePrincipal.Locate('PRINCIPAL', 'S', [loCaseInsensitive]);
  end;
  cbxVincularClick(Self);

  if ClientAncestralPARTE_ADICIONAL.AsVariant <> null then
  begin
    sqlDemaisPartes.First;
    while not sqlDemaisPartes.Eof do
    begin
      if pos(sqlDemaisPartesPROCESSO_PARTE_ID.AsString+';', ClientAncestralPARTE_ADICIONAL.AsString) > 0 then
        lcxDemaisClientes.Items[sqlDemaisPartes.RecNo-1].Checked := True;
      sqlDemaisPartes.Next
    end;
  end;
end;

procedure TfrmCadastroRapidoContrato.icxTipoCobrancaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
{  lblCobrancaValor.Enabled := StrToInt(icxTipoCobranca.EditValue) in [2,4];
  edtCobrancaValor.Enabled := StrToInt(icxTipoCobranca.EditValue) in [2,4];
  lblCobrancaHoras.Enabled := StrToInt(icxTipoCobranca.EditValue) = 3;
  edtCobrancaHoras.Enabled := StrToInt(icxTipoCobranca.EditValue) = 3;      }

  if not (ClientAncestral.State in [dsInsert, dsEdit]) then
    exit;

{  case StrToInt(icxTipoCobranca.EditValue) of
   1 : begin
         ClientAncestralFATURADO_VALOR.AsVariant := null;
         ClientAncestralFATURADO_HORAS.AsVariant := null;
       end;
   2 : begin
         ClientAncestralFATURADO_HORAS.AsVariant := null;
         lblCobrancaValor.Caption := 'Valor em R$';
         ClientAncestralFATURADO_VALOR.AsCurrency := 0;
         edtCobrancaValor.Properties.DisplayFormat := 'R$ ,0.00';
       end;
   3 : begin
         ClientAncestralFATURADO_VALOR.AsVariant := null;
         ClientAncestralFATURADO_HORAS.AsVariant := '00:00';
       end;
   4 : begin
         ClientAncestralFATURADO_HORAS.AsVariant := null;
         lblCobrancaValor.Caption := 'Valor %';
         ClientAncestralFATURADO_VALOR.AsCurrency := 0;
         edtCobrancaValor.Properties.DisplayFormat := '% ,0.00';
       end;
  end;       }

{  if StrToInt(icxTipoPeriodo.EditValue) < 3 then
    ClientAncestralHORA_FINAL.AsVariant := null}
end;

procedure TfrmCadastroRapidoContrato.icxTipoPeriodoPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
{  lblDataLimite.Enabled := StrToInt(icxTipoPeriodo.EditValue) > 1;
  edtDataLimite.Enabled := StrToInt(icxTipoPeriodo.EditValue) > 1;
  edtHoras.Enabled      := StrToInt(icxTipoPeriodo.EditValue) > 2;
  lblHoras.Enabled      := StrToInt(icxTipoPeriodo.EditValue) > 2;

  if not (ClientAncestral.State in [dsInsert, dsEdit]) then
    exit;

  if icxTipoPeriodo.EditValue = '1' then
    ClientAncestralDATA_INICIO.AsVariant := null;

  if StrToInt(icxTipoPeriodo.EditValue) < 3 then
    ClientAncestralHORA_INICIO.AsVariant := null}
end;

procedure TfrmCadastroRapidoContrato.lcxClientePrincipalPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if lcxClientePrincipal.EditValue = null then
    exit;

  sqlDemaisPartes.Active := False;
  sqlDemaisPartes.DataSet.ParamByName('PROCESSO_TRAMITE_ID').AsBCD := vgDadosCadastro.ChaveIdSecundaria;
  sqlDemaisPartes.DataSet.ParamByName('PROCESSO_PARTE_ID').AsBCD   := lcxClientePrincipal.EditValue;
  sqlDemaisPartes.Active := True;

  if not sqlDemaisPartes.IsEmpty then
  begin
    lcxDemaisClientes.Items.Clear;
    while not sqlDemaisPartes.Eof do
    begin
      lcxDemaisClientes.Items.Add.Text  := sqlDemaisPartesNOME.AsString;
      sqlDemaisPartes.Next;
    end;

    if Length(sqlClientePrincipalCPFCNPJ.AsString) > 11 then
    begin
      cbxVincular.Caption       := 'Vincular Outras Partes e/ou Representante(s) da Empresa';
      lblDemaisClientes.Caption := 'Outras Partes e/ou Representante(s)';
    end
    else
    begin
      cbxVincular.Caption       := 'Vincular Outro(s) Cliente(s)';
      lblDemaisClientes.Caption := 'Cliente(s) Adicionais do Contrato';
    end;

  end;

  if ClientAncestral.State in [dsEdit, dsInsert] then
    ClientAncestralPARTE_ADICIONAL.AsVariant := null;
end;

end.
