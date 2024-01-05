unit ProgramacaoAjuste;

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
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  frxClass;

type

  TProgramacaoAjuste = Record
    CompromissoAgendadoId, ContabilContaId, PessoaId, ProgramacaoAjusteId : Integer;
    Confirmado, TodosAssociados : Boolean;
    ValorAnterior : Currency;
    SituacaoAnterior : string;
  End;

  TfrmProgramacaoAjuste = class(TForm)
    Panel2: TPanel;
    Bevel4: TBevel;
    lblInformacaoLancamento: TcxLabel;
    Panel4: TPanel;
    imgEMAIL: TImage;
    imgImprimir: TImage;
    Panel1: TPanel;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    lcxCompromisso: TcxLookupComboBox;
    cbxMesAno: TcxComboBox;
    cxGroupBox1: TcxGroupBox;
    cxLabel3: TcxLabel;
    icxAjustarSituacao: TcxImageComboBox;
    chxReajustarCompromisso: TcxCheckBox;
    btnConfirmarCompromisso: TcxButton;
    btnCancelar: TcxButton;
    btnItemExcluir: TcxButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure icxAjustarSituacaoPropertiesChange(Sender: TObject);
    procedure btnConfirmarCompromissoClick(Sender: TObject);
    procedure btnItemExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgramacaoAjuste: TfrmProgramacaoAjuste;
  vgProgramacaoAjuste : TProgramacaoAjuste;
  vgProgramacaoObrigatoria : Boolean;

implementation

uses Lookup, Controles;

{$R *.dfm}

procedure TfrmProgramacaoAjuste.btnConfirmarCompromissoClick(Sender: TObject);

  procedure GravarProgramacao;
  begin
    ExecutaSqlAuxiliar(' INSERT INTO T_PROGRAMACAO_AJUSTE( '+
                       '              PROGRAMACAO_AJUSTE_ID, '+
                       '              COMPROMISSO_AGENDADO_ID, '+
                       '              COMPROMISSO_REAJUSTAR, '+
                       '              COMPROMISSO_SITUACAO, '+
                       '              SITUACAO, '+
                       '              VALOR_ANTERIOR, '+
                       '              SITUACAO_ANTERIOR, '+
                       '              PESSOA_ID, '+
                       '              ANO_MES) '+
                       ' VALUES(      :PROGRAMACAO_AJUSTE_ID, '+
                       '              :COMPROMISSO_AGENDADO_ID, '+
                       '              :COMPROMISSO_REAJUSTAR, '+
                       '              :COMPROMISSO_SITUACAO, '+
                       '              :SITUACAO, '+
                       '              :VALOR_ANTERIOR, '+
                       '              :SITUACAO_ANTERIOR, '+
                       '              :PESSOA_ID, '+
                       '              :ANO_MES)',2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('PROGRAMACAO_AJUSTE_ID').AsCurrency  := dtmControles.GerarSequencia('T_PROGRAMACAO_AJUSTE');
      ParamByName('COMPROMISSO_AGENDADO_ID').AsInteger := vgProgramacaoAjuste.CompromissoAgendadoId;
      ParamByName('COMPROMISSO_REAJUSTAR').AsString    := chxReajustarCompromisso.EditValue;
      ParamByName('COMPROMISSO_SITUACAO').AsString     := IntToStr(icxAjustarSituacao.EditValue);
      ParamByName('SITUACAO').AsString                 := 'A';
      ParamByName('PESSOA_ID').AsInteger               := vgProgramacaoAjuste.PessoaId;
      ParamByName('VALOR_ANTERIOR').AsCurrency         := vgProgramacaoAjuste.ValorAnterior;
      ParamByName('SITUACAO_ANTERIOR').AsString        := vgProgramacaoAjuste.SituacaoAnterior;
      ParamByName('ANO_MES').AsString                  := copy(cbxMesAno.EditValue,4,4) + copy(cbxMesAno.EditValue,1,2);
      ExecSQL;
    end;
  end;

  procedure AlterarProgramacao;
  begin
    ExecutaSqlAuxiliar(' UPDATE T_PROGRAMACAO_AJUSTE SET COMPROMISSO_REAJUSTAR = '+ QuotedStr(chxReajustarCompromisso.EditValue)+','+
                       '                                 COMPROMISSO_SITUACAO = '+ QuotedStr(icxAjustarSituacao.EditValue)+','+
                       '                                 SITUACAO_ANTERIOR = '+ QuotedStr(vgProgramacaoAjuste.SituacaoAnterior)+','+
                       '                                 VALOR_ANTERIOR  = '+ CurrToStr(vgProgramacaoAjuste.ValorAnterior) +','+
                       '                                 ANO_MES = '+ QuotedStr(copy(cbxMesAno.EditValue,4,4) + copy(cbxMesAno.EditValue,1,2))+
                       ' WHERE PROGRAMACAO_AJUSTE_ID = '+ IntToStr(vgProgramacaoAjuste.ProgramacaoAjusteId),1);


  end;
begin
  if Application.MessageBox('Confirma Programação de Ajuste?', 'Pergunta', MB_YESNO) = IDNO then
    exit;

  if vgProgramacaoAjuste.ProgramacaoAjusteId = 0 then
       GravarProgramacao
  else AlterarProgramacao;
  vgProgramacaoAjuste.Confirmado := True;
  Close;
end;

procedure TfrmProgramacaoAjuste.btnItemExcluirClick(Sender: TObject);
begin
  if Application.MessageBox('Excluir Programação de Ajuste?', 'Pergunta', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' DELETE FROM T_PROGRAMACAO_AJUSTE '+
                     ' WHERE PROGRAMACAO_AJUSTE_ID = '+ IntToStr(vgProgramacaoAjuste.ProgramacaoAjusteId),1);
  vgProgramacaoAjuste.Confirmado := True;
  Close;
end;

procedure TfrmProgramacaoAjuste.btnCancelarClick(Sender: TObject);
begin
  vgProgramacaoAjuste.Confirmado := False;
  Close;
end;

procedure TfrmProgramacaoAjuste.FormActivate(Sender: TObject);
begin
  dtmLookup.CarregarPeriodo(cbxMesAno,4,'','');
  lcxCompromisso.EditValue := vgProgramacaoAjuste.ContabilContaId;

  // Vefifica se existe Prgramaçao para este compromisso do associado
  ExecutaSqlAuxiliar(' SELECT * FROM T_PROGRAMACAO_AJUSTE '+
                     ' WHERE COMPROMISSO_AGENDADO_ID = '+IntToStr(vgProgramacaoAjuste.CompromissoAgendadoId)+
                     '   AND SITUACAO = ''A''',0);
  if dtmControles.sqlAuxiliar.IsEmpty then
  begin
    cbxMesAno.ItemIndex             := 0;
    icxAjustarSituacao.EditValue    := '1';
    chxReajustarCompromisso.Checked := True;
    vgProgramacaoAjuste.ProgramacaoAjusteId := 0;
  end
  else
  begin
    cbxMesAno.EditValue                     := dtmLookup.FormatarAnoMes(dtmControles.sqlAuxiliar.FieldByName('ANO_MES').AsString);
    icxAjustarSituacao.EditValue            := dtmControles.sqlAuxiliar.FieldByName('COMPROMISSO_SITUACAO').AsString;
    chxReajustarCompromisso.Checked         := dtmControles.sqlAuxiliar.FieldByName('COMPROMISSO_REAJUSTAR').AsString = 'S';
    vgProgramacaoAjuste.ProgramacaoAjusteId := dtmControles.sqlAuxiliar.FieldByName('PROGRAMACAO_AJUSTE_ID').AsInteger;
  end;
  btnItemExcluir.Enabled := vgProgramacaoAjuste.ProgramacaoAjusteId > 0;
  cbxMesAno.SetFocus;
end;                                                                                                                            

procedure TfrmProgramacaoAjuste.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  vgProgramacaoObrigatoria := False;

  Action               := caFree;
  frmProgramacaoAjuste := nil
end;

procedure TfrmProgramacaoAjuste.FormCreate(Sender: TObject);
begin
  btnCancelar.Enabled    := not vgProgramacaoObrigatoria;
  btnItemExcluir.Enabled := not vgProgramacaoObrigatoria;
end;

procedure TfrmProgramacaoAjuste.icxAjustarSituacaoPropertiesChange(
  Sender: TObject);
begin
  chxReajustarCompromisso.Enabled := icxAjustarSituacao.EditValue = '1';

  if icxAjustarSituacao.EditValue = '2' then
    chxReajustarCompromisso.Checked := False;

end;

end.
