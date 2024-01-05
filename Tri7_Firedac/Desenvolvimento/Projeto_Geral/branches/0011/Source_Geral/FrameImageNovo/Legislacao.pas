unit Legislacao;

interface

uses
  I9Query, I9Connection, Winapi.Windows, Winapi.Messages, System.SysUtils,
  System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms,
  Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, cxPC, Vcl.Menus, Vcl.StdCtrls, cxButtons, Vcl.ExtCtrls,
  cxContainer, cxEdit, cxLabel, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Vcl.ComCtrls, dxCore,
  cxDateUtils, cxCalendar, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, Data.DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Data.FMTBcd, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr,
  cxRadioGroup, cxGroupBox, cxDBEdit, FrameEditorSimples, FlCtrlEx, {$WARN UNIT_PLATFORM OFF}
  Vcl.FileCtrl, {$WARN UNIT_PLATFORM ON}
  cxListView, ParamListbox, ColListb, FrameImagem, FramePDF, cxSplitter,
  cxDBLabel, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dxSkinsCore, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinscxPCPainter, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  dxPSPDFExportCore, dxPSPDFExport, cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv,
  dxPSPrVwRibbon, dxPScxPageControlProducer, dxPScxGridLnk,
  dxPScxGridLayoutViewLnk, dxPScxEditorProducers, dxPScxExtEditorProducers,
  dxPSCore, dxPScxCommon;

type
  TfrmLegislacao = class(TForm)
    pnlTopoCadastro: TPanel;
    btnGravar: TcxButton;
    btnCancelar: TcxButton;
    btnExcluir: TcxButton;
    btnIncluir: TcxButton;
    Panel1: TPanel;
    btnPesquisarTop: TcxButton;
    btnFechar: TcxButton;
    DataSetProvimento: TI9Query;
    ProviderProvimento: TDataSetProvider;
    ClientProvimento: TClientDataSet;
    SourceProvimento: TDataSource;
    ClientProvimentoPROVIMENTO_ID: TBCDField;
    ClientProvimentoPROVIMENTO_ESFERA_NIVEL_ID: TBCDField;
    ClientProvimentoPROVIMENTO_ORIGEM_ID: TBCDField;
    ClientProvimentoPROVIMENTO_TIPO_ID: TBCDField;
    ClientProvimentoNUMERO: TStringField;
    ClientProvimentoDATA: TSQLTimeStampField;
    ClientProvimentoASSUNTO: TStringField;
    ClientProvimentoTEXTO: TBlobField;
    btnAlterar: TcxButton;
    OpenDialog1: TOpenDialog;
    pagPrincipal: TcxPageControl;
    tbsPesquisa: TcxTabSheet;
    pnlPesquisaTopo: TPanel;
    cxLabel1: TcxLabel;
    lcxPesqEsferaNivel: TcxLookupComboBox;
    cxLabel2: TcxLabel;
    lcxPesqOrigem: TcxLookupComboBox;
    cxLabel3: TcxLabel;
    lcxPesqTipo: TcxLookupComboBox;
    cxLabel4: TcxLabel;
    edtPesqNumero: TcxTextEdit;
    cxLabel5: TcxLabel;
    edtPesqData: TcxDateEdit;
    cxLabel6: TcxLabel;
    edtPesqAssunto: TcxTextEdit;
    btnPesquisar: TcxButton;
    btnLimpar: TcxButton;
    gbxTipoBusca: TcxGroupBox;
    rbPesqExata: TcxRadioButton;
    rbPesqAproximada: TcxRadioButton;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    grdBasicaLevel1: TcxGridLevel;
    tbsCadastro: TcxTabSheet;
    PanelData: TPanel;
    pnlCadastro: TPanel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxPageControl1: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    Panel3: TPanel;
    cxTabSheet1: TcxTabSheet;
    fmeTexto: TfmeEditorSimples;
    ClientProvimentoNATUREZA_AREA: TStringField;
    cxLabel13: TcxLabel;
    edtPesqNaturezaArea: TcxTextEdit;
    cxLabel14: TcxLabel;
    pnlAnexar: TPanel;
    btnAnexarArquivo: TcxButton;
    pagArquivoAnexo: TcxPageControl;
    tbsImagem: TcxTabSheet;
    tbsPDF: TcxTabSheet;
    grdBasicaDBTableView1PROVIMENTO_ESFERA_NIVEL_ID: TcxGridDBColumn;
    grdBasicaDBTableView1PROVIMENTO_ORIGEM_ID: TcxGridDBColumn;
    grdBasicaDBTableView1PROVIMENTO_TIPO_ID: TcxGridDBColumn;
    grdBasicaDBTableView1NATUREZA_AREA: TcxGridDBColumn;
    grdBasicaDBTableView1NUMERO: TcxGridDBColumn;
    grdBasicaDBTableView1DATA: TcxGridDBColumn;
    grdBasicaDBTableView1ASSUNTO: TcxGridDBColumn;
    spl: TcxSplitter;
    fmePDF1: TfmePDF;
    ClientProvimentoDATA_INSERCAO: TSQLTimeStampField;
    grdBasicaDBTableView1DATA_INSERCAO: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    edtPesqDataInsercaoIni: TcxDateEdit;
    edtPesqDataInsercaoFim: TcxDateEdit;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    FileListBoxEx1: TFileListBoxEx;
    cxDBTextEdit1: TcxDBTextEdit;
    lcxEsferaNivel: TcxDBLookupComboBox;
    lcxOrigem: TcxDBLookupComboBox;
    lcxTipo: TcxDBLookupComboBox;
    edtNaturezaArea: TcxDBTextEdit;
    edtNumero: TcxDBTextEdit;
    edtData: TcxDBDateEdit;
    edtAssunto: TcxDBTextEdit;
    cxSplitter1: TcxSplitter;
    btnAdicionarEsferaNivel: TcxButton;
    btnAdicionarOrigem: TcxButton;
    btnAdicionarTipo: TcxButton;
    btnImprimirProtocolo: TcxButton;
    dxComponentPrinter1: TdxComponentPrinter;
    dxComponentPrinter1Link1: TdxGridReportLink;
    fmeImagem1: TfmeImagem;
    procedure btnFecharClick(Sender: TObject);
    procedure btnPesquisarTopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdBasicaDBTableView1DblClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAdicionarEsferaNivelClick(Sender: TObject);
    procedure btnAdicionarOrigemClick(Sender: TObject);
    procedure btnAdicionarTipoClick(Sender: TObject);
    procedure btnAnexarArquivoClick(Sender: TObject);
    procedure ClientProvimentoAfterScroll(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure ClientProvimentoAfterInsert(DataSet: TDataSet);
    procedure FileListBoxEx1Change(Sender: TObject);
    procedure fmePDF1btnZoomMaisClick(Sender: TObject);
    procedure pagArquivoAnexoPageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure pagPrincipalPageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure btnImprimirProtocoloClick(Sender: TObject);
  private
    { Private declarations }
    vlPermissao: string;
    vpLocalAnexosProvimento: string;
    State: TDataSetState;
    vlAlterando: Boolean;
    procedure SetState(AState: TDataSetState); virtual;
    procedure CheckState;
    procedure LoadData;
  public
    { Public declarations }
  end;

var
  frmLegislacao: TfrmLegislacao;

implementation

{$R *.dfm}
{$WARN SYMBOL_DEPRECATED OFF}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

uses
  Lookup, Controles, Rotinas, Cadastro;

procedure TfrmLegislacao.btnAdicionarEsferaNivelClick(Sender: TObject);
begin
  CadProvimentoEsferaNivel(True);
  dtmLookup.sqlProvimentoEsferaNivel.Refresh;
end;

procedure TfrmLegislacao.btnAdicionarOrigemClick(Sender: TObject);
begin
  CadProvimentoOrigem(True);
  dtmLookup.sqlProvimentoOrigem.Refresh;
end;

procedure TfrmLegislacao.btnAdicionarTipoClick(Sender: TObject);
begin
  CadProvimentoTipo(True);
  dtmLookup.sqlProvimentoTipo.Refresh;
end;

procedure TfrmLegislacao.btnAlterarClick(Sender: TObject);
begin
  VerificarPermissao(vlPermissao[2]);

  if State <> dsBrowse then
    Exit;

  pagPrincipal.ActivePage := tbsCadastro;
  ClientProvimento.Edit;
  SetState(dsEdit);
  lcxEsferaNivel.SetFocus;
end;

procedure TfrmLegislacao.btnCancelarClick(Sender: TObject);
begin
  if State = dsBrowse then
    Exit;

  ClientProvimento.Cancel;
  SetState(dsBrowse);
  ClientProvimentoAfterScroll(ClientProvimento);
end;

procedure TfrmLegislacao.btnExcluirClick(Sender: TObject);
begin
  VerificarPermissao(vlPermissao[3]);

  if State <> dsBrowse then
    Exit;

  dtmControles.StartTransaction;
  try
    if Application.MessageBox('Deseja realmente excluir este registro?', 'Confirmar', MB_ICONQUESTION + MB_YESNO) = IDYES then
    begin
      ClientProvimento.Delete;
      ClientProvimento.ApplyUpdates(-1);
      SetState(dsBrowse);
    end;
    dtmControles.Commit;
  except
    dtmControles.Rollback;
  end;
end;

procedure TfrmLegislacao.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLegislacao.btnGravarClick(Sender: TObject);

  procedure ValidarCampos;
  begin
    if (lcxEsferaNivel.EditValue = Null) or (Trim(lcxEsferaNivel.EditValue) = '') then
    begin
      Application.MessageBox('O campo Esfera/Nível é de preenchimento obrigatório!', 'Atenção!', MB_OK + MB_ICONWARNING);

      lcxEsferaNivel.SetFocus;
      Abort;
    end;

    if (lcxOrigem.EditValue = Null) or (Trim(lcxOrigem.EditValue) = '') then
    begin
      Application.MessageBox('O campo Origem é de preenchimento obrigatório!', 'Atenção!', MB_OK + MB_ICONWARNING);

      lcxOrigem.SetFocus;
      Abort;
    end;

    if (lcxTipo.EditValue = Null) or (Trim(lcxTipo.EditValue) = '') then
    begin
      Application.MessageBox('O campo Tipo é de preenchimento obrigatório!', 'Atenção!', MB_OK + MB_ICONWARNING);

      lcxTipo.SetFocus;
      Abort;
    end;

    if (edtNaturezaArea.EditValue = Null) or (Trim(edtNaturezaArea.EditValue) = '') then
    begin
      Application.MessageBox('O campo Natureza/Área é de preenchimento obrigatório!', 'Atenção!', MB_OK + MB_ICONWARNING);

      edtNaturezaArea.SetFocus;
      Abort;
    end;

    if (edtNumero.EditValue = Null) or (Trim(edtNumero.EditValue) = '') then
    begin
      Application.MessageBox('O campo Número é de preenchimento obrigatório!', 'Atenção!', MB_OK + MB_ICONWARNING);

      edtNumero.SetFocus;
      Abort;
    end;

    if (edtData.EditValue = Null) or (Trim(edtData.EditValue) = '') then
    begin
      Application.MessageBox('O campo Data é de preenchimento obrigatório!', 'Atenção!', MB_OK + MB_ICONWARNING);

      edtData.SetFocus;
      Abort;
    end;

    if (edtAssunto.EditValue = Null) or (Trim(edtAssunto.EditValue) = '') then
    begin
      Application.MessageBox('O campo Assunto é de preenchimento obrigatório!', 'Atenção!', MB_OK + MB_ICONWARNING);

      edtAssunto.SetFocus;
      Abort;
    end;

    if FileListBoxEx1.Count = 0 then
    begin
      if Application.MessageBox('É obrigatório anexar pelo menos um arquivo!' + #13#10 + 'Deseja anexar agora?', 'Atenção!', MB_YESNO + MB_ICONWARNING) = IDYES then
      begin
        btnAnexarArquivoClick(nil);
      end
      else
        Abort;
    end;
  end;

begin
  ValidarCampos;

  ClientProvimentoTEXTO.AsAnsiString := CompressString(fmeTexto.wptTexto.AsString);

  //Gravar
  dtmControles.StartTransaction;
  try
    ClientProvimento.Post;
    ClientProvimento.ApplyUpdates(-1);
    dtmControles.Commit;
  except
    dtmControles.Rollback;
  end;

  SetState(dsBrowse);
  ClientProvimentoAfterScroll(ClientProvimento);
end;

procedure TfrmLegislacao.btnImprimirProtocoloClick(Sender: TObject);
begin
  dxComponentPrinter1Link1.ReportTitle.Text := 'Dados da Pesquisa do Cadastro da Legislação';
  dxComponentPrinter1Link1.Preview(True);
end;

procedure TfrmLegislacao.btnIncluirClick(Sender: TObject);
begin
  VerificarPermissao(vlPermissao[1]);

  if State <> dsBrowse then
    Exit;

  pagPrincipal.ActivePage := tbsCadastro;
  ClientProvimento.Insert;
  SetState(dsInsert);

  fmeImagem1.LoadFromFile('');

  fmePDF1.vg_CaminhoDiretorio := '';
  fmePDF1.vg_NomeArquivo := '';
  fmePDF1.CarregarPDF;
  lcxEsferaNivel.SetFocus;
end;

procedure TfrmLegislacao.btnLimparClick(Sender: TObject);
begin
  lcxPesqEsferaNivel.EditValue := Null;
  lcxPesqOrigem.EditValue := Null;
  lcxPesqTipo.EditValue := Null;
  edtPesqNumero.Clear;
  edtPesqData.Clear;
  edtPesqAssunto.Clear;
end;

procedure TfrmLegislacao.btnPesquisarClick(Sender: TObject);
var
  viSql, viSqlComplemento, viWhere, viCondicao: string;
begin
  viSql := '';
  viSqlComplemento := '';
  viWhere := ' WHERE ';

  if rbPesqExata.Checked then
    viCondicao := ' = '
  else if rbPesqAproximada.Checked then
    viCondicao := ' CONTAINING ';

  if DataSetProvimento.State in [dsInsert, dsEdit] then
  begin
    Application.MessageBox('Existe um registro em edição, salve ou cancele antes de efetuar a pesquisa!', 'Aviso!', MB_OK + MB_ICONWARNING);

    Exit;
  end;

{  if
    (lcxPesqEsferaNivel.EditValue = Null) and
    (lcxPesqOrigem.EditValue = Null) and
    (lcxPesqTipo.EditValue = Null) and
    (edtPesqNaturezaArea.EditValue = Null) and
    (Trim(edtPesqNumero.Text) = '') and
    (edtPesqData.EditValue = Null) and
    (
      (edtPesqDataInsercaoIni.EditValue = Null) or
      (edtPesqDataInsercaoFim.EditValue = Null)
    ) and
    (Trim(edtPesqAssunto.Text) = '')
  then
  begin
    Application.MessageBox(
      'Informe pelo menos um campo para pesquisa!',
      'Atenção!',
      MB_OK + MB_ICONWARNING
    );
    Exit;
  end;   }

  viSql := ' SELECT * ' + ' FROM G_PROVIMENTO ';

  if lcxPesqEsferaNivel.EditValue <> Null then
  begin
    viSqlComplemento := viSqlComplemento + viWhere + 'PROVIMENTO_ESFERA_NIVEL_ID = ' + QuotedStr(lcxPesqEsferaNivel.EditValue);
    viWhere := ' AND ';
  end;

  if lcxPesqOrigem.EditValue <> Null then
  begin
    viSqlComplemento := viSqlComplemento + viWhere + 'PROVIMENTO_ORIGEM_ID = ' + QuotedStr(lcxPesqOrigem.EditValue);
    viWhere := ' AND ';
  end;

  if lcxPesqTipo.EditValue <> Null then
  begin
    viSqlComplemento := viSqlComplemento + viWhere + 'PROVIMENTO_TIPO_ID = ' + QuotedStr(lcxPesqTipo.EditValue);
    viWhere := ' AND ';
  end;

  if Trim(edtPesqNaturezaArea.Text) <> '' then
  begin
    viSqlComplemento := viSqlComplemento + viWhere + 'NATUREZA_AREA ' + viCondicao + QuotedStr(Trim(edtPesqAssunto.Text));
    viWhere := ' AND ';
  end;

  if Trim(edtPesqNumero.Text) <> '' then
  begin
    viSqlComplemento := viSqlComplemento + viWhere + 'NUMERO ' + viCondicao + QuotedStr(Trim(edtPesqNumero.Text));
    viWhere := ' AND ';
  end;

  if Trim(edtPesqData.Text) <> '' then
  begin
    viSqlComplemento := viSqlComplemento + viWhere + 'DATA = ' + QuotedStr(edtPesqData.EditValue);
    viWhere := ' AND ';
  end;

  if (Trim(edtPesqDataInsercaoIni.Text) <> '') and (Trim(edtPesqDataInsercaoFim.Text) <> '') then
  begin
    viSqlComplemento := viSqlComplemento + viWhere + 'DATA_INSERCAO ' + Controles.MontarSqlData(StrToDate(edtPesqDataInsercaoIni.Text), StrToDate(edtPesqDataInsercaoFim.Text));
    viWhere := ' AND ';
  end;

  if Trim(edtPesqAssunto.Text) <> '' then
  begin
    viSqlComplemento := viSqlComplemento + viWhere + 'ASSUNTO ' + viCondicao + QuotedStr(Trim(edtPesqAssunto.Text));
    viWhere := ' AND ';
  end;

  viSqlComplemento := viSqlComplemento + ' ORDER BY DATA ';

  ClientProvimento.Close;
  DataSetProvimento.SQL.Text := viSql + viSqlComplemento;
  ClientProvimento.Open;
end;

procedure TfrmLegislacao.btnAnexarArquivoClick(Sender: TObject);
var
  vlNomeArquivoCopiarServidor: string;
begin
  if Trim(vpLocalAnexosProvimento) = '' then
  begin
    Application.MessageBox('Parâmetro no SISTEMA DO CAIXA: OUTROS/PROVIMENTO/LOCAL_ANEXOS_PROVIMENTO não configurado!!!', 'ATENÇÃO!!!', MB_OK + MB_ICONSTOP + MB_DEFBUTTON2);
    Exit;
  end;

  vpLocalAnexosProvimento := IncludeTrailingPathDelimiter(vpLocalAnexosProvimento);

  //Verifica se o diretório existe no servidor, e se não existir cria
  if not DirectoryExists(vpLocalAnexosProvimento) then
    MkDir(vpLocalAnexosProvimento);

  if OpenDialog1.Execute then
  begin
    if FileExists(OpenDialog1.FileName) then
    begin
      vlNomeArquivoCopiarServidor := vpLocalAnexosProvimento + 'A_P_' + FormatFloat('000000', ClientProvimentoPROVIMENTO_ID.AsInteger) + '_' + ExtractFileName(OpenDialog1.FileName);

      if FileExists(vlNomeArquivoCopiarServidor) then
      begin
        Application.MessageBox('Já existe um arquivo com este nome anexado ao provimento!', 'Atenção!', MB_OK + MB_ICONWARNING);

        Exit;
      end;

      CopyFile(PChar(OpenDialog1.FileName), PChar(vlNomeArquivoCopiarServidor), True);

      FileListBoxEx1.Update;
    end;

  end;
end;

procedure TfrmLegislacao.btnPesquisarTopClick(Sender: TObject);
begin
  if btnGravar.Enabled then
  begin
    Application.MessageBox('Grave ou Cancele, antes de RETORNAR a Pesquisa!', 'Aviso', MB_OK + MB_ICONWARNING + MB_DEFBUTTON1);
    Exit;
  end;
  pagPrincipal.ActivePage := tbsPesquisa;
end;

procedure TfrmLegislacao.CheckState;
begin
  LockWindowUpdate(handle);
  btnIncluir.Enabled := (State = dsBrowse);
  if ClientProvimento.Active then
    btnAlterar.Enabled := ((State = dsBrowse) and (ClientProvimento.RecordCount > 0))
  else
    btnAlterar.Enabled := False;
  btnExcluir.Enabled := (btnAlterar.Enabled);
  btnPesquisarTop.Enabled := (State = dsBrowse);
  btnGravar.Enabled := State in [dsInsert, dsEdit];
  btnFechar.Enabled := not btnGravar.Enabled;
  btnCancelar.Enabled := btnGravar.Enabled;
  cxSplitter1.Enabled := not btnGravar.Enabled;
//  PanelData.Enabled       := (State in [dsInsert, dsEdit]);
  {$REGION 'CADASTRO'}
  pnlCadastro.Enabled := (State in [dsInsert, dsEdit]);
  pnlAnexar.Enabled := (State in [dsInsert, dsEdit]);
  fmeTexto.Enabled := (State in [dsInsert, dsEdit]);

  {$ENDREGION}

  LockWindowUpdate(0);

  if State in [dsInsert, dsEdit] then
    Tag := 1
  else
    Tag := 0;
end;

procedure TfrmLegislacao.ClientProvimentoAfterInsert(DataSet: TDataSet);
begin
  ClientProvimentoPROVIMENTO_ID.AsInteger := dtmControles.GerarSequencia('G_PROVIMENTO');
  ClientProvimentoDATA_INSERCAO.AsDateTime := dtmControles.DataHoraBanco(3);
end;

procedure TfrmLegislacao.ClientProvimentoAfterScroll(DataSet: TDataSet);
begin
  if vlAlterando then
    exit;

  FileListBoxEx1.Mask := 'A_P_' + FormatFloat('000000', ClientProvimentoPROVIMENTO_ID.AsInteger) + '_*';
  fmeTexto.wptTexto.AsString := DeCompressString(ClientProvimentoTEXTO.AsAnsiString);
end;

procedure TfrmLegislacao.FileListBoxEx1Change(Sender: TObject);
begin
  tbsImagem.TabVisible := True;
  tbsPDF.TabVisible := True;
  fmePDF1.vg_CaminhoDiretorio := '';
  fmePDF1.vg_NomeArquivo := '';
  fmePDF1.CarregarPDF;
  if (Trim(vpLocalAnexosProvimento) = '') or (not DirectoryExists(vpLocalAnexosProvimento)) then
  begin
    Application.MessageBox('Local de Imagens não configurado corretamente!', 'Erro', MB_OK + MB_ICONERROR + MB_DEFBUTTON1);
    Exit;
  end;

  if FileListBoxEx1.ItemIndex = -1 then
    if FileListBoxEx1.Items.Count > 0 then
      FileListBoxEx1.ItemIndex := 0
    else
    begin
      tbsImagem.TabVisible := False;
      tbsPDF.TabVisible := False;
      exit;
    end;

  vpLocalAnexosProvimento := IncludeTrailingPathDelimiter(vpLocalAnexosProvimento);

  if FileListBoxEx1.FileName <> '' then
  begin
    if ExtractFileExt(FileListBoxEx1.FileName) = '.pdf' then
    begin
      pagArquivoAnexo.ActivePage := tbsPDF;
      tbsImagem.TabVisible := False;
      tbsPDF.TabVisible := True;

      fmePDF1.vg_CaminhoDiretorio := '';
      fmePDF1.vg_NomeArquivo := FileListBoxEx1.FileName;
      fmePDF1.CarregarPDF;
    end
    else
    begin
      pagArquivoAnexo.ActivePage := tbsImagem;
      tbsImagem.TabVisible := True;
      tbsPDF.TabVisible := False;

      fmeImagem1.LoadFromFile(FileListBoxEx1.FileName, 0 , False);
    end;
  end;

end;

procedure TfrmLegislacao.fmePDF1btnZoomMaisClick(Sender: TObject);
begin
  fmePDF1.btnZoomMaisClick(Sender);

end;

procedure TfrmLegislacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not fmeImagem1.ValidateImage then
    Abort;

  if dtmLookup.sqlProvimentoEsferaNivel.Active then
    dtmLookup.sqlProvimentoEsferaNivel.Active := False;

  if dtmLookup.sqlProvimentoOrigem.Active then
    dtmLookup.sqlProvimentoOrigem.Active := False;

  if dtmLookup.sqlProvimentoTipo.Active then
    dtmLookup.sqlProvimentoTipo.Active := False;

  ClientProvimento.Close;

  frmLegislacao := nil;
  Action := caFree;
end;

procedure TfrmLegislacao.FormCreate(Sender: TObject);
begin
  vlPermissao := vgPermissaoRotina;

  DataSetProvimento.Connection := dtmControles.DB;

  if not dtmLookup.sqlProvimentoEsferaNivel.Active then
    dtmLookup.sqlProvimentoEsferaNivel.Active := True;

  if not dtmLookup.sqlProvimentoOrigem.Active then
    dtmLookup.sqlProvimentoOrigem.Active := True;

  if not dtmLookup.sqlProvimentoTipo.Active then
    dtmLookup.sqlProvimentoTipo.Active := True;

  ClientProvimento.Open;

  vpLocalAnexosProvimento := dtmControles.BuscarParametroOutroSistema('LOCAL_ANEXOS_PROVIMENTO', 'PROVIMENTO', 'OUTROS', '5');

  if DirectoryExists(vpLocalAnexosProvimento) then
    FileListBoxEx1.Directory := vpLocalAnexosProvimento
  else
    Application.MessageBox('Diretorio com arquivos não localizado!', 'Atenção', MB_OK + MB_ICONWARNING);

  pagPrincipal.ActivePage := tbsPesquisa;
end;

procedure TfrmLegislacao.FormShow(Sender: TObject);
begin
  if vgPermissaoRotina = '' then
    vlPermissao := '000000'
  else
    vlPermissao := vgPermissaoRotina;
  LoadData;
end;

procedure TfrmLegislacao.grdBasicaDBTableView1DblClick(Sender: TObject);
begin
  pagPrincipal.ActivePage := tbsCadastro;
end;

procedure TfrmLegislacao.SetState(AState: TDataSetState);
begin
  State := AState;
  CheckState;
  vlAlterando := AState in [dsEdit, dsInsert];
  if vlAlterando then
    cxSplitter1.OpenSplitter;

  tbsPesquisa.Enabled := AState in [dsBrowse];
end;

procedure TfrmLegislacao.LoadData;
begin
  State := dsBrowse;
  SetState(State);
end;

procedure TfrmLegislacao.pagArquivoAnexoPageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  AllowChange := fmeImagem1.ValidateImage;
end;

procedure TfrmLegislacao.pagPrincipalPageChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  AllowChange := fmeImagem1.ValidateImage;
  FileListBoxEx1Change(nil);
end;

end.

