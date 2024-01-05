unit CadastroSeloGrupo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, FMTBcd, DB, DBClient, Provider, SqlExpr, ActnList,
  ComCtrls, StdCtrls, cxButtons, ExtCtrls, cxEdit, cxImageComboBox, cxMaskEdit,
  cxDropDownEdit, cxDBEdit, cxTextEdit, cxContainer, cxLabel, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxCheckBox, Menus, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, cxPC, System.Actions, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, dxBarBuiltInMenu, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, I9Query, dxSkinsCore,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, dxSkinscxPCPainter;

type
  TfrmCadSeloGrupo = class(TfrmCadBasico)
    ClientAncestralSELO_GRUPO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralNUMERO: TBCDField;
    ClientAncestralCONTROLE_AUTOMATICO: TStringField;
    ClientAncestralTIPO_CARTORIO: TStringField;
    ClientAncestralDESCRICAO_COMPLETA: TStringField;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    ClientAncestralESTOQUE_MINIMO: TBCDField;
    tabGrupo: TcxTabControl;
    grdBasica: TcxGrid;
    grdBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBCodigo: TcxGridDBColumn;
    grdBasicaDBTableViewNUMERO: TcxGridDBColumn;
    grdBasicaDBTableViewTIPO_CARTORIO: TcxGridDBColumn;
    grdBasicaDBTableView1Column2: TcxGridDBColumn;
    cxGridBasicaDBSituacao: TcxGridDBColumn;
    grdBasicaDBTableViewDESCRICAO_COMPLETA: TcxGridDBColumn;
    grdBasicaDBTableView1ESTOQUE_MINIMO: TcxGridDBColumn;
    grdBasicaLevel1: TcxGridLevel;
    ClientAncestralPAGINA_ACRESCE: TStringField;
    btnValidar: TcxButton;
    cxLabel4: TcxLabel;
    edtDescricao: TcxDBTextEdit;
    edtNumeto: TcxDBTextEdit;
    edtEstoqueMinimo: TcxDBTextEdit;
    cxDBImageComboBox1: TcxDBImageComboBox;
    chbSituacao: TcxDBCheckBox;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    edtDescCompleta: TcxDBTextEdit;
    ClientAncestralSELO_USUARIO: TStringField;
    lblSistema: TcxLabel;
    ibxSistema: TcxDBImageComboBox;
    ClientAncestralSISTEMA_ID: TBCDField;
    grdBasicaDBTableView1SISTEMA_ID: TcxGridDBColumn;
    ClientAncestralSUBTIPO_ATO: TBCDField;
    lblSubTipoAto: TcxLabel;
    cxLabel3: TcxLabel;
    lblTipoAto: TcxLabel;
    ClientAncestralTIPO_ATO: TBCDField;
    icbTipoAto: TcxDBImageComboBox;
    icbSubTipoAto: TcxDBImageComboBox;
    grdBasicaDBTableView1Column1: TcxGridDBColumn;
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnValidarClick(Sender: TObject);
    procedure tabGrupoChange(Sender: TObject);
    procedure icbTipoAtoPropertiesChange(Sender: TObject);
    procedure grdBasicaDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure ExecuteExcluirExecute(Sender: TObject);
  private
    vlCodServentiaSeloDigital: string;
    procedure ModoSubTipoAto;
  public
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData; override;
  end;

var
  frmCadSeloGrupo: TfrmCadSeloGrupo;

implementation

uses
  Lookup,
  Controles,
  EstoqueSelo,
  System.Types,
  System.StrUtils;

{$R *.dfm}

procedure TfrmCadSeloGrupo.ExecuteGravarExecute(Sender: TObject);
var
  viCodServentia: string;
  viListCodServentia: TStringDynArray;
begin
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descrição', edtDescricao);
  VerificarPreenchimentoEDT_DB(edtNumeto.Text, 'Número do Tipo do Selo', edtNumeto);

  viListCodServentia := SplitString(vlCodServentiaSeloDigital, ';');

  for viCodServentia in viListCodServentia do
  begin
    if ClientAncestralNUMERO.AsInteger = StrToIntDef(viCodServentia, 0) then
    begin
      Application.MessageBox('Não é permitido manipular os grupos de selos digitais!', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end;

  inherited;
end;

procedure TfrmCadSeloGrupo.LoadData;
begin
  ClientAncestral.Open;
  inherited;
end;

procedure TfrmCadSeloGrupo.ModoSubTipoAto;
begin
  if dtmControles.BuscarConfig('PRINCIPAL','CARTORIO','UF','S') = 'AL' then
  begin
    lblTipoAto.Visible    := True;
    icbTipoAto.Visible    := True;
    lblSubTipoAto.Visible := True;
    icbSubTipoAto.Visible := True;
    edtDescCompleta.Width := 254;
  end
  else
  begin
    lblTipoAto.Visible    := False;
    icbTipoAto.Visible    := False;
    lblSubTipoAto.Visible := False;
    icbSubTipoAto.Visible := False;
    edtDescCompleta.Width := 732;
  end;
end;

procedure TfrmCadSeloGrupo.SetState(AState: TDataSetState);
begin
  inherited;
  grdBasica.Enabled   := State = dsBrowse;
end;

procedure TfrmCadSeloGrupo.tabGrupoChange(Sender: TObject);
var
  viCodServentia: string;
  viListCodServentia: TStringDynArray;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  ClientAncestral.Filtered := False;
  ClientAncestral.Filter := '';

  case tabGrupo.TabIndex of
    0:
      ClientAncestral.Filter := 'SITUACAO = ' + QuotedStr('A');
    1:
      ClientAncestral.Filter := 'SITUACAO = ' + QuotedStr('I');
    2:
      begin
        viListCodServentia := SplitString(vlCodServentiaSeloDigital, ';');

        for viCodServentia in viListCodServentia do
        begin
          if Trim(ClientAncestral.Filter) = '' then
            ClientAncestral.Filter := ' NUMERO = ' + QuotedStr(viCodServentia)
          else
            ClientAncestral.Filter := ClientAncestral.Filter + ' OR NUMERO = ' + QuotedStr(viCodServentia);
        end;
      end;
  end;

  ClientAncestral.Filtered := True;
  Screen.Cursor := crDefault;
end;

procedure TfrmCadSeloGrupo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action          := caFree;
  frmCadSeloGrupo := nil;
end;

procedure TfrmCadSeloGrupo.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString            := 'A';
  //ClientAncestralSISTEMA_ID.AsInteger         := vgId;
  edtDescricao.SetFocus;
end;

procedure TfrmCadSeloGrupo.btnValidarClick(Sender: TObject);
var
  viEstoqueSelo : TEstoqueSelo;
begin
  inherited;
  Screen.Cursor := crHourGlass;
  viEstoqueSelo := TEstoqueSelo.Create;
  viEstoqueSelo.MSN := False;
  viEstoqueSelo.VerificaEstoque;
  FreeAndNil(viEstoqueSelo);
  Screen.Cursor := crDefault;
end;

procedure TfrmCadSeloGrupo.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

procedure TfrmCadSeloGrupo.ExecuteExcluirExecute(Sender: TObject);
var
  viCodServentia: string;
  viListCodServentia: TStringDynArray;
begin
  viListCodServentia := SplitString(vlCodServentiaSeloDigital, ';');

  for viCodServentia in viListCodServentia do
  begin
    if ClientAncestralNUMERO.AsInteger = StrToIntDef(viCodServentia, 0) then
    begin
      Application.MessageBox('Não é permitido excluir grupos de selos digitais!', 'Atenção', MB_OK + MB_ICONWARNING);
      Exit;
    end;
  end;

  inherited;
end;

procedure TfrmCadSeloGrupo.FormCreate(Sender: TObject);
var
  viHabilitarNovoWebService: string;
begin
  inherited;
  vlCodServentiaSeloDigital := dtmControles.BuscarParametroOutroSistema('COD_SERVENTIA_SELO_DIGITAL', 'CEARA', 'SELO', '5');
  viHabilitarNovoWebService := dtmControles.BuscarParametroOutroSistema('HABILITAR_NOVO_WEB_SERVICE', 'CEARA', 'SELO', '5');

  if viHabilitarNovoWebService = 'S' then
    tabGrupo.Properties.Tabs.Text := 'Ativos' + sLineBreak + 'Inativos' + sLineBreak + 'Selo Digital' + sLineBreak + 'Todos'
  else
    tabGrupo.Properties.Tabs.Text := 'Ativos' + sLineBreak + 'Inativos' + sLineBreak + 'Todos';

  vgNomeTabela := 'G_SELO_GRUPO';
  vgChavePrimaria := 'SELO_GRUPO_ID';
  tabGrupoChange(Self);

  ModoSubTipoAto;
end;

procedure TfrmCadSeloGrupo.grdBasicaDBTableView1CustomDrawCell(Sender: TcxCustomGridTableView; ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
var
  viCodServentia: string;
  viListCodServentia: TStringDynArray;
begin
  inherited;
  viListCodServentia := SplitString(vlCodServentiaSeloDigital, ';');

  for viCodServentia in viListCodServentia do
  begin
    if AViewInfo.RecordViewInfo.GridRecord.Values[1] = viCodServentia then
    begin
      ACanvas.Font.Style := [fsBold];
      ACanvas.Font.Color := $009D004F;
    end;
  end;
end;

procedure TfrmCadSeloGrupo.icbTipoAtoPropertiesChange(Sender: TObject);
begin
  icbSubTipoAto.Enabled := icbTipoAto.ItemIndex > -1;
  icbSubTipoAto.RepositoryItem := dtmLookup.Combo_SubTipoAtoSeloDigital_AL;

  if icbTipoAto.EditValue = null then
    Exit;

  case icbTipoAto.EditValue of
    7 : icbSubTipoAto.RepositoryItem := dtmLookup.Combo_SubTipoAtoCertidao_AL;
    15: icbSubTipoAto.RepositoryItem := dtmLookup.Combo_SubTipoAtoRegistroRTD_AL;
    16: icbSubTipoAto.RepositoryItem := dtmLookup.Combo_SubTipoAtoAverbacaoRTD_AL;
    17: icbSubTipoAto.RepositoryItem := dtmLookup.Combo_SubTipoAtoRegistroRPJ_AL;
    18: icbSubTipoAto.RepositoryItem := dtmLookup.Combo_SubTipoAtoAverbacaoRPJ_AL;
    21: icbSubTipoAto.RepositoryItem := dtmLookup.Combo_SubTipoAtoNotarial_AL;
  end;
  icbSubTipoAto.ItemIndex := 0;
end;

end.
