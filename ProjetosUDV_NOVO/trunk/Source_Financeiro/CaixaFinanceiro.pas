unit CaixaFinanceiro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  DBClient, Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons,
  ExtCtrls, cxTextEdit, cxDBEdit, cxContainer, cxLabel, cxSplitter,
  cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxCheckBox, Menus, dxSkinsCore,
  dxSkinsDefaultPainters, SimpleDS, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinHighContrast, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013White, dxSkinSeven,
  dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus, dxSkinSpringTime,
  dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint, cxNavigator,
  System.Actions, dxBarBuiltInMenu, cxPC;

type
  TfrmCaixaFinanceiro = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    ClientAncestralCAIXA_ID: TFMTBCDField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralRESPONSAVEL_ID: TFMTBCDField;
    popPrincipal: TPopupMenu;
    mniDefinirCentroCustoPrincipal: TMenuItem;
    ClientAncestralPRINCIPAL: TStringField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralRESUMO: TStringField;
    ClientAncestralINTERNO: TStringField;
    cxLabel2: TcxLabel;
    ClientAncestralBANCO_ID: TFMTBCDField;
    ClientAncestralTIPO_CAIXA: TStringField;
    Label1: TLabel;
    cxLabel3: TcxLabel;
    edtDescricao: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit1: TcxDBTextEdit;
    lcxTipoCaixa: TcxDBImageComboBox;
    chbSituacao: TcxDBCheckBox;
    ClientAncestralGRUPO: TStringField;
    tabGrupo: TcxTabControl;
    grdServico: TcxGrid;
    grdServicoDBTableView1: TcxGridDBTableView;
    grdServicoDBTableView1DESCRICAO: TcxGridDBColumn;
    grdServicoDBTableView1Column2: TcxGridDBColumn;
    grdServicoDBTableView1Column3: TcxGridDBColumn;
    grdServicoDBTableView1PRINCIPAL: TcxGridDBColumn;
    grdServicoDBTableView1Column1: TcxGridDBColumn;
    grdServicoDBTableView1SITUACAO: TcxGridDBColumn;
    grdServicoLevel1: TcxGridLevel;
    procedure FormCreate(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure mniDefinirCentroCustoPrincipalClick(Sender: TObject);
    procedure btnTarefaExcluirClick(Sender: TObject);
    procedure tabGrupoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure LoadData; override;
    procedure SetState (AState : TDataSetState);override;
  end;

var
  frmCaixaFinanceiro: TfrmCaixaFinanceiro;

implementation

uses Controles, Lookup, LookupFinanceiro, Lookup_Contabil;

{$R *.dfm}

procedure TfrmCaixaFinanceiro.FormCreate(Sender: TObject);
begin
  ClientAncestral.Open;
  inherited;
  vgNomeTabela    := 'J_CAIXA';
  vgChavePrimaria := 'CAIXA_ID';
  tabGrupoChange(Self);
end;

procedure TfrmCaixaFinanceiro.LoadData;
begin
  inherited;
  if Trim(vgChave) <> '' then
     ClientAncestral.Locate('CAIXA_ID', vgChave, [loCaseInsensitive]);
end;

procedure TfrmCaixaFinanceiro.mniDefinirCentroCustoPrincipalClick(
  Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Definir Caixa Financeiro selecionado como Principal?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_CAIXA SET PRINCIPAL = '+QuotedStr('N'),1);
  ClientAncestral.Refresh;

  ClientAncestral.Edit;
  ClientAncestralPRINCIPAL.AsString := 'S';
  ClientAncestral.ApplyUpdates(-1);
end;

procedure TfrmCaixaFinanceiro.SetState(AState: TDataSetState);
begin
  inherited;
  grdServico.Enabled := State = dsBrowse;
end;

procedure TfrmCaixaFinanceiro.ExecuteGravarExecute(Sender: TObject);
var
  viValor : Currency;

  procedure VerificarItemInativo;
  begin
  if (ClientAncestralSITUACAO.AsString = 'I') and (ClientAncestralCAIXA_ID.AsInteger > 0) then
  begin
    // Verifica se existe Agendamento vinculado a esta Conta
    viValor := dtmControles.GetInt(' SELECT COUNT(LIVRO_AGENDAMENTO_ID) FROM J_LIVRO_AGENDAMENTO '+
                                   ' WHERE SITUACAO = '+QuotedStr('1')+
                                   '   AND CAIXA_ID = '+ClientAncestralCAIXA_ID.AsString);
    if viValor > 0 then
    begin
      Application.MessageBox(Pchar('Item n�o pode ser Inativado.'+#13+#13+ 'Existem agendamento(s) vinculado a mesma!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
    end;

    viValor := dtmLookupContabil.CalcularSaldoCaixa('', ClientAncestralCAIXA_ID.AsString,'');
    if viValor <> 0 then
    begin
      Application.MessageBox(Pchar('Item n�o pode ser Inativado.'+#13+#13+ 'O Saldo do Caixa deve estar Zerado!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
      abort;
    end;
  end;
  end;

begin
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Sistema', edtDescricao);
  VerificarPreenchimentoICX_DB(lcxTipoCaixa.Text, 'Tipo de Caixa', lcxTipoCaixa);
  VerificarItemInativo;
  inherited;
end;

procedure TfrmCaixaFinanceiro.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString  := 'A';
  ClientAncestralINTERNO.AsString   := 'N';
  ClientAncestralPRINCIPAL.AsString := 'N';
  edtDescricao.SetFocus;
end;

procedure TfrmCaixaFinanceiro.btnTarefaExcluirClick(Sender: TObject);
begin
  inherited;
  ClientAncestralRESPONSAVEL_ID.AsVariant := null;
end;

procedure TfrmCaixaFinanceiro.tabGrupoChange(Sender: TObject);
begin
  inherited;
  ClientAncestral.Filtered := False;
  ClientAncestral.Filter := '';

  case tabGrupo.TabIndex of
    0: ClientAncestral.Filter := 'SITUACAO = ' + QuotedStr('A');
    1: ClientAncestral.Filter := 'SITUACAO = ' + QuotedStr('I');
    2: exit;
  end;

  ClientAncestral.Filtered := True;
  Screen.Cursor := crDefault;
end;

procedure TfrmCaixaFinanceiro.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCaixaFinanceiro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dtmLookupFinanceiro.AtualizarTabelas;
  dtmLookupContabil.AtualizarTabelas;

  Action             := caFree;
  frmCaixaFinanceiro := nil;
end;

end.
