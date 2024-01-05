unit Minutas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxSplitter, cxDropDownEdit, WPCTRRich, WPTbar, WPRuler, WPRTEDefs,
  WPCTRMemo, cxDBEdit, cxTextEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxContainer, cxLabel, Menus, SimpleDS,
  ImgList, FrameEditor, WPCTRStyleCol, Buttons, cxGroupBox, cxImageComboBox, WPRTEPaint, ClipBrd,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinBlack, dxSkinBlue, dxSkinCaramel,
  dxSkinCoffee, dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary,
  dxSkinLilian, dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin,
  dxSkinMoneyTwins, dxSkinOffice2007Black, dxSkinOffice2007Blue,
  dxSkinOffice2007Green, dxSkinOffice2007Pink, dxSkinOffice2007Silver,
  dxSkinPumpkin, dxSkinSilver, dxSkinStardust, dxSkinSummer2008,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCheckBox,
  cxRadioGroup;

type
  
  TfrmMinutas = class(TfrmCadBasico)
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    lblTipoAto: TcxLabel;
    lcbNatureza: TcxDBLookupComboBox;
    lcxAtoModelo: TcxDBLookupComboBox;
    edtDescricao: TcxDBTextEdit;
    ImageList1: TImageList;
    sqlAtoTipo: TSimpleDataSet;
    sqlAtoTipoATO_TIPO_ID: TFMTBCDField;
    sqlAtoTipoDESCRICAO: TStringField;
    sqlAtoTipoNATUREZA_ID: TFMTBCDField;
    dtsAtoModelo: TDataSource;
    cxSplitter1: TcxSplitter;
    sqlAtoTipoTodos: TSimpleDataSet;
    FMTBCDField3: TFMTBCDField;
    StringField1: TStringField;
    FMTBCDField4: TFMTBCDField;
    dtsAtotipoTodos: TDataSource;
    lblTipo: TcxLabel;
    icxTipo: TcxImageComboBox;
    lblMinuta: TcxLabel;
    popExportar: TPopupMenu;
    ExportarMinutas1: TMenuItem;
    ImportarMinutas1: TMenuItem;
    DataSetProvider1: TDataSetProvider;
    dtsXmlAtualizador: TDataSource;
    sqlXmlAtualizador: TClientDataSet;
    sqlImportar: TSimpleDataSet;
    PanelPesquisa: TPanel;
    cxGridBasica: TcxGrid;
    cxGridBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBDescricao: TcxGridDBColumn;
    cxGridBasicaLevel1: TcxGridLevel;
    gbxPesquisa: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtPesquisaCodigo: TcxTextEdit;
    edtDescricaoPesquisar: TcxTextEdit;
    cxLabel3: TcxLabel;
    lcbPesquisarNatureza: TcxLookupComboBox;
    cxGridBasicaDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridBasicaDBTableView1DBColumn2: TcxGridDBColumn;
    RichEdit1: TRichEdit;
    fmeEditor: TfmeEditor;
    LiberarTexto1: TMenuItem;
    cxLabel6: TcxLabel;
    icxInformarDoi: TcxDBImageComboBox;
    chbSituacao: TcxDBCheckBox;
    rdbAtivo: TcxRadioButton;
    rdbInativo: TcxRadioButton;
    rdbTodos: TcxRadioButton;
    sqlImportarMINUTA_ID: TFMTBCDField;
    sqlImportarATO_TIPO_ID: TFMTBCDField;
    sqlImportarNATUREZA_ID: TFMTBCDField;
    sqlImportarDESCRICAO: TStringField;
    sqlImportarTEXTO: TBlobField;
    sqlImportarPROTEGIDA: TStringField;
    sqlImportarSITUACAO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ClientAncestralBeforePost(DataSet: TDataSet);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteCancelarExecute(Sender: TObject);
    procedure fmeEditorchkShowMarcacaoInternaClick(Sender: TObject);
    procedure fmeEditormniDicionarioGramaticalClick(Sender: TObject);
    procedure fmeEditormniMarcacaoAutomaticaClick(Sender: TObject);
    procedure edtPesquisaCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure edtPesquisaCodigoPropertiesChange(Sender: TObject);
    procedure lcxDescricaoEnter(Sender: TObject);
    procedure estedeGramtica1Click(Sender: TObject);
    procedure ExecuteExcluirExecute(Sender: TObject);
    procedure lcbNaturezaPropertiesEditValueChanged(Sender: TObject);
    procedure ClientAncestralBeforeDelete(DataSet: TDataSet);
    procedure PadronizarFonteeTamanho1Click(Sender: TObject);
    procedure ExportarMinutas1Click(Sender: TObject);
    procedure ImportarMinutas1Click(Sender: TObject);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure edtDescricaoPesquisarPropertiesChange(Sender: TObject);
    procedure lcbPesquisarNaturezaPropertiesEditValueChanged(
      Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LiberarTexto1Click(Sender: TObject);
    procedure fmeEditorwptTextoKeyPress(Sender: TObject; var Key: Char);
    procedure rdbAtivoClick(Sender: TObject);
  private
    vlGravarTexto, vlAtualizar : Boolean;
    vlSql : String;
    vlSigla_Sistema : String;
  public
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
    procedure PesquisarMinutas;
  end;

var
  frmMinutas: TfrmMinutas;

implementation

uses ControleVariaveis, Controles, Math, MarcacaoAutomatica,
  TipoVinculoGramatical, PalavraGramatical, Rotinas, Lookup, Cadastro,
  EditorTexto, DateUtils;

{$R *.dfm}

procedure TfrmMinutas.FormCreate(Sender: TObject);
begin
  inherited;
  case vgId of
    1 : LerConfigTexto('FICHA', 'LIVRO2_F1', 'FICHA', 'LIVRO2_F1');
    2 : LerConfigTexto('ATO','IMPRESSAO','EDITOR','MARGEM');
    7 : LerConfigTexto('CERTIDAO','GERAL','EDITOR','MARGEM');
    12: LerConfigTexto('EDITOR','GERAL','EDITOR','MARGEM');
  end;

  fmeEditor.AtivarCorretorOrtografico;
  sqlAtoTipo.Connection       := dtmControles.DB;
  sqlAtoTipoTodos.Connection  := dtmControles.DB;

  if vgId = 1 then
  begin
    lblTipo.Visible := True;
    icxTipo.Visible := True;
  end
  else
  begin
    lblTipo.Visible := False;
    icxTipo.Visible := False;
  end;

  RedefinirPadraoFonte(fmeEditor.wptTexto);
  vlAtualizar := True;
end;

procedure TfrmMinutas.LoadData;
begin
  ClientAncestral.Close;
  case vgId of
   1 : begin
         DataSetAncestral.CommandText := ' SELECT MINUTA_ID, DESCRICAO, TIPO_REGISTRO, NATUREZA_ID, SITUACAO '+
                                         ' FROM R_MINUTA '+
                                         ' ORDER BY DESCRICAO';
         lblTipoAto.Visible   := False;
         lcxAtoModelo.Visible := False;
         vlSigla_Sistema      := 'R';
       end;
   2 : begin
         DataSetAncestral.CommandText := ' SELECT MINUTA_ID, DESCRICAO, ATO_TIPO_ID, NATUREZA_ID, PROTEGIDA, SITUACAO '+
                                         ' FROM T_MINUTA '+
                                         ' ORDER BY DESCRICAO';
         sqlAtoTipo.Active      := True;
         sqlAtoTipoTodos.Active := True;
         lcxAtoModelo.DataBinding.DataField := 'ATO_TIPO_ID';
         lblTipoAto.Visible   := True;
         lcxAtoModelo.Visible := True;
         vlSigla_Sistema      := 'T';
       end;
   7, 12: begin
         DataSetAncestral.CommandText := ' SELECT MINUTA_ID, DESCRICAO, NATUREZA_ID, PROTEGIDA, SITUACAO ';
         if vgId = 7 then
         begin
           DataSetAncestral.CommandText := DataSetAncestral.CommandText +  ' FROM D_MINUTA ';
           vlSigla_Sistema := 'D';
         end
         else
         begin
           DataSetAncestral.CommandText := DataSetAncestral.CommandText +  ' FROM V_MINUTA ';
           vlSigla_Sistema := 'V';
         end;
         DataSetAncestral.CommandText := DataSetAncestral.CommandText + ' ORDER BY DESCRICAO';

         lblTipoAto.Visible   := False;
         lcxAtoModelo.Visible := False;
       end;
  end;
  ClientAncestral.Open;
  inherited;
  PesquisarMinutas;  
end;

procedure TfrmMinutas.SetState(AState: TDataSetState);
begin
  inherited;
  if not vlGravarTexto then
  begin
    PanelData.Visible               := not cxBtnIncluir.Enabled;
    fmeEditor.wptTexto.Enabled      := not PanelData.Enabled;
    fmeEditor.PanelMarcacao.Enabled := not PanelData.Enabled;
    cxSplitter1.Visible             := not PanelData.Enabled;
  end;
  cxSplitter1.Visible   := not PanelData.Enabled;
end;

procedure TfrmMinutas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  sqlAtoTipo.Active      := False;
  sqlAtoTipoTodos.Active := False;

  Action     := caFree;
  frmMinutas := nil;
end;

procedure TfrmMinutas.ExecuteGravarExecute(Sender: TObject);
begin
  VerificarPreenchimentoLCX_DB(lcbNatureza.Text, 'Natureza', lcbNatureza);
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descri��o', edtDescricao);

  if vlGravarTexto and not (State in [dsEdit, dsInsert]) then
    ClientAncestral.Edit;
  Marcacao_ApagarMarcacaoVazia(fmeEditor.wptTexto);

  if vgId in [1,12] then
    ClientAncestral.FieldByName('TIPO_REGISTRO').AsString := icxTipo.EditValue;

  inherited;

  ExecutaSqlAuxiliar(' UPDATE '+vlSigla_Sistema+'_MINUTA SET TEXTO = :TEXTO '+
                     ' WHERE MINUTA_ID = '+ClientAncestral.FieldByName('MINUTA_ID').AsString,2);
  dtmControles.sqlAuxiliar.ParamByName('TEXTO').AsBlob := CompressString(fmeEditor.wptTexto.AsString);
  dtmControles.sqlAuxiliar.ExecSQL(FALSE);

  // Auditoria
  dtmControles.Auditoria(vlSigla_Sistema+'_MINUTA','Minutas', 'A',CompressString(fmeEditor.wptTexto.AsString),
                         ClientAncestral.FieldByName('MINUTA_ID').AsString,
                         'Altera��o da Minuta'+ lcbNatureza.Text +' - '+ edtDescricao.Text);
  vlGravarTexto       := False;
  cxSplitter1.Visible := True;
  cxSplitter1.OpenSplitter;

  ClientAncestral.Refresh;
end;

procedure TfrmMinutas.ExecuteIncluirExecute(Sender: TObject);
begin
  lblMinuta.Caption           := '';
  fmeEditor.wptTexto.AsString := '';
  cxSplitter1.CloseSplitter;
  cxSplitter1.Visible := False;
  inherited;
  if not vlGravarTexto then
    lcbNatureza.SetFocus;
  ConfigurarMargemTexto(fmeEditor.wptTexto);
  ClientAncestral.FieldByName('SITUACAO').AsString := 'A';
end;

procedure TfrmMinutas.ClientAncestralBeforePost(DataSet: TDataSet);
begin
  inherited;
  if State in [dsInsert] then
    ClientAncestral.FieldByName('MINUTA_ID').AsCurrency := dtmControles.GerarSequencia(vlSigla_Sistema+'_MINUTA');
end;

procedure TfrmMinutas.ExecuteAlterarExecute(Sender: TObject);
begin
  cxSplitter1.CloseSplitter;
  cxSplitter1.Visible := False;
  inherited;
  lcbNaturezaPropertiesEditValueChanged(SELF);
  if not vlGravarTexto then
    edtDescricao.SetFocus;
end;

procedure TfrmMinutas.ExecuteCancelarExecute(Sender: TObject);
begin
  inherited;
  cxSplitter1.Visible := True;
  cxSplitter1.OpenSplitter;

  if ClientAncestral.FieldByName('NATUREZA_ID').AsCurrency > 0 then
  begin
    ClientAncestralAfterScroll(ClientAncestral);
    if vgId in [1,12] then
      icxTipo.EditValue := ClientAncestral.FieldByName('TIPO_REGISTRO').AsString;
  end;
  vlGravarTexto       := False;
end;

procedure TfrmMinutas.fmeEditorchkShowMarcacaoInternaClick(
  Sender: TObject);
begin
  inherited;
  fmeEditor.chkShowMarcacaoInternaClick(Sender);
end;

procedure TfrmMinutas.fmeEditormniDicionarioGramaticalClick(
  Sender: TObject);
begin
  inherited;
  if vgId = 2 then
    vgMarcacaoAutoGrupo := 'GLOBAL';
  fmeEditor.actMarcacaoAutomaticaExecute(Sender);
end;

procedure TfrmMinutas.fmeEditormniMarcacaoAutomaticaClick(Sender: TObject);
begin
  inherited;
  fmeEditor.actMarcacaoManualExecute(Sender);

end;

procedure TfrmMinutas.fmeEditorwptTextoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  fmeEditor.wptTextoKeyPress(Sender, Key);
  if not ClientAncestral.IsEmpty then
  begin
    vlGravarTexto := True;
    ExecuteAlterarExecute(self);
    fmeEditor.wptTexto.AutoZoom := wpAutoZoomWidth;
  end;
end;

procedure TfrmMinutas.PesquisarMinutas;
var
  viCondicao, viSituacao : String;
begin
  viCondicao := '';
  case vgId of
   1 : begin
         vlSql := ' SELECT MINUTA_ID, DESCRICAO, TIPO_REGISTRO, NATUREZA_ID, SITUACAO '+
                  ' FROM R_MINUTA ';
       end;
   2 : begin
         vlSql := ' SELECT MINUTA_ID, DESCRICAO, ATO_TIPO_ID, NATUREZA_ID, PROTEGIDA, SITUACAO '+
                  ' FROM T_MINUTA ';
       end;
   7 : begin
         vlSql := ' SELECT MINUTA_ID, DESCRICAO, NATUREZA_ID, PROTEGIDA, SITUACAO '+
                  ' FROM D_MINUTA ';
       end;
   12: begin
         vlSql := ' SELECT MINUTA_ID, DESCRICAO, TIPO_REGISTRO, NATUREZA_ID, SITUACAO, PROTEGIDA '+
                  ' FROM V_MINUTA ';
       end;
  end;

  if Trim(edtPesquisaCodigo.Text) <> '' then
    viCondicao := ' WHERE MINUTA_ID = ' + edtPesquisaCodigo.Text;

  if Trim(edtDescricaoPesquisar.Text) <> '' then
    viCondicao := ' WHERE DESCRICAO LIKE ' + QuotedStr(edtDescricaoPesquisar.Text+'%');

  if Trim(lcbPesquisarNatureza.Text) <> '' then
    if viCondicao = '' then
         viCondicao := ' WHERE NATUREZA_ID = ' + IntToStr(lcbPesquisarNatureza.EditValue)
    else viCondicao := viCondicao + ' AND NATUREZA_ID = ' + IntToStr(lcbPesquisarNatureza.EditValue);

  if (rdbAtivo.Checked) or (rdbInativo.Checked) then
  begin
    if rdbAtivo.Checked then
         viSituacao := 'A'
    else viSituacao := 'I';

    if viCondicao = '' then
         viCondicao := ' WHERE SITUACAO = '+QuotedStr(viSituacao)
    else viCondicao := viCondicao + ' AND SITUACAO = '+QuotedStr(viSituacao);
  end;

  ClientAncestral.Active := False;
  DataSetAncestral.CommandText := vlSql + viCondicao + ' ORDER BY DESCRICAO';
  ClientAncestral.Active := True;

  if not ClientAncestral.IsEmpty then
    ClientAncestralAfterScroll(ClientAncestral);
  inherited;
end;

procedure TfrmMinutas.rdbAtivoClick(Sender: TObject);
begin
  inherited;
  PesquisarMinutas;
end;

procedure TfrmMinutas.edtPesquisaCodigoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  digitainteiro(Key);
end;

procedure TfrmMinutas.edtPesquisaCodigoPropertiesChange(Sender: TObject);
begin
  inherited;
  edtDescricaoPesquisar.Clear;
  PesquisarMinutas;
end;

procedure TfrmMinutas.lcxDescricaoEnter(Sender: TObject);
begin
  inherited;
  if edtPesquisaCodigo.Text <> '' then
  begin
    edtPesquisaCodigo.Clear;
    PesquisarMinutas;
  end;
end;

procedure TfrmMinutas.estedeGramtica1Click(Sender: TObject);
var
  viOk       : boolean;
  viTempList : TWPTextObjList;
  i : integer;

  procedure IniciarBusca;
  begin
    frmEditorTexto.fmeEditor.wptTexto.HideSelection;
    viOk := False;

    // Avan�a para a pr�xima marca��o
    frmEditorTexto.fmeEditor.wptTexto.CPMoveNext;
    repeat
      viTempList := TWPTextObjList.Create;
      if i = 1 then
           frmEditorTexto.fmeEditor.wptTexto.OpenCodesAtCP(viTempList,wpobjHyperlink)
      else frmEditorTexto.fmeEditor.wptTexto.OpenCodesAtCP(viTempList,wpobjBookmark);
      frmEditorTexto.fmeEditor.wptTexto.CPMoveNext;
    until viTempList.Count = 0;
  end;

begin
  inherited;
  ExibirFormulario(TfrmEditorTexto, frmEditorTexto);
  frmEditorTexto.pnlDados.Visible := true;
  with frmEditorTexto do
  begin
    lblInformacao.Caption := 'Minuta de '+ edtDescricao.Text +' - Teste da Gram�tica da Minuta';
    with fmeEditor do
    begin
      wptTexto.AsString := frmMinutas.fmeEditor.wptTexto.AsString;
      wptTexto.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
      wptTexto.SelectAll;
      wptTexto.CurrAttr.DeleteStyle([ afsProtected ]);
      wptTexto.HideSelection;
    end;
  end;
end;

procedure TfrmMinutas.ExecuteExcluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralAfterScroll(ClientAncestral);
  SetState(dsBrowse);
end;

procedure TfrmMinutas.lcbNaturezaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if vgId = 2 then
  begin
    if (State in [dsEdit, dsInsert]) and (lcbNatureza.EditValue > 0) then
    begin
      sqlAtoTipo.Active := False;
      sqlAtoTipo.DataSet.CommandText := ' SELECT A.ATO_TIPO_ID, A.DESCRICAO, LN.NATUREZA_ID '+
                                        ' FROM T_ATO_TIPO A, T_LIVRO_NATUREZA LN '+
                                        ' WHERE A.LIVRO_NATUREZA_ID = LN.LIVRO_NATUREZA_ID '+
                                        '   AND LN.NATUREZA_ID = '+ IntToStr(lcbNatureza.EditValue)+
                                        ' ORDER BY A.DESCRICAO ';
      sqlAtoTipo.Active := True;
      lcxAtoModelo.Enabled := True;
    end;
  end;
end;

procedure TfrmMinutas.ClientAncestralBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  // Auditoria
  dtmControles.Auditoria(vlSigla_Sistema+'_MINUTA','Minutas', 'E','',
                         ClientAncestral.FieldByName('MINUTA_ID').AsString,
                         'Exclus�o da Minuta'+ lcbNatureza.Text +' - '+ edtDescricao.Text);
end;

procedure TfrmMinutas.PadronizarFonteeTamanho1Click(Sender: TObject);
begin
  inherited;
  RedefinirPadraoFonte(fmeEditor.wptTexto, False, True);
end;

procedure TfrmMinutas.ExportarMinutas1Click(Sender: TObject);
begin
  inherited;
  if Application.MessageBox('Exportando Minutas para Arquivo XML. Confirma?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;
  ClientAncestral.ApplyUpdates(-1);

  if vgId = 2 then
  begin
    ExecutaSimpleDSAux(' SELECT MINUTA_ID, DESCRICAO, ATO_TIPO_ID, NATUREZA_ID, TEXTO, PROTEGIDA, SITUACAO '+
                       ' FROM T_MINUTA '+
                       ' ORDER BY DESCRICAO',0);
    dtmControles.SimpleAuxiliar.SaveToFile(ExtractFilePath(Application.ExeName) + 'XML_MINUTAS.XML', dfXMLUTF8);
    ShowMessage('Arquivo exportado com Sucesso.'+ (ExtractFilePath(Application.ExeName) + 'XML_MINUTAS.XML'));
  end;
end;

procedure TfrmMinutas.ImportarMinutas1Click(Sender: TObject);
begin
  inherited;
  Screen.Cursor := crHourGlass;
  sqlXmlAtualizador.LoadFromFile(ExtractFilePath(Application.ExeName)+'XML_MINUTAS.XML');
  sqlXmlAtualizador.Active := True;

  sqlImportar.Active := True;
  sqlXmlAtualizador.First;
  While not sqlXmlAtualizador.Eof do
  begin
    try
      sqlImportar.Insert;
      sqlImportarMINUTA_ID.AsInteger   := sqlXmlAtualizador.FieldByName('MINUTA_ID').AsInteger;
      sqlImportarDESCRICAO.AsString    := sqlXmlAtualizador.FieldByName('DESCRICAO').AsString;
      sqlImportarNATUREZA_ID.AsInteger := sqlXmlAtualizador.FieldByName('NATUREZA_ID').AsInteger;
      sqlImportarTEXTO.AsString        := sqlXmlAtualizador.FieldByName('TEXTO').AsString;
      sqlImportarATO_TIPO_ID.Asvariant := sqlXmlAtualizador.FieldByName('ATO_TIPO_ID').Asvariant;
      sqlImportarPROTEGIDA.Asvariant   := sqlXmlAtualizador.FieldByName('PROTEGIDA').Asvariant;
      sqlImportarSITUACAO.AsString     := sqlXmlAtualizador.FieldByName('SITUACAO').AsString;
      sqlImportar.ApplyUpdates(-1);
      sqlXmlAtualizador.Next;
    except
      sqlXmlAtualizador.Next;
    end;
  end;
  PesquisarMinutas;
  Screen.Cursor := crDefault;
  ShowMessage('Minutas Importadas com Sucesso!!!');
end;

procedure TfrmMinutas.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if ClientAncestral.FieldByName('MINUTA_ID').AsInteger > 0 then
  begin
    if (State = dsBrowse) and (cxSplitter1.Visible) then
    begin
      ExecutaSqlAuxiliar(' SELECT TEXTO '+
                         ' FROM '+ vlSigla_Sistema+'_MINUTA '+
                         ' WHERE MINUTA_ID = '+ClientAncestral.FieldByName('MINUTA_ID').AsString,0);

      fmeEditor.wptTexto.AsString := DeCompressString(dtmControles.sqlAuxiliar.FieldByName('TEXTO').AsString);
      if vgId in [1,12] then
        icxTipo.EditValue := ClientAncestral.FieldByName('TIPO_REGISTRO').AsString;
      lblMinuta.Caption := ClientAncestral.FieldByName('MINUTA_ID').AsString +' - '+ ClientAncestral.FieldByName('DESCRICAO').AsString;
      vlAtualizar := False;
    end;
  end;
end;

procedure TfrmMinutas.edtDescricaoPesquisarPropertiesChange(
  Sender: TObject);
begin
  inherited;
  edtPesquisaCodigo.Clear;
  PesquisarMinutas;
end;

procedure TfrmMinutas.lcbPesquisarNaturezaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  PesquisarMinutas;
end;

procedure TfrmMinutas.FormShow(Sender: TObject);
begin
  inherited;
  if vlAtualizar then
    ClientAncestralAfterScroll(ClientAncestral);
end;

procedure TfrmMinutas.LiberarTexto1Click(Sender: TObject);
begin
  inherited;
  fmeEditor.wptTexto.CopyToClipboard(true);
  fmeEditor.wptTexto.Clear;

  RichEdit1.Clear;
  RichEdit1.PasteFromClipboard;
  RichEdit1.SelectAll;
  RichEdit1.CopyToClipboard;

  fmeEditor.wptTexto.PasteFromClipboard;
  ConfigurarMargemTexto(fmeEditor.wptTexto);
end;

end.


