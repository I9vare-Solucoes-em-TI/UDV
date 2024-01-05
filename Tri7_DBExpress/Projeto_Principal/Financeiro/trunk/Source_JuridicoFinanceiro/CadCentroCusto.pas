unit CadCentroCusto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, Menus, cxLookAndFeelPainters, FMTBcd, dxSkinsCore,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine, dxSkinXmas2008Blue,
  dxSkinscxPCPainter, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, cxDBEdit, cxCurrencyEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxImageComboBox, cxContainer, cxLabel, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxPC, DBClient, Provider, SqlExpr,
  ActnList, ComCtrls, StdCtrls, cxButtons, cxLookAndFeels, dxSkinBlueprint,
  dxSkinDarkRoom, dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast,
  dxSkinOffice2010Black, dxSkinOffice2010Blue, dxSkinOffice2010Silver,
  dxSkinOffice2013White, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp,
  dxSkinSharpPlus, dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010,
  dxSkinWhiteprint, cxPCdxBarPopupMenu, cxNavigator, dxSkinDevExpressDarkStyle,
  dxBarBuiltInMenu, System.Actions, DbxDevartInterBase, SimpleDS;

type
  TfrmCadCentroCusto = class(TfrmCadBasico)
    tabBalancete: TcxTabControl;
    pnlDados: TPanel;
    chbSituacao: TcxDBCheckBox;
    cxLabel1: TcxLabel;
    lblInformacao: TcxLabel;
    chxPrincipal: TcxDBCheckBox;
    popCentroCusto: TPopupMenu;
    mniDefinirCentroCustoPrincipal: TMenuItem;
    ClientAncestralCENTRO_CUSTO_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralBALANCETE_GRUPO_ID: TFMTBCDField;
    ClientAncestralPRINCIPAL: TStringField;
    cxDBCheckBox1: TcxDBCheckBox;
    ClientAncestralTIPO_GLOBAL: TStringField;
    sqlRateioCentroCusto: TSimpleDataSet;
    dtsRateioCentroCusto: TDataSource;
    sqlRateioCentroCustoCENTRO_CUSTO_PERSONALIZADO_ID: TFMTBCDField;
    sqlRateioCentroCustoPERCENTUAL: TFMTBCDField;
    sqlRateioCentroCustoCENTRO_CUSTO_PADRAO_ID: TFMTBCDField;
    sqlRateioCentroCustoCENTRO_CUSTO_RATEIO_ID: TFMTBCDField;
    ClientAncestralTIPO_ITEM: TStringField;
    cxLabel3: TcxLabel;
    tabCentroCusto: TcxTabControl;
    pgcDados: TcxPageControl;
    tabItensCentro: TcxTabSheet;
    grdBasica: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    tabRateio: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Panel3: TPanel;
    lblCentroCusto: TcxLabel;
    cxLabel2: TcxLabel;
    lcxCentroCusto: TcxLookupComboBox;
    edtPercentual: TcxCurrencyEdit;
    btnAdicionarCentro: TcxButton;
    btnExcluirItem: TcxButton;
    edtDescricao: TcxDBTextEdit;
    icxEspecie: TcxDBImageComboBox;
    sqlCentroCustoItens: TSimpleDataSet;
    sqlCentroCustoItensDESCRICAO: TStringField;
    sqlCentroCustoItensCENTRO_CUSTO_ID: TFMTBCDField;
    sqlCentroCustoItensBALANCETE_GRUPO_ID: TFMTBCDField;
    dtsCentroCustoItens: TDataSource;
    cxDBCheckBox2: TcxDBCheckBox;
    ClientAncestralPERSONALIZADO: TStringField;
    ClientAncestralTIPO_CENTRO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure tabBalanceteChange(Sender: TObject);
    procedure tabBalanceteChanging(Sender: TObject; var AllowChange: Boolean);
    procedure mniDefinirCentroCustoPrincipalClick(Sender: TObject);
    procedure ExecuteExcluirExecute(Sender: TObject);
    procedure btnAdicionarCentroClick(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tabCentroCustoChange(Sender: TObject);
    procedure pgcDadosChange(Sender: TObject);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure sqlRateioCentroCustoAfterScroll(DataSet: TDataSet);
  private
    vlAbrindoForm : Boolean;
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
    function VerificarCentroCusto(vpCentroCustoId : String):Currency;
    procedure InserirCentroCusto(vpCentroCustoPadraoId : Variant; vpCentroCustoRateioId : Integer;
        vpPercentual : Currency = 100);
  public
  end;

var
  frmCadCentroCusto: TfrmCadCentroCusto;
  vgTipoCentro : string;

implementation

uses Rotinas, Lookup, Controles, Lookup_Contabil, LookupFinanceiro;

{$R *.dfm}

procedure TfrmCadCentroCusto.btnAdicionarCentroClick(Sender: TObject);
begin
  inherited;
  VerificarPreenchimentoLCX_TX(lcxCentroCusto.Text, 'Reserva', lcxCentroCusto);
  VerificarPreenchimentoCUR_TX(edtPercentual.EditValue, '% Percentual', edtPercentual);

  sqlRateioCentroCusto.DisableControls;
  sqlRateioCentroCusto.First;
  While not sqlRateioCentroCusto.Eof do
  begin
    if sqlRateioCentroCustoCENTRO_CUSTO_RATEIO_ID.AsInteger = lcxCentroCusto.EditValue then
    begin
      sqlRateioCentroCusto.EnableControls;
      Application.MessageBox('Este Centro de Custo j� esta adicionado no rateio!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
      lcxCentroCusto.SetFocus;
      exit;
    end;
    sqlRateioCentroCusto.Next;
  end;
  sqlRateioCentroCusto.EnableControls;

  if (VerificarCentroCusto(ClientAncestralCENTRO_CUSTO_ID.AsString)+edtPercentual.EditValue) > 100  then
  begin
    Application.MessageBox('Percentual Total do Rateio n�o pode ser maior que 100%!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtPercentual.SetFocus;
    exit;
  end;

  InserirCentroCusto(ClientAncestralCENTRO_CUSTO_ID.AsInteger, lcxCentroCusto.EditValue, edtPercentual.EditValue);
  lcxCentroCusto.EditValue := null;
  edtPercentual.Clear;
end;

procedure TfrmCadCentroCusto.btnExcluirItemClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Confirma exclus�o do Item de Rateio do Centro de Custo?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  sqlRateioCentroCusto.Delete;
  sqlRateioCentroCusto.ApplyUpdates(-1);
end;

procedure TfrmCadCentroCusto.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if vlAbrindoForm then
    exit;

  tabRateio.TabVisible   := (tabCentroCusto.TabIndex = 1) and (not ClientAncestral.IsEmpty);
  if tabRateio.TabVisible then
     tabRateio.Caption := 'Rateio Percentual(%) Grupo '+ClientAncestralDESCRICAO.AsString;

  ExecuteExcluir.Enabled := ClientAncestralTIPO_ITEM.AsString <> '3';
  icxEspecie.Enabled     := ClientAncestralTIPO_ITEM.AsString <> '3';
  mniDefinirCentroCustoPrincipal.Enabled := ClientAncestralSITUACAO.AsString = 'A';
end;

procedure TfrmCadCentroCusto.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  pgcDados.ActivePageIndex := 0;
  edtDescricao.SetFocus;
end;

procedure TfrmCadCentroCusto.ExecuteExcluirExecute(Sender: TObject);
begin
  if ClientAncestralPRINCIPAL.AsString = 'S' then
  begin
    Application.MessageBox('Centro de Custo Principal n�o pode ser exclu�do!', 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  inherited;
  mniDefinirCentroCustoPrincipal.Enabled := ClientAncestral.RecordCount > 1;
end;

procedure TfrmCadCentroCusto.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoEDT_DB(edtDescricao.text,'Descri��o',edtDescricao);
  ClientAncestralBALANCETE_GRUPO_ID.AsInteger := vgTabBalancete[tabBalancete.TabIndex];

  inherited;
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmCadCentroCusto.ExecuteIncluirExecute(Sender: TObject);
begin
  if tabBalancete.Tabs.Count = 0 then
  begin
    Application.MessageBox('N�o existe nenhum balancete cadastrado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  pgcDados.ActivePageIndex := 0;
  inherited;
  ClientAncestralSITUACAO.AsString    := 'A';
  ClientAncestralTIPO_ITEM.AsString   := '1';
  ClientAncestralTIPO_CENTRO.AsString := vgTipoCentro;

  if ClientAncestral.RecordCount = 0 then
       ClientAncestralPRINCIPAL.AsString :=  'S'
  else ClientAncestralPRINCIPAL.AsString :=  'N';

  edtDescricao.SetFocus;
end;

procedure TfrmCadCentroCusto.FormActivate(Sender: TObject);
var
  viDescricao : String;
begin
  inherited;
  pgcDados.ActivePageIndex := 0;
  tabCentroCusto.TabIndex  := 0;
  vlAbrindoForm := False;
  tabCentroCustoChange(self);

  if vgTipoCentro = '1' then
       viDescricao := 'Centro de Custo'
  else viDescricao := 'Descri��o do Grupo';

  lblInformacao.Caption := '* Para modificar o '+viDescricao+ ' principal, clique com o bot�o direito do mouse no item desejado.';
  mniDefinirCentroCustoPrincipal.Caption := 'Definir como '+viDescricao+' Principal';

  Caption := viDescricao;
  tabCentroCusto.Tabs[0].Caption := 'Item do '+viDescricao;
  tabCentroCusto.Tabs[1].Caption := 'Grupo do '+viDescricao;

  lblCentroCusto.Caption     := viDescricao;
  cxGridDBColumn1.Caption    := viDescricao;
end;

procedure TfrmCadCentroCusto.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  viPercentual : Currency;
begin
  ClientAncestral.DisableControls;
  tabCentroCusto.TabIndex := 1;
  tabCentroCustoChange(self);
  ClientAncestral.First;
  while not ClientAncestral.Eof do
  begin
    viPercentual := VerificarCentroCusto(ClientAncestralCENTRO_CUSTO_ID.AsString);
    if ((viPercentual > 0) and (viPercentual < 100)) then
    begin
      Application.MessageBox(PChar('Rateio Total Centro de Custo '+ClientAncestralDESCRICAO.AsString + ' esta menor que 100%.'), 'Aten��o', MB_OK + MB_ICONWARNING);
      ClientAncestral.EnableControls;
      Abort;
    end;
    ClientAncestral.Next;
  end;
  ClientAncestral.EnableControls;

  inherited;
  dtmLookupContabil.AtualizarTabelas;
  dtmLookupFinanceiro.AtualizarTabelas;

  Action            := caFree;
  frmCadCentroCusto := nil;
end;

procedure TfrmCadCentroCusto.FormCreate(Sender: TObject);
begin
  vlAbrindoForm := True;
  inherited;
  vgNomeTabela    := 'J_CENTRO_CUSTO';
  vgChavePrimaria := 'CENTRO_CUSTO_ID';
  dtmLookupContabil.CarregarTabBalancete(tabBalancete);
  cxGridPesquisa.DataController.Groups.FullExpand;
  sqlCentroCustoItens.Connection  := dtmControles.DB;
  sqlRateioCentroCusto.Connection := dtmControles.DB;
  sqlRateioCentroCusto.Active     := True;
end;

procedure TfrmCadCentroCusto.InserirCentroCusto(vpCentroCustoPadraoId : Variant; vpCentroCustoRateioId : Integer;
        vpPercentual : Currency = 100);
begin
  if vpCentroCustoRateioId = null then
    exit;

  sqlRateioCentroCusto.Append;
  sqlRateioCentroCustoCENTRO_CUSTO_PERSONALIZADO_ID.AsInteger := dtmControles.GerarSequencia('J_CENTRO_CUSTO_PERSONALIZADO');
  sqlRateioCentroCustoCENTRO_CUSTO_PADRAO_ID.AsInteger        := vpCentroCustoPadraoId;
  sqlRateioCentroCustoCENTRO_CUSTO_RATEIO_ID.AsInteger        := vpCentroCustoRateioId;
  sqlRateioCentroCustoPERCENTUAL.AsCurrency                   := vpPercentual;
  sqlRateioCentroCusto.ApplyUpdates(-1);
end;

procedure TfrmCadCentroCusto.LoadData;
begin
  Screen.Cursor := crHourGlass;
  LockWindowUpdate(Handle);
  ClientAncestral.Close;
  DataSetAncestral.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  DataSetAncestral.ParamByName('TIPO_CENTRO').AsString         := vgTipoCentro;
  ClientAncestral.Open;
  pgcDadosChange(SELF);
  LockWindowUpdate(0);
  Screen.Cursor := crDefault;
  inherited;
end;

procedure TfrmCadCentroCusto.mniDefinirCentroCustoPrincipalClick(
  Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Definir Centro de Custo selecionado como Principal?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  ExecutaSqlAuxiliar(' UPDATE J_CENTRO_CUSTO SET PRINCIPAL = '+QuotedStr('N')+
                     ' WHERE BALANCETE_GRUPO_ID = '+IntToStr(vgTabBalancete[tabBalancete.TabIndex])+
                     '  AND TIPO_CENTRO = '+QuotedStr(vgTipoCentro),1);
  ClientAncestral.Refresh;

  ClientAncestral.Edit;
  ClientAncestralPRINCIPAL.AsString := 'S';
  ClientAncestral.ApplyUpdates(-1);
end;

procedure TfrmCadCentroCusto.pgcDadosChange(Sender: TObject);
begin
  inherited;
  sqlCentroCustoItens.Active := False;
  sqlCentroCustoItens.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgTabBalancete[tabBalancete.TabIndex];
  sqlCentroCustoItens.DataSet.ParamByName('TIPO_CENTRO').AsString         := vgTipoCentro;
  sqlCentroCustoItens.Active := True;
end;

procedure TfrmCadCentroCusto.SetState(AState: TDataSetState);
begin
  if vlAbrindoForm then
    exit;
  inherited;
  pnlDados.Enabled       := State in [dsEdit, dsInsert];
  grdBasica.Enabled      := State = dsBrowse;
  pgcDados.Enabled       := State = dsBrowse;
  tabCentroCusto.Enabled := State = dsBrowse;
  PanelData.Enabled      := True;
  cxGridPesquisa.DataController.Groups.FullExpand;
end;

procedure TfrmCadCentroCusto.sqlRateioCentroCustoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  btnExcluirItem.Enabled := not sqlRateioCentroCusto.IsEmpty;
end;

procedure TfrmCadCentroCusto.tabBalanceteChange(Sender: TObject);
begin
  inherited;
  LoadData;
end;

procedure TfrmCadCentroCusto.tabBalanceteChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  if State in [dsInsert, dsEdit] then
    abort;
end;

procedure TfrmCadCentroCusto.tabCentroCustoChange(Sender: TObject);
begin
  inherited;
  ClientAncestral.Filtered := False;
  if tabCentroCusto.TabIndex = 0 then
  begin
    ClientAncestral.Filter   := 'TIPO_ITEM <> ''2''';
    pgcDados.ActivePageIndex := 0;
  end
  else ClientAncestral.Filter   := 'TIPO_ITEM = ''2''';
  ClientAncestral.Filtered := True;

  if vlAbrindoForm then
    exit;

  SetState(dsBrowse);
end;

function TfrmCadCentroCusto.VerificarCentroCusto(
  vpCentroCustoId: String): Currency;
begin
  if vpCentroCustoId = '' then
    exit;

  Result := dtmControles.GetFloat(' SELECT SUM(PERCENTUAL) FROM J_CENTRO_CUSTO_PERSONALIZADO '+
                                  ' WHERE CENTRO_CUSTO_PADRAO_ID = '+ vpCentroCustoId);

end;

end.