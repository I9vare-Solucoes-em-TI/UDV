unit MarcacaoTipo;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,

  cxEdit, WPCTRRich, WPRTEDefs, WPCTRMemo,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxSplitter, cxTextEdit,
  cxDBEdit, cxContainer, cxLabel, cxImageComboBox, cxCheckBox, Menus,
  cxMaskEdit, cxDropDownEdit,
  FrameEditor, cxGroupBox,
  Data.DBXInterBase, SimpleDS, System.Actions, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, DbxDevartInterBase, dxSkinsCore,
  dxSkinCaramel, dxSkinCoffee, dxSkiniMaginary, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinscxPCPainter, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmMarcacaoTipo = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    chbSituacao: TcxDBCheckBox;
    lblInfoMarcacaoInterna: TcxLabel;
    cxLabel5: TcxLabel;
    ClientAncestralMARCACAO_TIPO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralTEXTO: TBlobField;
    ClientAncestralNOME: TStringField;
    ClientAncestralGRUPO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralSISTEMA_ID: TBCDField;
    ClientAncestralTIPO_QUALIFICACAO: TStringField;
    ClientAncestralGRUPO_TIPO: TStringField;
    Shape1: TShape;
    Panel1: TPanel;
    cxGridBasica: TcxGrid;
    cxGridBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBNome: TcxGridDBColumn;
    cxGridBasicaDBDescricao: TcxGridDBColumn;
    cxGridBasicaDBTipo: TcxGridDBColumn;
    cxGridBasicaDBTipoQualificacao: TcxGridDBColumn;
    cxGridBasicaDBSituacao: TcxGridDBColumn;
    cxGridBasicaDBGrupo: TcxGridDBColumn;
    cxGridBasicaLevel1: TcxGridLevel;
    splGrdBasica: TcxSplitter;
    pnlMarcacaoValor: TPanel;
    lblTabela: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    cbxTabela: TcxComboBox;
    cbxCampo: TcxComboBox;
    btnMarcacaoValor: TcxButton;
    chkShowMarcacaoInterna: TCheckBox;
    cbxMascara: TcxImageComboBox;
    cxLabel6: TcxLabel;
    lblcondicaoSql: TcxLabel;
    gbxSeparadores: TcxGroupBox;
    lblSeparadorMeio: TcxLabel;
    cxLabel9: TcxLabel;
    lblSeparadorFinal: TcxLabel;
    edtSeparadorMeio: TcxDBTextEdit;
    edtSeparadorPre: TcxDBTextEdit;
    edtSeparadorFinal: TcxDBTextEdit;
    edtNome: TcxDBTextEdit;
    cbxGrupoValor: TcxComboBox;
    edtDescricao: TcxDBTextEdit;
    icxTipoGrupo: TcxDBImageComboBox;
    cbxTipoValor: TcxDBImageComboBox;
    icxTipoQualificacao: TcxDBImageComboBox;
    edtCondicaoSql: TcxDBTextEdit;
    Label1: TLabel;
    cbxCampoID: TcxComboBox;
    ClientAncestralTIPO_VALOR: TStringField;
    cxGridBasicaDBcodigo: TcxGridDBColumn;
    fmeEditor: TfmeEditor;
    RetirarAgrupamentodeMascara: TMenuItem;
    mniAgruparMascaras: TMenuItem;
    ClientAncestralPROTEGIDA: TStringField;
    cxDBCheckBox1: TcxDBCheckBox;
    popDuplicar: TPopupMenu;
    actDuplicarItem: TMenuItem;
    sqlDuplicar: TI9Query;
    sqlDuplicarMARCACAO_TIPO_ID: TBCDField;
    sqlDuplicarDESCRICAO: TStringField;
    sqlDuplicarTEXTO: TBlobField;
    sqlDuplicarNOME: TStringField;
    sqlDuplicarGRUPO: TStringField;
    sqlDuplicarSITUACAO: TStringField;
    sqlDuplicarSISTEMA_ID: TBCDField;
    sqlDuplicarGRUPO_TIPO: TStringField;
    sqlDuplicarTIPO_QUALIFICACAO: TStringField;
    sqlDuplicarCONDICAO_SQL: TStringField;
    sqlDuplicarSEPARADOR_1: TStringField;
    sqlDuplicarSEPARADOR_2: TStringField;
    sqlDuplicarSEPARADOR_3: TStringField;
    sqlDuplicarTIPO_VALOR: TStringField;
    sqlDuplicarATUALIZAR: TStringField;
    sqlDuplicarPROTEGIDA: TStringField;
    cxDBCheckBox2: TcxDBCheckBox;
    ClientAncestralATIVAR_SEPARADOR: TStringField;
    ClientAncestralSEPARADOR_1: TStringField;
    ClientAncestralSEPARADOR_2: TStringField;
    ClientAncestralSEPARADOR_3: TStringField;
    btnAtualiza: TcxButton;
    gbxBuscarMarcacao: TcxGroupBox;
    btnBuscarMarcacao: TcxButton;
    EdtBuscar: TcxTextEdit;
    ClientAncestralCONDICAO_SQL: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteCancelarExecute(Sender: TObject);
    procedure btnMarcacaoValorClick(Sender: TObject);
    procedure cbxMascaraPropertiesChange(Sender: TObject);
    procedure fmeEditorSimpleswptTextoChangeCursorPos(Sender: TObject);
    procedure cbxCampoPropertiesChange(Sender: TObject);
    procedure edtNomeKeyPress(Sender: TObject; var Key: Char);
    procedure cbxMarcacaoPropertiesChange(Sender: TObject);
    procedure cbxGrupoValorPropertiesChange(Sender: TObject);
    procedure icxTipoGrupoPropertiesChange(Sender: TObject);
    procedure mniAgruparMascarasClick(Sender: TObject);
    procedure fmeEditorwptTextoKeyPress(Sender: TObject; var Key: Char);
    procedure RetirarAgrupamentodeMascaraClick(Sender: TObject);
    procedure fmeEditorchkShowMarcacaoInternaClick(Sender: TObject);
    procedure chkShowMarcacaoInternaClick(Sender: TObject);
    procedure fmeEditorwptTextoChangeCursorPos(Sender: TObject);
    procedure fmeEditormniRetirarProtecaoClick(Sender: TObject);
    procedure fmeEditormniMarcacaoExcluirClick(Sender: TObject);
    procedure fmeEditormniMarcacaoDesfazerClick(Sender: TObject);
    procedure fmeEditorwptTextoChange(Sender: TObject);
    procedure cbxTipoValorPropertiesEditValueChanged(Sender: TObject);
    procedure cbxTabelaPropertiesEditValueChanged(Sender: TObject);
    procedure btnAtualizaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actDuplicarItemClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnBuscarMarcacaoClick(Sender: TObject);
    procedure EdtBuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridBasicaDBTableView1FocusedRecordChanged(
      Sender: TcxCustomGridTableView; APrevFocusedRecord,
      AFocusedRecord: TcxCustomGridRecord;
      ANewItemRecordFocusingChanged: Boolean);
  private

    procedure CarregarGrupo;
    procedure CarregarTabela(vpTipo : string);
    procedure CarregarCampos;
    procedure HabilitarCampos;
    procedure InserirMarcacao(vpValor, vpMascara : string);
    procedure Validar;
  public
    vgPaginaAtual : string;

    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmMarcacaoTipo: TfrmMarcacaoTipo;
  vgMarcacaoSelecionada : Integer;
  vgMarcacaoBuscar : String;

implementation

uses Controles, Rotinas, ControleVariaveis, Lookup,
  MarcacaoTipoAtualizar;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure TfrmMarcacaoTipo.FormActivate(Sender: TObject);
begin
  inherited;
  if vgMarcacaoSelecionada > 0 then
  begin
    if (State in [dsBrowse]) then
    begin
      Screen.Cursor := crHourGlass;
      if ClientAncestral.Locate('MARCACAO_TIPO_ID', vgMarcacaoSelecionada, [loCaseInsensitive]) then
        ExecuteAlterarExecute(self);
      Screen.Cursor := crDefault;
    end
    else
    begin
      if vgMarcacaoSelecionada <> ClientAncestralMARCACAO_TIPO_ID.AsInteger then
        ShowMessage('Edi��o n�o permitida. Ja existe uma Marca��o em edi��o!!!');
    end;
  end;

  vgMarcacaoSelecionada := 0;
  vgMarcacaoBuscar := '';

  if ClientAncestral.State = dsBrowse then
    EdtBuscar.SetFocus;
end;

procedure TfrmMarcacaoTipo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action          := caFree;
  frmMarcacaoTipo := nil;

end;

procedure TfrmMarcacaoTipo.LoadData;
begin
  btnBuscarMarcacaoClick(Self);
  inherited;
  CarregarGrupo;
  ClientAncestral.First;
end;

procedure TfrmMarcacaoTipo.SetState(AState: TDataSetState);
begin
  inherited;
  PanelData.Visible               := State in [dsInsert, dsEdit];
  fmeEditor.wptTexto.Readonly     := not(State in [dsInsert, dsEdit]);
  splGrdBasica.Visible            := State = dsBrowse;
  cxGridBasica.Visible            := State = dsBrowse;
  icxTipoGrupo.Enabled            := False;
  icxTipoQualificacao.Enabled     := False;
  cbxTipoValor.Enabled            := False;
  btnMarcacaoValor.Enabled        := True;
  fmeEditor.PanelMarcacao.Visible := False;
  btnAtualiza.Enabled             := State = dsBrowse;
  gbxBuscarMarcacao.Visible       := State = dsBrowse;
end;

procedure TfrmMarcacaoTipo.ExecuteGravarExecute(Sender: TObject);
begin
  Validar;
  Screen.Cursor := crHourGlass;
  if State in [dsInsert] then
    ClientAncestral.FieldByName('MARCACAO_TIPO_ID').AsCurrency :=  dtmControles.GerarSequencia('G_MARCACAO_TIPO');

  // Grava os valores na tabela
  ClientAncestral.FieldByName('TEXTO').AsString        := CompressString(fmeEditor.wptTexto.AsString);
  ClientAncestral.FieldByName('GRUPO').AsString        := cbxGrupoValor.EditValue;
  ClientAncestral.FieldByName('SISTEMA_ID').AsCurrency := vgId;
  if cbxTipoValor.Text = '' then
    ClientAncestralTIPO_VALOR.AsVariant := null;
  ClientAncestralGRUPO_TIPO.AsString := icxTipoGrupo.EditValue;

  inherited;
  CarregarGrupo;
  Screen.Cursor := crDefault;
  HabilitarCampos;
  EdtBuscar.SetFocus;
end;

procedure TfrmMarcacaoTipo.ExecuteIncluirExecute(Sender: TObject);
begin
  cbxGrupoValor.Clear;
  inherited;
  ClientAncestral.FieldByName('SITUACAO').AsString         := 'A';
  ClientAncestral.FieldByName('ATIVAR_SEPARADOR').AsString := 'N';
  CarregarGrupo;
  fmeEditor.wptTexto.Clear;
  edtNome.SetFocus;
end;

procedure TfrmMarcacaoTipo.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  cbxGrupoValor.EditValue  := ClientAncestral.FieldByName('GRUPO').AsString;
  cbxGrupoValorPropertiesChange(self);
  cbxTipoValorPropertiesEditValueChanged(self);
  HabilitarCampos;
  edtNome.SetFocus;
end;

// Carrega os Tipos de Grupos existentes na Marcacao Tipo
procedure TfrmMarcacaoTipo.CarregarGrupo;
begin
  Screen.Cursor := crHourGlass;
  ExecutaSqlAuxiliar(' SELECT DISTINCT(GRUPO) '+
                     ' FROM G_MARCACAO_TIPO '+
                     ' WHERE SISTEMA_ID = '+ IntToStr(vgId)+
                     ' ORDER BY GRUPO ',0);
  cbxGrupoValor.Properties.Items.Clear;
  While not dtmControles.sqlAuxiliar.Eof do
  begin
    cbxGrupoValor.Properties.Items.Add(dtmControles.sqlAuxiliar.FieldByName('GRUPO').AsString);
    dtmControles.sqlAuxiliar.Next;
  end;
  dtmControles.sqlAuxiliar.Active := False;
  Screen.Cursor := crDefault;
end;

procedure TfrmMarcacaoTipo.Validar;
var
  vlCondicao : string;
begin
  if State in [dsEdit] then
       vlCondicao := ' AND NOT MARCACAO_TIPO_ID = '+ClientAncestralMARCACAO_TIPO_ID.AsString
  else vlCondicao := '';

  // Verifica se j� existe esta marca��o com o mesmo nome e no mesmo sistema
  ExecutaSimpleDSAux(' SELECT NOME, GRUPO '+
                     ' FROM G_MARCACAO_TIPO '+
                     ' WHERE NOME = '+ QuotedStr(edtNome.Text)+
                     '   AND SISTEMA_ID = '+ IntToStr(vgId)+vlCondicao,0);

  if not dtmControles.SimpleAuxiliar.IsEmpty then
  begin
    Application.MessageBox(Pchar('J� existe uma marca��o cadastrada com este Nome no Grupo '+
                           dtmControles.SimpleAuxiliar.FieldByName('GRUPO').AsString+'.'), 'Aten��o', MB_OK + MB_ICONWARNING);
    edtNome.SetFocus;
    Abort;
  end;

  if Trim(edtNome.Text) = '' then
  begin
    Application.MessageBox('Nome deve ser infomado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtNome.SetFocus;
    Abort;
  end;

  if Trim(edtDescricao.Text) = '' then
  begin
    Application.MessageBox('Descri��o deve ser infomado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtDescricao.SetFocus;
    Abort;
  end;

  if Trim(cbxGrupoValor.Text) = '' then
  begin
    Application.MessageBox('Grupo deve ser infomado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtDescricao.SetFocus;
    Abort;
  end;

  if (icxTipoGrupo.EditValue = 'V') and (Trim(cbxTipoValor.Text) = '') then
  begin
    Application.MessageBox('Tipo do Valor deve ser infomado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    cbxTipoValor.SetFocus;
    Abort;
  end;

  if (icxTipoGrupo.EditValue = 'Q') and (trim(icxTipoQualificacao.Text) = '') then
  begin
    Application.MessageBox('Tipo da Qualifica��o deve ser infomado!', 'Aten��o', MB_OK + MB_ICONWARNING);
    icxTipoQualificacao.SetFocus;
    Abort;
  end;
end;

procedure TfrmMarcacaoTipo.ExecuteCancelarExecute(Sender: TObject);
begin
   fmeEditor.wptTexto.AsString := DeCompressString(ClientAncestral.FieldByName('TEXTO').AsString);
   inherited;
   HabilitarCampos;
   EdtBuscar.SetFocus;
end;

procedure TfrmMarcacaoTipo.btnMarcacaoValorClick(Sender: TObject);
var
  viMascara, viBookMark : string;
  viValor : string;
begin
  if (cbxMascara.ItemIndex <> -1) then
  begin
    viMascara := cbxMascara.EditValue;
    viMascara := viMascara[1] + '_';
    viValor := '';

    {Somente para o tipo de Mascarafloat}
    if (cbxMascara.Text = 'MascaraFloat') or (cbxMascara.Text = 'MascaraTexto') or
       (pos('ConcatenarAntes', cbxMascara.Text) > 0) or (cbxMascara.Text = 'QrCode') then
    repeat
      if not InputQuery('Formata��o de Mascara', 'Qual a Mascara:', viValor) then
        exit;
    until (viValor <> '') or (cbxMascara.Text = 'QrCode');

    if viValor <> '' then
         viBookMark := cbxMascara.Text + '*'+viValor
    else viBookMark := cbxMascara.Text;

    InserirMarcacao(viBookMark+'�s�', viMascara);
  end
  else
  begin
    viMascara := '';
    if (trim(cbxTabela.EditValue) = null) or (trim(cbxCampo.EditValue) = null) then
    begin
      Application.MessageBox('Tabela e Campo devem ser informados!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
      exit;
    end;
    if cbxTipoValor.EditValue = 'L' then
         InserirMarcacao(trim(cbxTabela.Text)+';'+trim(cbxCampo.Text)+'�l�', viMascara)
    else InserirMarcacao(trim(cbxTabela.Text)+';'+trim(cbxCampo.Text)+';'+trim(cbxCampoID.Text)+'�'+LowerCase(cbxTipoValor.EditValue)+'�', viMascara);
  end;

end;

procedure TfrmMarcacaoTipo.cbxMascaraPropertiesChange(Sender: TObject);
begin
  inherited;
  btnMarcacaoValor.Enabled := True;
end;

procedure TfrmMarcacaoTipo.fmeEditorSimpleswptTextoChangeCursorPos(
  Sender: TObject);
begin
  inherited;
  if fmeEditor.wptTexto.SelText = '' then
  begin
    lblInfoMarcacaoInterna.Caption := Marcacao_TipoDescricao(fmeEditor.wptTexto);
    StatusBar.Panels[1].Text       := lblInfoMarcacaoInterna.Caption;
  end;
end;

procedure TfrmMarcacaoTipo.CarregarTabela(vpTipo : string);
begin
  Screen.Cursor := crHourGlass;
  ExecutaSqlAuxiliar(' SELECT NOME '+
                     ' FROM G_CONFIG C, G_CONFIG_GRUPO G '+
                     ' WHERE C.CONFIG_GRUPO_ID = G.CONFIG_GRUPO_ID '+
                     '   AND C.SECAO = '+ QuotedStr(vpTipo)+
                     '   AND G.DESCRICAO = '+ QuotedStr('MARCACAO')+
                     '   AND SISTEMA_ID = '+ IntToStr(vgId)+
                     ' ORDER BY C.NOME ',0);
  cbxTabela.Properties.Items.Clear;
  cbxCampo.Properties.Items.Clear;
  cbxCampoID.Properties.Items.Clear;
  While not dtmControles.sqlAuxiliar.Eof do
  begin
    if vpTipo = 'LISTA' then
         cbxCampo.Properties.Items.Add(dtmControles.sqlAuxiliar.FieldByName('NOME').AsString)
    else cbxTabela.Properties.Items.Add(dtmControles.sqlAuxiliar.FieldByName('NOME').AsString);
    dtmControles.sqlAuxiliar.Next;
  end;

  if vpTipo = 'LISTA' then
  begin
    cbxTabela.Properties.Items.Add('LISTA');
    cbxTabela.ItemIndex := 0;
  end;

  dtmControles.sqlAuxiliar.Active := False;
  Screen.Cursor := crDefault;
end;

procedure TfrmMarcacaoTipo.CarregarCampos;
var
  viSql, viSufixoTab : string;
begin
{  case vgId of
   1 : viSufixoTab := 'R_';
   2 : viSufixoTab := 'T_';
  end;}

  if UpperCase(dtmControles.DB.ConnectionName) = 'ORACLE' then
  begin
    viSql := 'SELECT TABLE_NAME, ' +
      '       COLUMN_NAME, ' +
      '       DATA_TYPE, ' +
      '       CHAR_LENGTH, ' +
      '       DATA_PRECISION, ' +
      '       DATA_SCALE, ' +
      '       COLUMN_ID, ' +
      '       NULLABLE NULL_FLAG ' +
      'FROM   USER_TAB_COLS ' +
      'WHERE  TABLE_NAME = ' + QuotedStr(cbxTabela.EditValue) + ' ' +
      'ORDER  BY COLUMN_NAME ';
  end
  else
  begin
    viSql := 'SELECT R.RDB$RELATION_NAME TABLE_NAME, ' +
      '       R.RDB$FIELD_NAME COLUMN_NAME, ' +
      '       F.RDB$FIELD_TYPE DATA_TYPE, ' +
      '       F.RDB$CHARACTER_LENGTH CHAR_LENGTH2, ' +
      '       F.RDB$FIELD_PRECISION DATA_PRECISION, ' +
      '       F.RDB$FIELD_SCALE DATA_SCALE, ' +
      '       R.RDB$FIELD_ID COLUMN_ID, ' +
      '       R.RDB$NULL_FLAG NULL_FLAG, ' +
      '       R.RDB$COLLATION_ID COLLATION_ID, '+
      '       F.RDB$FIELD_NAME DOMINIO '+
      'FROM   RDB$FIELDS F, RDB$RELATION_FIELDS R ' +
      'WHERE  R.RDB$FIELD_SOURCE = F.RDB$FIELD_NAME ' +
      'AND    R.RDB$RELATION_NAME = ' + QuotedStr(viSufixoTab+cbxTabela.EditValue) + ' ' +
      'ORDER  BY R.RDB$FIELD_NAME ';
  end;

  Screen.Cursor := crHourGlass;
  ExecutaSqlAuxiliar(viSql,0);
  cbxCampo.Properties.Items.Clear;
  cbxCampoID.Properties.Items.Clear;
  While not dtmControles.sqlAuxiliar.Eof do
  begin
    cbxCampo.Properties.Items.Add(dtmControles.sqlAuxiliar.FieldByName('COLUMN_NAME').AsString);
    cbxCampoID.Properties.Items.Add(dtmControles.sqlAuxiliar.FieldByName('COLUMN_NAME').AsString);
    dtmControles.sqlAuxiliar.Next;
  end;

  dtmControles.sqlAuxiliar.Active := False;
  Screen.Cursor := crDefault;
end;

procedure TfrmMarcacaoTipo.cbxCampoPropertiesChange(Sender: TObject);
begin
  inherited;
  cbxMascara.ItemIndex     := -1;
  btnMarcacaoValor.Enabled := True;
end;

procedure TfrmMarcacaoTipo.edtNomeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = ' '  then // Space
    Key := #0149;
end;

procedure TfrmMarcacaoTipo.HabilitarCampos;
var
  viTipoValor : string;
begin
  // Paineis de Marca��o
  if State in [dsBrowse, dsInactive] then
  begin
    pnlMarcacaoValor.Visible := False;
    PanelData.Height         := 120;
    exit;
  end;

//  edtCondicaoSql.Visible    := icxTipoGrupo.EditValue <> 'M';
//  lblcondicaoSql.Visible    := icxTipoGrupo.EditValue <> 'M';
  gbxSeparadores.Visible    := icxTipoGrupo.EditValue <> 'M';

  if icxTipoGrupo.EditValue <> 'V' then
  begin
    pnlMarcacaoValor.Visible := False;
    PanelData.Height         := 120;
  end
  else
  begin
    pnlMarcacaoValor.Visible := True;
    PanelData.Height         := 168;

    if cbxTipoValor.Text = '' then
         viTipoValor := '0'
    else viTipoValor := cbxTipoValor.EditValue;

    // Campos de Tabela e Valor

    if CharInSet(viTipoValor[1],['F','C','L','0']) then
    begin
       cbxTabela.Enabled      := False;
       cbxCampoID.Enabled     := False;
      if viTipoValor = 'L' then
      begin
        cbxCampo.Enabled       := True;
        cbxMascara.Enabled     := True;
//        edtCondicaoSql.Visible := True;
//        lblcondicaoSql.Visible := True;
      end
      else
      begin
        cbxCampo.Enabled       := False;
        cbxMascara.Enabled     := False;
//        edtCondicaoSql.Visible := False;
//        lblcondicaoSql.Visible := False;
      end;
    end
    else
    begin
      cbxTabela.Enabled      := True;
      cbxCampo.Enabled       := True;
      cbxCampoID.Enabled     := True;
      cbxMascara.Enabled     := True;
//      edtCondicaoSql.Visible := True;
//      lblcondicaoSql.Visible := True;
    end;

    // Campos Separadores
    if CharInSet(viTipoValor[1],['F', 'P']) or (icxTipoQualificacao.Enabled) then
         gbxSeparadores.Visible := True
    else gbxSeparadores.Visible := False;
  end;

  case icxTipoGrupo.ItemIndex of
    0 : begin
          cbxTipoValor.Enabled            := True;
          icxTipoQualificacao.Enabled     := False;
          fmeEditor.PanelMarcacao.Visible := False;
          if State in [dsEdit, dsInsert] then
            icxTipoQualificacao.ItemIndex := -1;
        end;
    1 : begin
          cbxTipoValor.Enabled            := False;
          icxTipoQualificacao.Enabled     := True;
          fmeEditor.PanelMarcacao.Visible := True;
          if State in [dsEdit, dsInsert] then
            cbxTipoValor.ItemIndex := -1;
        end;
    2 : begin
          cbxTipoValor.Enabled              := False;
          icxTipoQualificacao.Enabled       := False;
          fmeEditor.PanelMarcacao.Visible   := True;
          cbxTipoValor.ItemIndex            := -1;
          icxTipoQualificacao.ItemIndex     := -1;
        end;
  end;
end;

procedure TfrmMarcacaoTipo.cbxMarcacaoPropertiesChange(Sender: TObject);
begin
  inherited;
  fmeEditor.wptTexto.SetFocus;
end;

procedure TfrmMarcacaoTipo.InserirMarcacao(vpValor, vpMascara : string);
begin
  inherited;

  // Cria o wptools na Memoria
  vgWptEditorMarcacao := CarregarWptVirtual(vgWptEditorMarcacao, fmeEditor.wptTexto);

  // Insere a Marca��o
  vgWptEditorMarcacao.InputString(PChar(vpValor));

  // Seleciona e Insere o BookMark e a Prote��o
  vgWptEditorMarcacao.SelectAll;
  vgWptEditorMarcacao.CurrAttr.AddStyle ([afsProtected]);
  vgWptEditorMarcacao.BookmarkInput(vpMascara+vpValor);
  vgWptEditorMarcacao.HideSelection;
  vgWptEditorMarcacao.CurrAttr.DeleteStyle([afsProtected]);

  // Copia e Cola no editor Final
  vgWptEditorMarcacao.SelectAll;
  fmeEditor.wptTexto.SelectionAsString := vgWptEditorMarcacao.AsString;
  fmeEditor.wptTexto.InputString(' ');
  fmeEditor.wptTexto.SetFocus;
  DestruirWptVirtual('vgWptEditorMarcacao');
end;

procedure TfrmMarcacaoTipo.cbxGrupoValorPropertiesChange(Sender: TObject);
begin
  inherited;
  // Verifica se existe mais de um registro neste Grupo
  ExecutaSimpleDSAux(' SELECT GRUPO_TIPO '+
                     ' FROM G_MARCACAO_TIPO '+
                     ' WHERE GRUPO = '+ QuotedStr(cbxGrupoValor.Text)+
                     '   AND NOT MARCACAO_TIPO_ID = '+ CurrToStr(ClientAncestralMARCACAO_TIPO_ID.AsCurrency)+
                     '   AND SISTEMA_ID = '+ IntToStr(vgId),0);
  if dtmControles.SimpleAuxiliar.RecordCount >= 1 then
  begin
    icxTipoGrupo.Enabled   := False;
    icxTipoGrupo.EditValue := dtmControles.SimpleAuxiliar.FieldByName('GRUPO_TIPO').AsString;
  end
  else icxTipoGrupo.Enabled := True;
end;

procedure TfrmMarcacaoTipo.icxTipoGrupoPropertiesChange(Sender: TObject);
begin
  inherited;
  HabilitarCampos;
end;

procedure TfrmMarcacaoTipo.mniAgruparMascarasClick(Sender: TObject);
begin
  inherited;//Agrupar Mascaras
  fmeEditor.wptTexto.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  fmeEditor.wptTexto.CurrAttr.AddStyle([ afsProtected ]);
  fmeEditor.wptTexto.BookmarkInput('MASCARA�g�');
  fmeEditor.wptTexto.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
end;

procedure TfrmMarcacaoTipo.fmeEditorwptTextoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  fmeEditor.wptTextoKeyPress(Sender, Key);
end;

procedure TfrmMarcacaoTipo.RetirarAgrupamentodeMascaraClick(
  Sender: TObject);
begin
  inherited; //Retirar Agrupamento de Mascara
  fmeEditor.wptTexto.CPPosition := $0;
  fmeEditor.wptTexto.BookmarkSelect('MASCARA�g�', true);
  fmeEditor.wptTexto.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  fmeEditor.wptTexto.CurrAttr.DeleteStyle([ afsProtected ]);
  fmeEditor.wptTexto.BookmarkDelete('MASCARA�g�', true, false);
  fmeEditor.wptTexto.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  fmeEditor.wptTexto.HideSelection;
end;

procedure TfrmMarcacaoTipo.fmeEditorchkShowMarcacaoInternaClick(
  Sender: TObject);
begin
  inherited;
  fmeEditor.chkShowMarcacaoInternaClick(Sender);

end;

procedure TfrmMarcacaoTipo.chkShowMarcacaoInternaClick(Sender: TObject);
begin
  inherited;
  fmeEditor.chkShowMarcacaoInterna.Checked := chkShowMarcacaoInterna.Checked;
  fmeEditor.chkShowMarcacaoInternaClick(Sender);
end;

procedure TfrmMarcacaoTipo.fmeEditorwptTextoChangeCursorPos(
  Sender: TObject);
begin
  inherited;
///  fmeEditor.wptTextoChangeCursorPos(Sender);
  lblInfoMarcacaoInterna.Caption := fmeEditor.lblInfoMarcacaoInterna.Caption;

end;

procedure TfrmMarcacaoTipo.cxGridBasicaDBTableView1FocusedRecordChanged(
  Sender: TcxCustomGridTableView; APrevFocusedRecord,
  AFocusedRecord: TcxCustomGridRecord; ANewItemRecordFocusingChanged: Boolean);
begin
  inherited;
  LockWindowUpdate(Handle);
  if State = dsBrowse then
    fmeEditor.wptTexto.AsString := DeCompressString(ClientAncestral.FieldByName('TEXTO').AsString);
  LockWindowUpdate(0);
end;

procedure TfrmMarcacaoTipo.EdtBuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 13 then
  begin
    btnBuscarMarcacao.SetFocus;
    btnBuscarMarcacaoClick(self);
  end;
end;

procedure TfrmMarcacaoTipo.fmeEditormniRetirarProtecaoClick(
  Sender: TObject);
begin
  inherited;
  fmeEditor.mniRetirarProtecaoClick(Sender);
  fmeEditor.wptTexto.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
end;

procedure TfrmMarcacaoTipo.fmeEditormniMarcacaoExcluirClick(
  Sender: TObject);
begin
  inherited;
  fmeEditor.mniMarcacaoExcluirClick(Sender);

end;

procedure TfrmMarcacaoTipo.fmeEditormniMarcacaoDesfazerClick(
  Sender: TObject);
begin
  inherited;
  fmeEditor.mniMarcacaoDesfazerClick(Sender);

end;

procedure TfrmMarcacaoTipo.fmeEditorwptTextoChange(Sender: TObject);
begin
  inherited;
  fmeEditor.wptTexto.CurrAttr.DeleteStyle([ afsProtected ]);
end;

procedure TfrmMarcacaoTipo.cbxTipoValorPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  HabilitarCampos;

  if cbxTipoValor.EditValue = 'L' then
       CarregarTabela('LISTA')
  else CarregarTabela('TABELAS');
end;

procedure TfrmMarcacaoTipo.cbxTabelaPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  cbxMascara.ItemIndex     := -1;
  btnMarcacaoValor.Enabled := True;
  if cbxTipoValor.EditValue <> 'L' then
    CarregarCampos;
end;

procedure TfrmMarcacaoTipo.actDuplicarItemClick(Sender: TObject);
var
  viNovoItem : Integer;
begin
  inherited;
  if Application.MessageBox('Duplicar item selecionado. Confirma?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  sqlDuplicar.Active := True;
  sqlDuplicar.Insert;
  viNovoItem := dtmControles.GerarSequencia('G_MARCACAO_TIPO');
  sqlDuplicarMARCACAO_TIPO_ID.AsCurrency := viNovoItem;
  sqlDuplicarDESCRICAO.AsString          := ClientAncestralDESCRICAO.AsString+'_Copia';
  sqlDuplicarNOME.AsString               := ClientAncestralNOME.AsString+'_Copia';
  sqlDuplicarGRUPO.AsString              := ClientAncestralGRUPO.AsString;
  sqlDuplicarSITUACAO.AsString           := ClientAncestralSITUACAO.AsString;
  sqlDuplicarSISTEMA_ID.AsVariant        := ClientAncestralSISTEMA_ID.AsVariant;
  sqlDuplicarGRUPO_TIPO.AsString         := ClientAncestralGRUPO_TIPO.AsVariant;
  sqlDuplicarTIPO_QUALIFICACAO.AsVariant := ClientAncestralTIPO_QUALIFICACAO.AsVariant;
  sqlDuplicarCONDICAO_SQL.AsString       := ClientAncestralCONDICAO_SQL.AsString;
  sqlDuplicarSEPARADOR_1.AsString        := ClientAncestralSEPARADOR_1.AsString;
  sqlDuplicarSEPARADOR_2.AsString        := ClientAncestralSEPARADOR_2.AsString;
  sqlDuplicarSEPARADOR_3.AsString        := ClientAncestralSEPARADOR_3.AsString;
  sqlDuplicarTIPO_VALOR.AsString         := ClientAncestralTIPO_VALOR.AsString;
  sqlDuplicarPROTEGIDA.AsVariant         := ClientAncestralPROTEGIDA.AsString;
  sqlDuplicar.Post;
  sqlDuplicar.Active := False;
  ClientAncestral.Refresh;

  ClientAncestral.Locate('MARCACAO_TIPO_ID', viNovoItem,[loCaseInsensitive]);
  Application.MessageBox('Marca��o Duplicada com sucesso!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
end;

procedure TfrmMarcacaoTipo.btnAtualizaClick(Sender: TObject);
begin
  inherited;
  ExibirFormulario(TfrmMarcacaoTipoAtualizar, frmMarcacaoTipoAtualizar, True);
  ClientAncestral.Refresh;
end;

procedure TfrmMarcacaoTipo.btnBuscarMarcacaoClick(Sender: TObject);
var
  viSql : String;
  viExpandir : Boolean;
begin
  inherited;

  viExpandir := False;
  viSql := ' SELECT * '+
           ' FROM G_MARCACAO_TIPO '+
           ' WHERE SISTEMA_ID = '+IntToStr(vgId);


  if vgMarcacaoBuscar <> '' then
  begin
    viExpandir := True;
    Marcacao_DefinirTipo(vgMarcacaoBuscar);
    viSql := viSql + ' AND UPPER(NOME) = '+QuotedStr(TrocaCharPorAsci(vgQualificar.Palavra));
  end;

  if edtBuscar.Text <> '' then
  begin
    viSql := viSql + ' AND (UPPER(NOME) LIKE '+QuotedStr('%'+EdtBuscar.Text+'%')+
                     ' OR UPPER(DESCRICAO) LIKE '+QuotedStr('%'+EdtBuscar.Text+'%')+')';
    viExpandir := True;
  end;

  viSql := viSql + ' ORDER BY GRUPO, NOME ';
  ClientAncestral.Active := False;
  DataSetAncestral.SQL.Text := viSql;
  ClientAncestral.Active := True;

  if viExpandir then
    cxGridBasicaDBTableView1.DataController.Groups.FullExpand;
end;

procedure TfrmMarcacaoTipo.FormCreate(Sender: TObject);
begin
  inherited;
  if vgLogin = 'TRI7' then
       btnAtualiza.Visible := True
  else btnAtualiza.Visible := False;
end;

end.
