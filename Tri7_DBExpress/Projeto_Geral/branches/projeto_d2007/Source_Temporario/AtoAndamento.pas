unit AtoAndamento;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxImageComboBox, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, cxDBLookupComboBox, cxTextEdit, cxGroupBox,
  cxDBEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxContainer, cxLabel, SimpleDS;

type
  TfrmAtoAndamento = class(TfrmCadBasico)
    ClientAncestralATO_ANDAMENTO_ID: TFMTBCDField;
    ClientAncestralTB_ANDAMENTOSERVICO_ID: TFMTBCDField;
    ClientAncestralATO_ID: TFMTBCDField;
    ClientAncestralUSUARIO_ID: TFMTBCDField;
    ClientAncestralDATA_ANDAMENTO: TSQLTimeStampField;
    ClientAncestralOBSERVACAO: TBlobField;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBData: TcxGridDBColumn;
    cxGridBasicaDBUsuario: TcxGridDBColumn;
    cxGridBasicaDBAndamento: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    grdBasicaDBTableView1DBColumn1: TcxGridDBColumn;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    lcxTipoAndamento: TcxDBLookupComboBox;
    edtDescricao: TcxDBTextEdit;
    gbxPainelPesquisa: TcxGroupBox;
    cxLabel2: TcxLabel;
    cxLabel6: TcxLabel;
    cxGridBasicaDBProtocolo: TcxGridDBColumn;
    ClientAncestralcalc_Protocolo: TIntegerField;
    ClientAncestralCOMPLEMENTO: TStringField;
    sqlAndamentoServcoGeral: TSimpleDataSet;
    dtsAndamentoServicoGeral: TDataSource;
    sqlAndamentoServcoGeralTB_ANDAMENTOSERVICO_ID: TFMTBCDField;
    sqlAndamentoServcoGeralDESCRICAO: TStringField;
    sqlAndamentoServcoGeralSITUACAO: TStringField;
    sqlAndamentoServcoGeralTIPO: TStringField;
    cxLabel4: TcxLabel;
    edtPesqProtocolo: TcxTextEdit;
    icxAndamentoServico: TcxLookupComboBox;
    lcxUsuario: TcxLookupComboBox;
    btnPesquisar: TcxButton;
    cxLabel5: TcxLabel;
    edtOutorgado: TcxTextEdit;
    cxLabel7: TcxLabel;
    edtOutorgante: TcxTextEdit;
    sqlAndamentoServico: TSimpleDataSet;
    sqlAndamentoServicoTB_ANDAMENTOSERVICO_ID: TFMTBCDField;
    sqlAndamentoServicoDESCRICAO: TStringField;
    sqlAndamentoServicoSITUACAO: TStringField;
    dtsAndamentoServico: TDataSource;
    btnPesquisaPessoa: TcxButton;
    sqlAndamentoServicoTIPO: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ClientAncestralBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ClientAncestralCalcFields(DataSet: TDataSet);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtPesqProtocoloKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesqProtocoloKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure icxAndamentoServicoEnter(Sender: TObject);
    procedure edtPesqProtocoloEnter(Sender: TObject);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure ClientAncestralBeforeOpen(DataSet: TDataSet);
    procedure ClientAncestralAfterOpen(DataSet: TDataSet);
    procedure ExecuteCancelarExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteExcluirExecute(Sender: TObject);
    procedure btnPesquisaPessoaClick(Sender: TObject);
  private
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
    procedure HabilitarBotoes(vpHabilitado : Boolean);
  public
    vgAtoId : Integer;
    vgAtoCancelado : Boolean;
  end;

var
  frmAtoAndamento: TfrmAtoAndamento;

implementation

uses Controles, Lookup, AtoMostrarTextoLavrado;

{$R *.dfm}

procedure TfrmAtoAndamento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  sqlAndamentoServcoGeral.Active := False;
  sqlAndamentoServico.Active     := False;

  Action := caFree;
  frmAtoAndamento := nil;
end;

procedure TfrmAtoAndamento.HabilitarBotoes(vpHabilitado: Boolean);
begin

end;

procedure TfrmAtoAndamento.LoadData;
begin
  DataSetAncestral.ParamByName('ATO_ID').AsInteger := vgAtoId;
  ClientAncestral.Open;
  inherited;

end;

procedure TfrmAtoAndamento.SetState(AState: TDataSetState);
begin
  inherited;
  grdBasica.Enabled         := state = dsBrowse;
  PanelData.Visible         := state in [dsedit, dsInsert];
  gbxPainelPesquisa.Visible := state = dsBrowse;
end;

procedure TfrmAtoAndamento.ClientAncestralBeforePost(DataSet: TDataSet);
begin
  inherited;
  if State in [dsInsert] then
    ClientAncestral.FieldByName('ATO_ANDAMENTO_ID').AsCurrency := dtmControles.GerarSequencia('T_ATO_ANDAMENTO');
end;

procedure TfrmAtoAndamento.FormShow(Sender: TObject);
begin
  inherited;
  edtPesqProtocolo.SetFocus;
end;

procedure TfrmAtoAndamento.FormCreate(Sender: TObject);
begin
  inherited;
  sqlAndamentoServcoGeral.Connection := dtmControles.DB;
  sqlAndamentoServico.Connection     := dtmControles.DB;
  sqlAndamentoServcoGeral.Active     := True;
  sqlAndamentoServico.Active         := True;
end;

procedure TfrmAtoAndamento.ExecuteIncluirExecute(Sender: TObject);
begin
  if vgAtoCancelado then
  begin
    Application.MessageBox('Ato Cancelado. Alteração não permitida!!!','Informação', MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  ClientAncestral.AfterScroll := nil;
  inherited;
  ClientAncestralATO_ID.AsInteger         := vgAtoId;
  ClientAncestralDATA_ANDAMENTO.AsVariant := dtmControles.DataHoraBanco(3);
  ClientAncestralUSUARIO_ID.AsString      := vgUsuarioID;
end;

procedure TfrmAtoAndamento.ClientAncestralCalcFields(DataSet: TDataSet);
begin
  inherited;
  if ClientAncestralATO_ID.AsCurrency > 0 then
    ClientAncestralcalc_Protocolo.AsInteger := dtmControles.GetInt('SELECT PROTOCOLO FROM T_ATO WHERE ATO_ID = '+ ClientAncestralATO_ID.AsString);
end;

procedure TfrmAtoAndamento.btnPesquisarClick(Sender: TObject);
var
  viComplemento : String;
begin
  inherited;
  With ClientAncestral do
  begin
    Active := False;
    DataSetAncestral.CommandText := ' SELECT * '+
                                    ' FROM T_ATO_ANDAMENTO ';

    if edtPesqProtocolo.Text <> '' then
    begin
      cxGridBasicaDBProtocolo.Visible := False;
      PanelBotoesBasicos.Visible      := True;
      vgAtoId := dtmControles.GetInt('SELECT ATO_ID FROM T_ATO WHERE PROTOCOLO = '+ edtPesqProtocolo.Text);
      if vgAtoId > 0 then
      begin
         DataSetAncestral.CommandText := DataSetAncestral.CommandText +
                                          ' WHERE ATO_ID = '+ IntToStr(vgAtoId);
         edtOutorgante.Text := dtmControles.GetStr(' SELECT PESSOA_NOME FROM T_ATO_VINCULOPARTE '+
                                                   ' WHERE ORDEM = 1 AND TIPO_VINCULO = '+ QuotedStr('1') +' AND ATO_ID = '+ QuotedStr(IntToStr(vgAtoID)));
         edtOutorgado.Text  := dtmControles.GetStr(' SELECT PESSOA_NOME FROM T_ATO_VINCULOPARTE '+
                                                   ' WHERE ORDEM = 1 AND TIPO_VINCULO = '+ QuotedStr('2') + ' AND ATO_ID = '+QuotedStr(IntToStr(vgAtoID)));
      end
      else
      begin
        PanelBotoesBasicos.Visible := True;
        Application.MessageBox('Protocolo não encontrado!!!','Aviso', MB_ICONINFORMATION + MB_OK);
        edtPesqProtocolo.SetFocus;
        exit;
      end;
    end
    else
    begin
      vgAtoId := 0;
      cxGridBasicaDBProtocolo.Visible := True;
      PanelBotoesBasicos.Visible      := False;
      if icxAndamentoServico.Text <> '' then
        viComplemento := ' WHERE TB_ANDAMENTOSERVICO_ID = '+ IntToStr(icxAndamentoServico.EditValue);

      if lcxUsuario.Text <> '' then
        if viComplemento = '' then
             viComplemento := ' WHERE USUARIO_ID = '+ IntToStr(lcxUsuario.EditValue)
        else viComplemento := viComplemento + ' AND USUARIO_ID = '+ IntToStr(lcxUsuario.EditValue);

      DataSetAncestral.CommandText := DataSetAncestral.CommandText + viComplemento;
    end;

    DataSetAncestral.CommandText := DataSetAncestral.CommandText + ' ORDER BY ATO_ANDAMENTO_ID DESC ';
    Screen.Cursor := crHourGlass;
    Active := true;

    ExecutaSqlAuxiliar(' SELECT TIPO FROM T_TB_ANDAMENTOSERVICO '+
                       ' WHERE TB_ANDAMENTOSERVICO_ID = '+ClientAncestralTB_ANDAMENTOSERVICO_ID.AsString,0);
    vgAtoCancelado := dtmControles.sqlAuxiliar.FieldByName('TIPO').AsString = 'C';

    SetState(dsBrowse);
    Screen.Cursor := crDefault;
    grdBasica.SetFocus;
  end;
end;

procedure TfrmAtoAndamento.edtPesqProtocoloKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (not (Key in ['0'..'9', #8, #13])) then
  begin
    Key := #0;
    MessageBeep(MB_OK);
  end;
end;

procedure TfrmAtoAndamento.edtPesqProtocoloKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if key = 13 then
    btnPesquisarClick(self);
end;

procedure TfrmAtoAndamento.icxAndamentoServicoEnter(Sender: TObject);
begin
  inherited;
  edtPesqProtocolo.Clear;
end;

procedure TfrmAtoAndamento.edtPesqProtocoloEnter(Sender: TObject);
begin
  inherited;
  icxAndamentoServico.EditValue := Null;
  lcxUsuario.EditValue          := null;
end;

procedure TfrmAtoAndamento.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not (State in [dsInsert, dsEdit]) then
  begin
    edtOutorgante.Text := dtmControles.GetStr(' SELECT PESSOA_NOME FROM T_ATO_VINCULOPARTE '+
                                              ' WHERE ORDEM = 1 AND TIPO_VINCULO = '+ QuotedStr('1') +' AND ATO_ID = '+ QuotedStr(ClientAncestralATO_ID.AsString));
    edtOutorgado.Text  := dtmControles.GetStr(' SELECT PESSOA_NOME FROM T_ATO_VINCULOPARTE '+
                                              ' WHERE ORDEM = 1 AND TIPO_VINCULO = '+ QuotedStr('2') + ' AND ATO_ID = '+QuotedStr(ClientAncestralATO_ID.AsString));
  end;
end;

procedure TfrmAtoAndamento.ClientAncestralBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  ClientAncestral.AfterScroll := NIL;
end;

procedure TfrmAtoAndamento.ClientAncestralAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ClientAncestraL.AfterScroll := ClientAncestralAfterScroll;
end;

procedure TfrmAtoAndamento.ExecuteCancelarExecute(Sender: TObject);
begin
  inherited;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
end;

procedure TfrmAtoAndamento.ExecuteGravarExecute(Sender: TObject);
begin
  inherited;
  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
end;

procedure TfrmAtoAndamento.ExecuteAlterarExecute(Sender: TObject);
begin
  if vgUsuarioID <> ClientAncestralUSUARIO_ID.AsString then
  begin
    Application.MessageBox('Somente o usuário deste andamento pode alterar este registro!!!','Aviso', MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  if vgAtoCancelado then
  begin
    Application.MessageBox('Ato Cancelado. Alteração não permitida!!!','Informação', MB_ICONINFORMATION + MB_OK);
    exit;
  end;
  inherited;
end;

procedure TfrmAtoAndamento.ExecuteExcluirExecute(Sender: TObject);
begin
  if vgAtoCancelado then
  begin
    Application.MessageBox('Ato Cancelado. Alteração não permitida!!!','Informação', MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  if vgUsuarioID <> ClientAncestralUSUARIO_ID.AsString then
  begin
    Application.MessageBox('Somente o usuário deste andamento pode excluir este registro!!!','Aviso', MB_ICONINFORMATION + MB_OK);
    exit;
  end;

  inherited;

end;

procedure TfrmAtoAndamento.btnPesquisaPessoaClick(Sender: TObject);
begin
  inherited;
  vgAndamento.PesquisaAndamento := True;
  frmTextroLavrado := TfrmTextroLavrado.Create(self);
  frmTextroLavrado.ShowModal;

  if vgAndamento.ProtocoloId > 0 then
  begin
    edtPesqProtocolo.Text := IntToStr(vgAndamento.ProtocoloId);
    btnPesquisarClick(self);
  end;
  vgAndamento.ProtocoloId := 0;
end;

end.
