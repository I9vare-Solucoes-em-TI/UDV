unit CentroCustoPersonalizado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, CadastroAuxSimplificado, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  Vcl.Menus, Data.FMTBcd, Data.DB, Datasnap.DBClient, Datasnap.Provider,
  Data.SqlExpr, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls, cxLabel, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  cxCurrencyEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  DbxDevartInterBase, SimpleDS;

type
  TfrmCentroCustoPersonalizado = class(TfrmCadastroAuxSimplificado)
    Panel3: TPanel;
    cxLabel5: TcxLabel;
    cxLabel1: TcxLabel;
    lcbCentroCusto: TcxLookupComboBox;
    edtPorcentagem: TcxCurrencyEdit;
    btnAdicionarCentro: TcxButton;
    btnExcluirItem: TcxButton;
    sqlCentroCustoItens: TSimpleDataSet;
    sqlCentroCustoItensDESCRICAO: TStringField;
    sqlCentroCustoItensCENTRO_CUSTO_ID: TFMTBCDField;
    sqlCentroCustoItensBALANCETE_GRUPO_ID: TFMTBCDField;
    dtsCentroCustoItens: TDataSource;
    cxGrid1: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBTableView5Column1: TcxGridDBColumn;
    cxGridDBTablePercentual: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure edtPorcentagemKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAdicionarCentroClick(Sender: TObject);
    procedure btnExcluirItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure sqlCentroCustoItensAfterScroll(DataSet: TDataSet);
    procedure btnConfirmarClick(Sender: TObject);
  private
    procedure VerificarCentroCusto(vpCentroCustoId : Integer; vpPercentual : Currency);
  public
    { Public declarations }
  end;

var
  frmCentroCustoPersonalizado: TfrmCentroCustoPersonalizado;
  vgTipoCentroPersonalizado : String;

implementation

uses
  Lookup_Contabil, Lookup, Rotinas, Controles, LookupFinanceiro;

{$R *.dfm}

procedure TfrmCentroCustoPersonalizado.btnAdicionarCentroClick(
  Sender: TObject);

begin
  inherited;
  VerificarPreenchimentoLCX_TX(lcbCentroCusto.Text,'Centro de Custos', lcbCentroCusto);
  VerificarCentroCusto(lcbCentroCusto.EditValue, edtPorcentagem.EditValue);

  if edtPorcentagem.EditValue <= 0 then
  begin
    Application.MessageBox('Porcentagem Inv�lida!!!', 'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
    edtPorcentagem.SetFocus;
    exit;
  end;

  vgCentroCusto.ClientCentro.Insert;
  vgCentroCusto.ClientCentro.FieldByName('CENTRO_CUSTO_ID').AsInteger := lcbCentroCusto.EditValue;
  vgCentroCusto.ClientCentro.FieldByName('PORCENTAGEM').AsCurrency    := edtPorcentagem.EditValue;
  vgCentroCusto.ClientCentro.FieldByName('SITUACAO').AsString         := '1';
  vgCentroCusto.ClientCentro.Post;
  lcbCentroCusto.SetFocus;

  lcbCentroCusto.EditValue := null;
  edtPorcentagem.EditValue := 0;
end;

procedure TfrmCentroCustoPersonalizado.btnCancelarClick(Sender: TObject);
begin
  vgCentroCusto.Cancelado := True;
  inherited;
end;

procedure TfrmCentroCustoPersonalizado.btnConfirmarClick(Sender: TObject);
begin
  vgCentroCusto.Confirmado := True;
  inherited;

end;

procedure TfrmCentroCustoPersonalizado.btnExcluirItemClick(Sender: TObject);
begin
  dtmLookupFinanceiro.ApagarCentroCustoReserva('', IntToStr(vgCentroCusto.TipoCentro), vgCentroCusto.ClientCentro);
end;

procedure TfrmCentroCustoPersonalizado.edtPorcentagemKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if Key = 13 then
  begin
    btnAdicionarCentro.SetFocus;
    btnAdicionarCentroClick(self);
  end;
end;

procedure TfrmCentroCustoPersonalizado.FormActivate(Sender: TObject);
begin
  inherited;
  vgCentroCusto.Confirmado   := False;
  sqlCentroCustoItens.Active := False;
  sqlCentroCustoItens.DataSet.ParamByName('BALANCETE_GRUPO_ID').AsInteger := vgCentroCusto.BalanceteId;
  sqlCentroCustoItens.DataSet.ParamByName('TIPO_CENTRO').AsInteger        := vgCentroCusto.TipoCentro;
  sqlCentroCustoItens.Active := True;
  lcbCentroCusto.SetFocus;
end;

procedure TfrmCentroCustoPersonalizado.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if not vgCentroCusto.Cancelado then
    VerificarCentroCusto(0,0);

  Action := caFree;
  frmCentroCustoPersonalizado := nil;
  inherited;
end;

procedure TfrmCentroCustoPersonalizado.FormCreate(Sender: TObject);
begin
  case vgCentroCusto.TipoCentro of
    1 : cxGridDBTableView5.DataController.DataSource.DataSet := dtmLookupFinanceiro.ClientCentroCustos;
    2 : cxGridDBTableView5.DataController.DataSource.DataSet := dtmLookupFinanceiro.ClientCentroReserva;
  end;

  sqlCentroCustoItens.Connection := dtmControles.DB;
  inherited;

end;

procedure TfrmCentroCustoPersonalizado.sqlCentroCustoItensAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  btnExcluirItem.Enabled := not vgCentroCusto.ClientCentro.IsEmpty;
end;

procedure TfrmCentroCustoPersonalizado.VerificarCentroCusto(vpCentroCustoId : Integer; vpPercentual : Currency);
var
  viTotalPercentual : Currency;
begin
  vgCentroCusto.ClientCentro.DisableControls;
  vgCentroCusto.ClientCentro.First;
  viTotalPercentual := 0;

  while not vgCentroCusto.ClientCentro.Eof do
  begin
    if vpCentroCustoId <> 0 then
    begin
      if vgCentroCusto.ClientCentro.FieldByName('CENTRO_CUSTO_ID').AsInteger = vpCentroCustoId then
      begin
        Application.MessageBox('Centro de Custo ja vinculado!!!', 'Aten��o', mb_Ok + MB_ICONEXCLAMATION);
        lcbCentroCusto.SetFocus;
        vgCentroCusto.ClientCentro.EnableControls;
        Abort;
      end;
    end;

    viTotalPercentual := viTotalPercentual + vgCentroCusto.ClientCentro.FieldByName('PORCENTAGEM').AsCurrency;
    vgCentroCusto.ClientCentro.Next;
  end;

  if vpCentroCustoId > 0 then
  begin
    if (viTotalPercentual+edtPorcentagem.EditValue) > 100 then
    begin
      Application.MessageBox('Percentual Total do Rateio n�o pode ser maior que 100%!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
      edtPorcentagem.SetFocus;
      exit;
    end;
  end
  else
  begin
    if (viTotalPercentual > 0) and (viTotalPercentual < 100) then
    begin
      Application.MessageBox(PChar('Rateio Total Centro de Custo esta menor que 100%.'), 'Aten��o', MB_OK + MB_ICONWARNING);
      vgCentroCusto.ClientCentro.EnableControls;
      abort;
    end;
  end;

  vgCentroCusto.ClientCentro.EnableControls;

end;

end.