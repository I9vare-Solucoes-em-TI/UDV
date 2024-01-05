unit RelatorioGerencial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadastroAuxSimplificado, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine, dxSkinVS2010,
  dxSkinWhiteprint, dxSkinXmas2008Blue, Menus, FMTBcd, DB, DBClient, Provider,
  SqlExpr, StdCtrls, cxButtons, ExtCtrls, cxLabel, ComCtrls, dxCore,
  cxDateUtils, cxTextEdit, cxDropDownEdit, cxCalendar, cxMaskEdit, cxGroupBox,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxRadioGroup,
  dxSkinscxPCPainter, cxPCdxBarPopupMenu, cxPC, SimpleDS, frxClass, frxDBSet,
  cxCheckBox;

type
  TfrmCadRelatorioGerencial = class(TfrmCadastroAuxSimplificado)
    cxLabel16: TcxLabel;
    rdbRelSintetico: TcxRadioButton;
    rdbRelAnalitico: TcxRadioButton;
    cbxOrganizar: TcxComboBox;
    dtsCaixa: TDataSource;
    ClientCaixa: TClientDataSet;
    ClientCaixaCAIXA_ID: TIntegerField;
    ClientCaixaPRINCIPAL: TStringField;
    ClientCaixaVALOR: TCurrencyField;
    ClientCaixaPESSOA_ID: TIntegerField;
    ClientCaixaDESCRICAO: TStringField;
    btnRelatorio: TcxButton;
    chxTodosAndamento: TcxCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRelatorioClick(Sender: TObject);
  private
    procedure CarregarPeriodoMes;
    procedure ParametrosRelatorioBalancete;
    procedure ParametrosRelatorioGerencial;    
  public
    { Public declarations }
  end;

var
  frmCadRelatorioGerencial: TfrmCadRelatorioGerencial;

implementation

uses Controles, Rotinas, VisualizaRelatorios, GerenciadorServico;

{$R *.dfm}

procedure TfrmCadRelatorioGerencial.btnRelatorioClick(Sender: TObject);
var
  viRelatorioId : String;
begin
  vgRelatorioTodosAndamento := chxTodosAndamento.Checked;
  with frmGerenciadorServico do
  begin
    sqlPesquisaRelatorio.Active := True;
    sqlPesquisaRelatorioAfterScroll(sqlPesquisaRelatorio);
    sqlPesquisaRelatorio.AfterScroll := sqlPesquisaRelatorioAfterScroll;
  end;

  viRelatorioId := dtmControles.BuscarConfig('PRINCIPAL', 'RELATORIO', 'RELATORIO_GERENCIAL_MODELO1', 'S');
  ExibirRelatorio(frmGerenciadorServico.frxReport1, viRelatorioId, ParametrosRelatorioGerencial, True);
end;

procedure TfrmCadRelatorioGerencial.CarregarPeriodoMes;
begin

end;

procedure TfrmCadRelatorioGerencial.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  frmCadRelatorioGerencial := nil;
end;

procedure TfrmCadRelatorioGerencial.ParametrosRelatorioBalancete;
begin

end;

procedure TfrmCadRelatorioGerencial.ParametrosRelatorioGerencial;
begin
  CriarFuncoesRelatorio(frmGerenciadorServico.frxReport1);
end;

end.



