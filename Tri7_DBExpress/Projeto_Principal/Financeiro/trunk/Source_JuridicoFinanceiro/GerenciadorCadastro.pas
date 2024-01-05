unit GerenciadorCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, StdCtrls, cxButtons, ExtCtrls, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxControls, cxContainer, cxEdit, cxGroupBox, frxClass,
  frxDBSet, cxLabel, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Menus, dxSkinsCore, dxSkinsDefaultPainters, cxGraphics,
  dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee, dxSkinDarkSide,
  dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian, dxSkinLiquidSky,
  dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver, dxSkinStardust,
  dxSkinSummer2008, dxSkinValentine, dxSkinXmas2008Blue, dxGDIPlusClasses,
  cxImageComboBox, cxDBEdit, cxCurrencyEdit, cxCalendar, SimpleDS, cxStyles,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, FrameCadastro;

type
  TDadosCadastroItem = Record
    Confirmado : Boolean;
    ControleID, EscreventePadrao : Integer;
  End;


  TfrmGerenciadorCadastro = class(TfrmCadAuxiliar)
    pnlInformacao: TPanel;
    imgPagar: TImage;
    lblInformacaoCertidao: TcxLabel;
    ClientItem: TClientDataSet;
    dtsClienteItem: TDataSource;
    btnConcluirServico: TcxButton;
    ClientItemTipoTransacao: TStringField;
    ClientItemTipoServico: TIntegerField;
    ClientItemData: TDateField;
    ClientItemProtocolo: TIntegerField;
    ClientItemLivro: TStringField;
    ClientItemFolha: TStringField;
    ClientItemValor: TCurrencyField;
    ClientItemQtd: TIntegerField;
    ClientItemTotal: TCurrencyField;
    ClientItemDescricao: TStringField;
    Panel2: TPanel;
    btnAdicionarRegistro: TcxButton;
    btnLimpar: TcxButton;
    btnItemExcluir: TcxButton;
    fmeCadastro: TfmeCadastro;
    cbxItensVinculados: TcxGroupBox;
    cxGridSelos: TcxGrid;
    cxGridDBTableView5: TcxGridDBTableView;
    cxGridDBTableView5Column2: TcxGridDBColumn;
    cxGridDBTableView5Column1: TcxGridDBColumn;
    cxGridDBTableView5Column3: TcxGridDBColumn;
    cxGridDBTableView5Column4: TcxGridDBColumn;
    cxGridDBTableView5Column5: TcxGridDBColumn;
    cxGridDBTableView5Column6: TcxGridDBColumn;
    cxGridDBTableView5Column7: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    ClientItemSelo: TStringField;
    cxGridDBTableView5Column8: TcxGridDBColumn;
    cxGridDBTableView5Column9: TcxGridDBColumn;
    cxGridDBTableView5Column10: TcxGridDBColumn;
    cxGridDBTableView5Column11: TcxGridDBColumn;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure edtProtocoloKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure icxTipoSistemaPropertiesEditValueChanged(Sender: TObject);
    procedure btnAdicionarRegistroClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnItemExcluirClick(Sender: TObject);
    procedure edtQtdKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnConcluirServicoClick(Sender: TObject);
    procedure fmeCadastrolcxTipoServicoPropertiesEditValueChanged(
      Sender: TObject);
  private
    procedure LimparCampos(vpTodos : Boolean);

  public
    { Public declarations }
  end;

var
  frmGerenciadorCadastro: TfrmGerenciadorCadastro;
  vgDadosCadastroItem : TDadosCadastroItem;

implementation

uses Lookup, Controles, Rotinas, GerenciadorConfirmacao;

{$R *.dfm}

procedure TfrmGerenciadorCadastro.btnCancelarClick(Sender: TObject);
begin
  if not ClientItem.IsEmpty then
    if Application.MessageBox(PCHAR('Existem registros a concluir. Confirma cancelamento da inclusão?'),'Confirmar', MB_ICONQUESTION + MB_YESNO) = IDNO then
      exit;

  vgDadosCadastroItem.Confirmado := False;

            Screen.Cursor := crHourGlass;
  inherited;
end;

procedure TfrmGerenciadorCadastro.btnConcluirServicoClick(Sender: TObject);
begin
  inherited;
  if ClientItem.IsEmpty then
  begin
    Application.MessageBox('Nenhum registro adicionado!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
    exit;
  end;

  ExibirFormulario(TfrmGerenciadorConfirmacao, frmGerenciadorConfirmacao, True);
  if vgRegistroConfimado then
  begin
    vgDadosCadastroItem.Confirmado := True;
    close;
  end;
end;

procedure TfrmGerenciadorCadastro.btnItemExcluirClick(Sender: TObject);
begin
  inherited;
  ClientItem.Delete;

  btnConcluirServico.Enabled := not ClientItem.IsEmpty;
  btnItemExcluir.Enabled     := not ClientItem.IsEmpty;
end;

procedure TfrmGerenciadorCadastro.btnLimparClick(Sender: TObject);
begin
  inherited;
  LimparCampos(True);
end;

procedure TfrmGerenciadorCadastro.btnAdicionarRegistroClick(Sender: TObject);
var
  i : Integer;
begin
  inherited;
  VerificarPreenchimentoLCX_tx(fmeCadastro.lcxTipoServico.Text, 'Tipo de Serviço',fmeCadastro.lcxTipoServico);
  VerificarPreenchimentoDTA_TX(fmeCadastro.edtPesqDtRegIni.Text, 'Data de Registro',fmeCadastro.edtPesqDtRegIni);
  VerificarPreenchimentoEDT_tx(fmeCadastro.edtDescricao.Text, 'Descrição',fmeCadastro.edtDescricao);

  if (fmeCadastro.edtEmolumentos.EditValue < 0) then
  begin
    Application.MessageBox('Valor Emolumentos Inválido!!!', 'Atenção', MB_Ok + MB_ICONWARNING);
    fmeCadastro.edtEmolumentos.SetFocus;
    exit;
  end;

  btnConcluirServico.Enabled := True;
  btnItemExcluir.Enabled     := True;

  ClientItem.Insert;
  ClientItemTipoTransacao.AsString := fmeCadastro.icxTipoTransacao.EditValue;
  ClientItemTipoServico.AsInteger  := fmeCadastro.lcxTipoServico.EditValue;
  ClientItemData.AsDateTime        := fmeCadastro.edtPesqDtRegIni.Date;

  if fmeCadastro.edtPesqProtocolo.EditValue <> null then
    ClientItemProtocolo.AsString := fmeCadastro.edtPesqProtocolo.EditValue;

  if fmeCadastro.edtFolha.EditValue <> null then
    ClientItemFolha.AsString := fmeCadastro.edtFolha.EditValue;

  if fmeCadastro.edtLivro.EditValue <> null then
    ClientItemLivro.AsString := fmeCadastro.edtLivro.EditValue;

  ClientItemDescricao.AsString     := fmeCadastro.edtDescricao.EditValue;

  if fmeCadastro.edtSelo.EditValue <> null then
    ClientItemSelo.AsString        := fmeCadastro.edtSelo.EditValue;

  ClientItemQtd.AsInteger          := fmeCadastro.edtQtd.EditValue;
  ClientItemValor.AsCurrency       := fmeCadastro.edtEmolumentos.EditValue;
  ClientItemTotal.AsCurrency       := fmeCadastro.edtTotal.EditValue;
  ClientItem.Post;
  LimparCampos(False);
end;

procedure TfrmGerenciadorCadastro.edtProtocoloKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  DigitaInteiro(Key);
end;

procedure TfrmGerenciadorCadastro.edtQtdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    btnAdicionarRegistroClick(Self);
end;

procedure TfrmGerenciadorCadastro.fmeCadastrolcxTipoServicoPropertiesEditValueChanged(
  Sender: TObject);
begin
  fmeCadastro.lcxTipoServicoPropertiesEditValueChanged(fmeCadastro.lcxTipoServico);
  inherited;
  btnAdicionarRegistro.Enabled := True;
end;

procedure TfrmGerenciadorCadastro.FormActivate(Sender: TObject);
begin
  inherited;
  fmeCadastro.cbxValores.Enabled  := False;
  cbxItensVinculados.Enabled      := False;
  btnConcluirServico.Enabled      := False;

  dtmLookup.CarregarListaSistemas(fmeCadastro.icxTipoSistema, True, True);
  fmeCadastro.edtApresentante.EditValue := dtmControles.BuscarConfig('REGISTRO_DIARIO','GERAL','APRESENTANTE_PADRAO','S');
  ClientItem.EmptyDataSet;
  fmeCadastro.icxTipoSistema.SetFocus;
end;

procedure TfrmGerenciadorCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  fmeCadastro.sqlTipoServico.Active := False;

  Action := caFree;
  frmGerenciadorCadastro := nil;
end;

procedure TfrmGerenciadorCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  fmeCadastro.sqlTipoServico.Connection := dtmControles.DB;

  vgDadosCadastroItem.Confirmado := False;
  dtmLookup.CarregarListaSistemas(fmeCadastro.icxTipoSistema);
end;

procedure TfrmGerenciadorCadastro.icxTipoSistemaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  fmeCadastro.btnConfirmarItem.Enabled := fmeCadastro.icxTipoSistema.EditValue <> null;
end;

procedure TfrmGerenciadorCadastro.LimparCampos(vpTodos: Boolean);
begin
  with fmeCadastro do
  begin
    lcxTipoServico.Clear;
    edtEmolumentos.Clear;
    edtTotal.Clear ;
    edtQtd.EditValue := 1;

    if vpTodos then
    begin
      edtPesqProtocolo.Clear;
      edtFolha.Clear;
      edtLivro.Clear;
      edtDescricao.Clear;
      icxTipoTransacao.SetFocus;
    end
    else lcxTipoServico.SetFocus;
  end;
  btnAdicionarRegistro.Enabled := False;
end;

end.
