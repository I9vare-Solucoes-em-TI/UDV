unit Minutas;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, FMTBcd, DB, DBClient, WPRTEEdit,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,

  cxEdit, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxSplitter, cxDropDownEdit, WPCTRRich, WPRTEDefs,
  WPCTRMemo, cxDBEdit, cxTextEdit, cxMaskEdit, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxContainer, cxLabel, Menus, SimpleDS,
  ImgList, FrameEditor, Buttons, cxGroupBox, cxImageComboBox,
  ClipBrd, System.Actions,
  cxRadioGroup, cxCheckBox, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator,
  cxDBData, DbxDevartInterBase, dxSkinsCore, dxSkinBlack, dxSkinLondonLiquidSky,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinscxPCPainter,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.Stan.StorageXML;

type
  
  TfrmMinutas = class(TfrmCadBasico)
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    lblTipoAto: TcxLabel;
    lcbNatureza: TcxDBLookupComboBox;
    lcxAtoModelo: TcxDBLookupComboBox;
    edtDescricao: TcxDBTextEdit;
    ImageList1: TImageList;
    sqlAtoTipo: TI9Query;
    sqlAtoTipoATO_TIPO_ID: TBCDField;
    sqlAtoTipoDESCRICAO: TStringField;
    sqlAtoTipoNATUREZA_ID: TBCDField;
    dtsAtoModelo: TDataSource;
    cxSplitter1: TcxSplitter;
    sqlAtoTipoTodos: TI9Query;
    FMTBCDField3: TBCDField;
    StringField1: TStringField;
    FMTBCDField4: TBCDField;
    dtsAtotipoTodos: TDataSource;
    lblTipo: TcxLabel;
    icxTipo: TcxImageComboBox;
    lblMinuta: TcxLabel;
    popExportar: TPopupMenu;
    ExportarMinutas1: TMenuItem;
    ImportarMinutas1: TMenuItem;
    DataSetProvider1: TDataSetProvider;
    dtsXmlAtualizador: TDataSource;
    sqlXmlAtualizador: TFDMemTable;
    sqlImportar: TI9Query;
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
    fmeEditor: TfmeEditor;
    LiberarTexto1: TMenuItem;
    cxLabel6: TcxLabel;
    icxInformarDoi: TcxDBImageComboBox;
    chbSituacao: TcxDBCheckBox;
    rdbAtivo: TcxRadioButton;
    rdbInativo: TcxRadioButton;
    rdbTodos: TcxRadioButton;
    FDStanStorageXMLLink1: TFDStanStorageXMLLink;
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
    procedure PesquisarMinutas(vpTexto : string = '');
  end;

var
  frmMinutas: TfrmMinutas;

implementation

uses ControleVariaveis, Controles, Math,
  Rotinas, Lookup, DateUtils, EditorTexto;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure TfrmMinutas.FormCreate(Sender: TObject);
begin
  inherited;
  case vgId of
    1 : LerConfigTexto('FICHA', 'LIVRO2_F1', 'FICHA', 'LIVRO2_F1');
    2 : LerConfigTexto('ATO','IMPRESSAO','EDITOR','MARGEM');
    7 : LerConfigTexto('CERTIDAO','GERAL','EDITOR','MARGEM');
    12: LerConfigTexto('EDITOR','GERAL','EDITOR','MARGEM');
  end;


  if vgId <> 20 then
  begin
    RedefinirPadraoFonte(fmeEditor.wptTexto);
  end;

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

  vlAtualizar := True;
end;

procedure TfrmMinutas.LoadData;
begin
  ClientAncestral.Close;
  case vgId of
   1 : begin
         DataSetAncestral.SQL.Text := ' SELECT MINUTA_ID, DESCRICAO, TIPO_REGISTRO, NATUREZA_ID, PROTEGIDA, SITUACAO '+
                                         ' FROM R_MINUTA '+
                                         ' ORDER BY DESCRICAO';
         lblTipoAto.Visible   := False;
         lcxAtoModelo.Visible := False;
         vlSigla_Sistema      := 'R';
       end;
   2 : begin
         DataSetAncestral.SQL.Text := ' SELECT MINUTA_ID, DESCRICAO, ATO_TIPO_ID, NATUREZA_ID, PROTEGIDA, SITUACAO '+
                                         ' FROM T_MINUTA '+
                                         ' ORDER BY DESCRICAO';
         sqlAtoTipo.Active      := True;
         sqlAtoTipoTodos.Active := True;
         lcxAtoModelo.DataBinding.DataField := 'ATO_TIPO_ID';
         lblTipoAto.Visible   := True;
         lcxAtoModelo.Visible := True;
         vlSigla_Sistema      := 'T';
       end;
   7, 12, 20: begin
         DataSetAncestral.SQL.Text := ' SELECT MINUTA_ID, DESCRICAO, NATUREZA_ID, PROTEGIDA, SITUACAO ';
         if vgId = 7 then
         begin
           DataSetAncestral.SQL.Text := DataSetAncestral.SQL.Text +  ' FROM D_MINUTA ';
           vlSigla_Sistema := 'D';
         end
         else
           if vgId = 12 then
           begin
             DataSetAncestral.SQL.Text := DataSetAncestral.SQL.Text +  ' FROM V_MINUTA ';
             vlSigla_Sistema := 'V';
           end
           else
           begin
             DataSetAncestral.SQL.Text := DataSetAncestral.SQL.Text +  ' FROM C_MINUTA ';
             vlSigla_Sistema := 'C';
           end;
         DataSetAncestral.SQL.Text := DataSetAncestral.SQL.Text + ' ORDER BY DESCRICAO';

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
var
  viAtualizarTexto : Boolean;
  viTexto : TStringStream;
begin
  VerificarPreenchimentoLCX_DB(lcbNatureza.Text, 'Natureza', lcbNatureza);
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descri��o', edtDescricao);

  if vlGravarTexto and not (State in [dsEdit, dsInsert]) then
    ClientAncestral.Edit;
  Marcacao_ApagarMarcacaoVazia(fmeEditor.wptTexto);

  if vgId in [1,12] then
    ClientAncestral.FieldByName('TIPO_REGISTRO').AsString := icxTipo.EditValue;

  viAtualizarTexto := PanelData.Enabled;
  inherited;

  viTexto := CompressStringStream(fmeEditor.wptTexto.AsString);
  ExecutaSqlAuxiliar(' UPDATE '+vlSigla_Sistema+'_MINUTA SET TEXTO = :TEXTO '+
                     ' WHERE MINUTA_ID = '+ClientAncestral.FieldByName('MINUTA_ID').AsString,2);
  dtmControles.sqlAuxiliar.ParamByName('TEXTO').LoadFromStream(viTexto, ftBlob);
  dtmControles.sqlAuxiliar.ExecSQL;
  FreeAndNil(viTexto);

  // Auditoria
  dtmControles.Auditoria(vlSigla_Sistema+'_MINUTA','Minutas', 'A',CompressString(fmeEditor.wptTexto.AsString),
                         ClientAncestral.FieldByName('MINUTA_ID').AsString,
                         'Altera��o da Minuta'+ lcbNatureza.Text +' - '+ edtDescricao.Text);
  vlGravarTexto       := False;
  cxSplitter1.Visible := True;
  cxSplitter1.OpenSplitter;

  ClientAncestral.DisableControls;
  ClientAncestral.AfterScroll := nil;

  try
    ClientAncestral.Refresh;
  finally
    ClientAncestral.EnableControls;
    ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  end;

  Application.ProcessMessages;
  if viAtualizarTexto then
   ClientAncestralAfterScroll(ClientAncestral);
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

  if vgId <> 20 then
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

procedure TfrmMinutas.PesquisarMinutas(vpTexto : string = '');
var
  viCondicao, viSituacao : String;
begin
  viCondicao := '';
  case vgId of
   1 : begin
         vlSql := ' SELECT MINUTA_ID, DESCRICAO, TIPO_REGISTRO, NATUREZA_ID, PROTEGIDA, SITUACAO '+vpTexto+
                  ' FROM R_MINUTA ';
       end;
   2 : begin
         vlSql := ' SELECT MINUTA_ID, DESCRICAO, ATO_TIPO_ID, NATUREZA_ID, PROTEGIDA, SITUACAO '+vpTexto+
                  ' FROM T_MINUTA ';
       end;
   7 : begin
         vlSql := ' SELECT MINUTA_ID, DESCRICAO, NATUREZA_ID, PROTEGIDA, SITUACAO '+vpTexto+
                  ' FROM D_MINUTA ';
       end;
   12: begin
         vlSql := ' SELECT MINUTA_ID, DESCRICAO, TIPO_REGISTRO, NATUREZA_ID, SITUACAO, PROTEGIDA '+vpTexto+
                  ' FROM V_MINUTA ';
       end;
   20: begin
         vlSql := ' SELECT MINUTA_ID, DESCRICAO, NATUREZA_ID, SITUACAO, PROTEGIDA '+vpTexto+
                  ' FROM C_MINUTA ';
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

  if vpTexto <> '' then
    exit;

  ClientAncestral.Active := False;
  DataSetAncestral.SQL.Text := vlSql + viCondicao + ' ORDER BY DESCRICAO';
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
      sqlAtoTipo.SQL.Text := ' SELECT A.ATO_TIPO_ID, A.DESCRICAO, LN.NATUREZA_ID '+
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

  PesquisarMinutas(', TEXTO');

  ExecutaSimpleDSAux(vlSql + ' ORDER BY DESCRICAO',0);

  dtmControles.SimpleAuxiliar.SaveToFile(ExtractFilePath(Application.ExeName) + vlSigla_Sistema + '_XML_MINUTAS.XML', sfXML);
  ShowMessage('Arquivo exportado com Sucesso.'+ (ExtractFilePath(Application.ExeName) + vlSigla_Sistema +'_XML_MINUTAS.XML'));
end;

procedure TfrmMinutas.ImportarMinutas1Click(Sender: TObject);

  function ExisteT_ATO_TIPO(vpAtoTipoId: Integer): Boolean;
  var
    viAtoTipoId: Integer;
  begin
    viAtoTipoId := dtmControles.GetInt(
      ' SELECT T_AT.ATO_TIPO_ID ' + sLineBreak +
      '   FROM T_ATO_TIPO T_AT ' + sLineBreak +
      '  WHERE T_AT.ATO_TIPO_ID = ' + IntToStr(vpAtoTipoId)
    );

    Result := viAtoTipoId = vpAtoTipoId;
  end;

var
  viInTransaction: Boolean;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  sqlXmlAtualizador.LoadFromFile(ExtractFilePath(Application.ExeName)+ vlSigla_Sistema + '_XML_MINUTAS.XML');
  sqlXmlAtualizador.Active := True;
  try
    viInTransaction := dtmControles.DB.InTransaction;
    try
      if not viInTransaction then
        dtmControles.DB.StartTransaction;

      if Application.MessageBox('Deseja excluir as minutas existentes?', 'Pergunta', MB_ICONQUESTION + MB_YESNO) = IDYES then
      begin
        sqlImportar.Active := False;
        sqlImportar.SQL.Text := ' DELETE FROM ' + vlSigla_Sistema + '_MINUTA ';
        sqlImportar.ExecSQL;
      end;

      sqlImportar.Active := False;
      sqlImportar.SQL.Text := ' SELECT * FROM ' + vlSigla_Sistema + '_MINUTA ';
      sqlImportar.Active := True;

      sqlXmlAtualizador.First;
      While not sqlXmlAtualizador.Eof do
      begin
        sqlImportar.Insert;

        sqlImportar.FieldByName('MINUTA_ID').AsInteger   := dtmControles.GerarSequencia('T_MINUTA');
        sqlImportar.FieldByName('DESCRICAO').AsString    := sqlXmlAtualizador.FieldByName('DESCRICAO').AsString;
        sqlImportar.FieldByName('NATUREZA_ID').AsInteger := sqlXmlAtualizador.FieldByName('NATUREZA_ID').AsInteger;
        sqlImportar.FieldByName('TEXTO').AsString        := sqlXmlAtualizador.FieldByName('TEXTO').AsString;

        if sqlXmlAtualizador.FieldDefs.IndexOf ('ATO_TIPO_ID') > -1 then
        begin
          if ExisteT_ATO_TIPO(sqlXmlAtualizador.FieldByName('ATO_TIPO_ID').AsInteger) then
            sqlImportar.FieldByName('ATO_TIPO_ID').Asvariant := sqlXmlAtualizador.FieldByName('ATO_TIPO_ID').Asvariant;
        end;

        if sqlXmlAtualizador.FieldDefs.IndexOf ('TIPO_REGISTRO') > -1 then
          sqlImportar.FieldByName('TIPO_REGISTRO').Asvariant := sqlXmlAtualizador.FieldByName('TIPO_REGISTRO').Asvariant;

        sqlImportar.FieldByName('PROTEGIDA').Asvariant := sqlXmlAtualizador.FieldByName('PROTEGIDA').Asvariant;
        sqlImportar.FieldByName('SITUACAO').AsString   := sqlXmlAtualizador.FieldByName('SITUACAO').AsString;
        sqlImportar.Post;

        sqlXmlAtualizador.Next;
      end;

      if not viInTransaction then
        dtmControles.DB.Commit;

    except
      on e: exception do
      begin
        if not viInTransaction then
          dtmControles.DB.Rollback;

        Application.MessageBox(Pchar('Erro ao importar as minutas' + sLineBreak + e.Message), 'Erro', MB_OK + MB_ICONERROR);
        Exit;
      end;
    end;

  finally
    PesquisarMinutas;
    Screen.Cursor := crDefault;
  end;

  ShowMessage('Minutas Importadas com Sucesso!!!');
end;

procedure TfrmMinutas.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not vgExecutarAferScrool then
    Exit;

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

      dtmControles.sqlAuxiliar.Active := False;
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
var
  viTextoLiberado: string;
begin
  inherited;
  viTextoLiberado := LiberarTextoAll(fmeEditor.wptTexto.AsString);

  if viTextoLiberado.IsEmpty then
    Exit;

  fmeEditor.wptTexto.Clear;
  fmeEditor.wptTexto.AsString := viTextoLiberado;

  if vgId <> 20 then
    ConfigurarMargemTexto(fmeEditor.wptTexto);
end;

end.


