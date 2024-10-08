unit CadGrupoFamiliar;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, Menus, cxLookAndFeelPainters, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinCaramel, dxSkinCoffee,
  dxSkinDarkSide, dxSkinGlassOceans, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMoneyTwins,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinPumpkin, dxSkinSilver,
  dxSkinStardust, dxSkinSummer2008, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinXmas2008Blue, cxGraphics, cxDropDownEdit, cxImageComboBox, cxDBEdit,
  cxCheckBox, cxMaskEdit, cxLabel, cxControls, cxContainer, cxEdit, cxTextEdit,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, cxPC, SimpleDS, Buttons,
  cxLookAndFeels, dxSkinBlueprint, dxSkinDarkRoom, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinFoggy, dxSkinHighContrast, dxSkinOffice2010Black,
  dxSkinOffice2010Blue, dxSkinOffice2010Silver, dxSkinOffice2013White,
  dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSpringTime, dxSkinTheAsphaltWorld, dxSkinVS2010, dxSkinWhiteprint,
  cxPCdxBarPopupMenu, cxNavigator, dxBarBuiltInMenu, DbxDevartInterBase,
  System.Actions;

type
  TfrmCadGrupoFamiliar = class(TfrmCadBasico)
    cxLabel29: TcxLabel;
    cxLabel3: TcxLabel;
    ClientAncestralPESSOA_GRUPO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralEMAIL: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralBOLETO_EMAIL: TStringField;
    pgcGrupo: TcxPageControl;
    tabGrupo: TcxTabSheet;
    tabVinculos: TcxTabSheet;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    sqlAssociados: TI9Query;
    dtsAssociados: TDataSource;
    sqlAssociadosNOME: TStringField;
    sqlAssociadosPESSOA_ID: TBCDField;
    Panel1: TPanel;
    btnAdAssociado: TSpeedButton;
    btnRemoverAssociado: TSpeedButton;
    sqlAssociadosPESSOA_GRUPO_ID: TBCDField;
    ClientAncestralCEDENTE_ID: TBCDField;
    sqlAssociadosBOLETO_EMAIL: TStringField;
    btnSelecionar: TcxButton;
    tbcSituacao: TcxTabControl;
    grdBasica: TcxGrid;
    cxGridPesquisa: TcxGridDBTableView;
    cxGridPesquisaColumn1: TcxGridDBColumn;
    cxGridPesquisaColumn2: TcxGridDBColumn;
    cxGridPesquisaColumn3: TcxGridDBColumn;
    cxGridPesquisaColumn4: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    cxLabel1: TcxLabel;
    ClientAncestralFATURA_TIPO: TStringField;
    cxGridPesquisaColumn5: TcxGridDBColumn;
    edtNome: TcxDBTextEdit;
    icxBoleto: TcxDBImageComboBox;
    cxDBImageComboBox1: TcxDBImageComboBox;
    chbSituacao: TcxDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure cxGridPesquisaDblClick(Sender: TObject);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure sqlAssociadosAfterScroll(DataSet: TDataSet);
    procedure btnRemoverAssociadoClick(Sender: TObject);
    procedure btnAdAssociadoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tbcSituacaoChange(Sender: TObject);
  private
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  public
  end;

var
  frmCadGrupoFamiliar: TfrmCadGrupoFamiliar;

implementation

uses Lookup, Controles, SelecionarAssociado, Rotinas, Lookup_Contabil;

{$R *.dfm}

procedure TfrmCadGrupoFamiliar.btnAdAssociadoClick(Sender: TObject);
begin
  inherited;
  ExibirFormulario(TfrmSelecionarAssociado, frmSelecionarAssociado, True);
  if (not vgAssociado.Flag) or (vgAssociado.Selecao = '') then
  begin
    Application.MessageBox('Nenhum s�cio selecionado!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  ExecutaSqlAuxiliar(' UPDATE T_PESSOA SET PESSOA_GRUPO_ID ='+ClientAncestralPESSOA_GRUPO_ID.AsString+','+
                     '                       BOLETO_EMAIL  ='+QuotedStr(ClientAncestralBOLETO_EMAIL.AsString)+
                     ' WHERE PESSOA_ID IN ('+vgAssociado.Selecao+ ')',1);
  sqlAssociados.Refresh;
end;

procedure TfrmCadGrupoFamiliar.btnRemoverAssociadoClick(Sender: TObject);
begin
  inherited;

  if dtmLookup.VefificaExistenciaBoleto(sqlAssociadosPESSOA_ID.AsString) then
  begin
    Application.MessageBox('Exist Boleto Vinculado. Altera��o n�o permitida!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  if Application.MessageBox('Remover Associado do Grupo?', 'Confirma��o', MB_YESNO) = IDNO then
    exit;

  sqlAssociados.Edit;
  sqlAssociadosPESSOA_GRUPO_ID.AsVariant := null;
{  if (sqlAssociadosBOLETO_EMAIL.AsString = 'S') and (sqlAssociadosEMAIL.AsString <> '') then
  begin
    if Application.MessageBox(Pchar('Enviar Boleto para o email pessoal do Associado?'+#13+#13+
                                    '>> e-mail pessoal: '+sqlAssociadosEMAIL.AsString), 'Confirma��o', MB_YESNO) = IDNO then
       sqlAssociadosBOLETO_EMAIL.AsString := 'N';
  end;}
  sqlAssociados.post;
  sqlAssociados.Refresh;
end;

procedure TfrmCadGrupoFamiliar.btnSelecionarClick(Sender: TObject);
begin
  inherited;
  vgChaveRetorno := ClientAncestralPESSOA_GRUPO_ID.AsInteger;
  Close;
end;

procedure TfrmCadGrupoFamiliar.ClientAncestralAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if ClientAncestral.RecordCount > 0 then
  begin
    sqlAssociados.Active := False;
    sqlAssociados.ParamByName('CEDENTE_ID').AsCurrency      := vgCedenteAtivo;
    sqlAssociados.ParamByName('PESSOA_GRUPO_ID').AsCurrency := ClientAncestralPESSOA_GRUPO_ID.AsCurrency;
    sqlAssociados.Active := True;

    tabVinculos.TabVisible := (ClientAncestralSITUACAO.AsString = 'A') and not vgHabilitarSelecionarGrupo;
  end
  else sqlAssociados.Active := False;

  btnAdAssociado.Enabled := ClientAncestral.RecordCount > 0;
end;

procedure TfrmCadGrupoFamiliar.cxGridPesquisaDblClick(Sender: TObject);
begin
  inherited;
  if btnSelecionar.Visible then
    btnSelecionarClick(Self);
end;

procedure TfrmCadGrupoFamiliar.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
end;

procedure TfrmCadGrupoFamiliar.ExecuteGravarExecute(Sender: TObject);
var
  viSql : String; 
begin
  if (POS('/',edtNome.Text) > 0) or (POS('.',edtNome.Text) > 0) then
  begin
    Application.MessageBox('Nome do Grupo n�o pode possuir "/ e ou ."!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
    edtNome.SetFocus;
    exit;
  end;

  VerificarPreenchimentoEDT_DB(edtNome.text, 'Nome', edtNome);
  VerificarPreenchimentoICX_DB(icxBoleto.text, 'Boleto', icxBoleto);

  // verifica se existe algum grupo cadastrado com este nome
  viSql := ' SELECT DESCRICAO '+
           ' FROM T_PESSOA_GRUPO '+
           ' WHERE DESCRICAO = '+ QuotedStr(edtNome.TEXT);
  if ClientAncestralPESSOA_GRUPO_ID.AsInteger > 0 then
    viSql := viSql + ' AND NOT PESSOA_GRUPO_ID = '+ ClientAncestralPESSOA_GRUPO_ID.AsString;
  ExecutaSqlAuxiliar(viSql, 0);
  if not dtmControles.sqlAuxiliar.IsEmpty then
  begin
    Application.MessageBox('J� existe um Grupo cadastrado com este nome!!!', 'Aten��o', MB_OK + MB_ICONWARNING);
    exit;
  end;

  // verifica se pode inativar este grupo
  if ClientAncestralSITUACAO.AsString = 'I' then
  begin
    viSql := ' SELECT COUNT(PESSOA_ID) AS QTD '+
             ' FROM T_PESSOA '+
             ' WHERE PESSOA_GRUPO_ID = '+ QuotedStr(ClientAncestralPESSOA_GRUPO_ID.AsString)+
             '   AND SITUACAO = '+ QuotedStr('1')+
             '   AND CEDENTE_ID = '+ IntToStr(vgCedenteAtivo);
    ExecutaSqlAuxiliar(viSql, 0);
    if dtmControles.sqlAuxiliar.FieldByName('QTD').AsInteger > 0 then
    begin
      Application.MessageBox(Pchar('Este grupo n�o pode ser inativado!!!'+#13+#13+
                                   '>> Existem associados Frequentes vinculados ao mesmo!!!'), 'Aten��o', MB_OK + MB_ICONWARNING);
      exit;
    end;
  end;

  ClientAncestralCEDENTE_ID.AsCurrency := vgCedenteAtivo;

  inherited;

  dtmLookup.DefinirPessoaGrupoFatura(ClientAncestralPESSOA_GRUPO_ID.AsString,
                                     ClientAncestralFATURA_TIPO.AsString,
                                     ClientAncestralBOLETO_EMAIL.AsString);
end;

procedure TfrmCadGrupoFamiliar.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString := 'A';
  edtNome.SetFocus; 
end;

procedure TfrmCadGrupoFamiliar.FormActivate(Sender: TObject);
begin
  inherited;
  tbcSituacao.TabIndex := 0;
  tbcSituacaoChange(Self);
end;

procedure TfrmCadGrupoFamiliar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  sqlAssociados.close;
  dtmLookup.AtualizarTabelas;

  Action              := caFree;
  frmCadGrupoFamiliar := nil;
end;

procedure TfrmCadGrupoFamiliar.FormCreate(Sender: TObject);
begin
  inherited;
  sqlAssociados.Connection := dtmControles.DB;

  vgNomeTabela    := 'T_PESSOA_GRUPO';
  vgChavePrimaria := 'PESSOA_GRUPO_ID';

  pgcGrupo.ActivePageIndex := 0;
  btnSelecionar.Visible := vgHabilitarSelecionarGrupo;
end;

procedure TfrmCadGrupoFamiliar.LoadData;
begin
  ClientAncestral.Open;
  inherited;

end;

procedure TfrmCadGrupoFamiliar.SetState(AState: TDataSetState);
begin
  inherited;
  grdBasica.Enabled     := State = dsBrowse;
  PanelData.Visible     := State in [dsEdit, dsInsert];
  btnSelecionar.Enabled := State = dsBrowse;
end;

procedure TfrmCadGrupoFamiliar.sqlAssociadosAfterScroll(DataSet: TDataSet);
begin
  inherited;
  btnRemoverAssociado.Enabled := (sqlAssociados.RecordCount > 0) and (ClientAncestralSITUACAO.AsString = 'A');
  btnAdAssociado.Visible      := ClientAncestralSITUACAO.AsString = 'A';
end;

procedure TfrmCadGrupoFamiliar.tbcSituacaoChange(Sender: TObject);
begin
  inherited;
  ClientAncestral.Filtered := False;
  if tbcSituacao.TabIndex = 0 then
       ClientAncestral.Filter := 'SITUACAO = '+QuotedStr('A')
  else ClientAncestral.Filter := 'SITUACAO = '+QuotedStr('I');
  ClientAncestral.Filtered := True;

  tabVinculos.TabVisible := tbcSituacao.TabIndex = 0;
end;

end.
