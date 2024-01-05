unit Config;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, FMTBcd, DB, DBClient,
  Provider, SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  cxGraphics,
  cxEdit, WPCTRRich, WPRTEDefs, WPCTRMemo,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, cxSplitter, cxTextEdit,
  cxDBEdit, cxContainer, cxLabel, Menus,
  SimpleDS, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxColorComboBox, WinSpool, cxFontNameComboBox,
  FrameEditor, System.Actions, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  DbxDevartInterBase, cxGroupBox,
  Geral.Model.Entity.Spec.Maybe,
  Geral.Model.Entity.Spec.List,
  Geral.Model.Entity.Spec.Configuracao,
  Geral.Model.Entity.Spec.Sistema, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TtipoParametro = array[1..6] of string[15];

type
  TfrmConfig = class(TfrmCadBasico)
    cxSplitter1: TcxSplitter;
    sqlConfigGrupo: TI9Query;
    dtsConfigGrupo: TDataSource;
    sqlConfigGrupoDESCRICAO: TStringField;
    PanelGrids: TPanel;
    pgcPesquisa: TPageControl;
    tabDados: TTabSheet;
    cxGridBasica: TcxGrid;
    cxGridBasicaDBTableView1: TcxGridDBTableView;
    cxGridBasicaDBSecao: TcxGridDBColumn;
    cxGridBasicaDBNome: TcxGridDBColumn;
    cxGridBasicaDBValor: TcxGridDBColumn;
    cxGridBasicaLevel1: TcxGridLevel;
    tabTexto: TTabSheet;
    cxGridBasicaDBTerminal: TcxGridDBColumn;
    cxGridGrupo: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxGridBasicaDBConfiguracao: TcxGridDBColumn;
    ClientAncestralSECAO: TStringField;
    ClientAncestralNOME: TStringField;
    ClientAncestralTEXTO: TBlobField;
    ClientAncestralTERMINAL: TStringField;
    sqlValoresPadrao: TI9Query;
    dtsValoresPadrao: TDataSource;
    sqlValoresTabela: TI9Query;
    dtsValoresTabela: TDataSource;
    ColorDialog: TColorDialog;
    ClientAncestralTIPO_VALOR: TStringField;
    sqlValoresPadraoVALOR: TStringField;
    pgcValores: TPageControl;
    tabImpressora: TTabSheet;
    tabValorPadrao: TTabSheet;
    tabDescritivo: TTabSheet;
    tabValorTabela: TTabSheet;
    tabCor: TTabSheet;
    edtValorComum: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel2: TcxLabel;
    cbxValorImpressora: TcxComboBox;
    cxLabel1: TcxLabel;
    lcbValoresPadrao: TcxLookupComboBox;
    cxLabel3: TcxLabel;
    lcbValoresTabela: TcxLookupComboBox;
    cxLabel6: TcxLabel;
    cxButton1: TcxButton;
    cbxValorCor: TcxColorComboBox;
    ClientAncestralcalc_Valor: TStringField;
    pnlDuplicar: TPanel;
    Shape1: TShape;
    rdbSelecionado: TRadioButton;
    cxLabel7: TcxLabel;
    rdbTodaSecao: TRadioButton;
    Panel2: TPanel;
    cxLabel8: TcxLabel;
    popDuplicar: TPopupMenu;
    mniDuplicarParametro: TMenuItem;
    mniExcluirParametro: TMenuItem;
    cbxTerminais: TcxComboBox;
    tabFonte: TTabSheet;
    cxLabel5: TcxLabel;
    cbxValorFonte: TcxFontNameComboBox;
    sqlValoresPadraoDESCRICAO: TStringField;
    fmeEditor: TfmeEditor;
    TextFields: TPopupMenu;
    PageNumber1: TMenuItem;
    NumberofnextPage1: TMenuItem;
    NumberofpreviousPage1: TMenuItem;
    PageCount1: TMenuItem;
    Date1: TMenuItem;
    Time1: TMenuItem;
    cxLabel9: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel10: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel11: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel12: TcxLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    cxLabel13: TcxLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxLabel14: TcxLabel;
    cxDBTextEdit6: TcxDBTextEdit;
    ClientAncestralATUALIZADO: TStringField;
    cxGridBasicaDBAtualizado: TcxGridDBColumn;
    btnCancelar: TcxButton;
    btnDuplicar: TcxButton;
    btnTerminal: TcxButton;
    gbxBuscarParametro: TcxGroupBox;
    btnBuscarParametro: TcxButton;
    EdtBuscar: TcxTextEdit;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralOBRIGATORIO: TStringField;
    cxGridBasicaDBTableView1OBRIGATORIO: TcxGridDBColumn;
    cxGridDBTableView1SISTEMA_ID: TcxGridDBColumn;
    ClientAncestralCONFIG_ID: TBCDField;
    ClientAncestralCONFIG_GRUPO_ID: TBCDField;
    ClientAncestralCONFIG_PADRAO_ID: TBCDField;
    sqlConfigGrupoCONFIG_GRUPO_ID: TBCDField;
    sqlConfigGrupoSISTEMA_ID: TBCDField;
    sqlValoresPadraoCONFIG_PADRAO_VALOR_ID: TBCDField;
    sqlValoresPadraoCONFIG_PADRAO_ID: TBCDField;
    ClientAncestralVALOR: TStringField;
    btnExportar: TcxButton;
    btnImportar: TcxButton;
    ClientDataExportar: TClientDataSet;
    dtsXmlAtualizador: TDataSource;
    sqlXmlAtualizador: TClientDataSet;
    sqlXmlAtualizadorCONFIG_ID: TBCDField;
    sqlXmlAtualizadorCONFIG_GRUPO_ID: TBCDField;
    sqlXmlAtualizadorCONFIG_PADRAO_ID: TBCDField;
    sqlXmlAtualizadorSECAO: TStringField;
    sqlXmlAtualizadorNOME: TStringField;
    sqlXmlAtualizadorVALOR: TStringField;
    sqlXmlAtualizadorDESCRICAO: TStringField;
    sqlXmlAtualizadorTEXTO: TBlobField;
    sqlXmlAtualizadorTERMINAL: TStringField;
    sqlXmlAtualizadorTIPO_VALOR: TStringField;
    sqlXmlAtualizadorATUALIZADO: TStringField;
    sqlXmlAtualizadorOBRIGATORIO: TStringField;
    ClientDataExportarCONFIG_ID: TBCDField;
    ClientDataExportarCONFIG_GRUPO_ID: TBCDField;
    ClientDataExportarCONFIG_PADRAO_ID: TBCDField;
    ClientDataExportarSECAO: TStringField;
    ClientDataExportarNOME: TStringField;
    ClientDataExportarTEXTO: TBlobField;
    ClientDataExportarTERMINAL: TStringField;
    ClientDataExportarTIPO_VALOR: TStringField;
    ClientDataExportarATUALIZADO: TStringField;
    ClientDataExportarDESCRICAO: TStringField;
    ClientDataExportarVALOR: TStringField;
    ClientDataExportarOBRIGATORIO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure ClientAncestralBeforePost(DataSet: TDataSet);
    procedure ClientAncestralAfterScroll(DataSet: TDataSet);
    procedure cxButton1Click(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure ExecuteCancelarExecute(Sender: TObject);
    procedure ClientAncestralCalcFields(DataSet: TDataSet);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecutePesquisaExecute(Sender: TObject);
    procedure mniDuplicarParametroClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDuplicarClick(Sender: TObject);
    procedure btnTerminalClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure mniExcluirParametroClick(Sender: TObject);
    procedure fmeEditorwptTextoKeyPress(Sender: TObject; var Key: Char);
    procedure fmeEditorbtnSalvarConfiguracaoClick(Sender: TObject);
    procedure Time1Click(Sender: TObject);
    procedure cxGridBasicaDBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure sqlConfigGrupoAfterScroll(DataSet: TDataSet);
    procedure btnBuscarParametroClick(Sender: TObject);
    procedure EdtBuscarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure fmeEditorbtnInserirImagemClick(Sender: TObject);
    procedure fmeEditorbtnSaveImagemClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ClientAncestralAfterPost(DataSet: TDataSet);
    procedure cxGridDBTableView1SISTEMA_IDGetDisplayText(
      Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
      var AText: string);
    procedure btnExportarClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
  private
    vlTipoValor : integer;
    vlFiltroParametro, vlFiltroGrupo : String;
    vlAbrindoForm : Boolean;
    FConfiguracaoList: IMaybe<IList<IConfiguracao>>;
    FSistemaList: IMaybe<IList<ISistema>>;

    function CriterioSistemaID: string;
    function CriterioConfiguracaoGrupo: string;
    function CriterioConfiguracao: string;

    function WhereSistemaID(
      const vpAliasConfiguracaoGrupo: string): string;

    function ListSistemaDistinct: IList<ISistema>;
    procedure CarregarClientExportar;
  public
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData;override;
    procedure ObterPortasImpressora;

    class procedure Abrir(
      const vpValues: IList<IConfiguracao>);
  end;

var
  frmConfig: TfrmConfig;

const
  vlTipoParametro : TtipoParametro = ('Descritivo', 'Impressora', 'Padrao', 'Tabela', 'Cor', 'Texto');

implementation

uses
  Controles,
  DateUtils,
  Math,
  Rotinas,
  Geral.Model.Entity.Impl.Factory.List,
  Geral.Model.Entity.Impl.Maybe,
  MensagemUtils,
  Geral.Model.Entity.Impl.List.Transform,
  System.Types,
  Geral.Model.Entity.Impl.Configuracao,
  Lookup,
  System.StrUtils;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}
{$WARN SUSPICIOUS_TYPECAST OFF}

procedure TfrmConfig.FormCreate(Sender: TObject);
begin
  vlAbrindoForm := True;
  inherited;

  sqlConfigGrupo.Connection   := dtmControles.DB;
  sqlValoresPadrao.Connection := dtmControles.DB;
  sqlValoresTabela.Connection := dtmControles.DB;

  PanelData.Enabled := True;
  ObterPortasImpressora;

  FConfiguracaoList := TNone<IList<IConfiguracao>>.New;
  FSistemaList := TNone<IList<ISistema>>.New;
end;

procedure TfrmConfig.FormActivate(Sender: TObject);
begin
  inherited;
  if gbxBuscarParametro.Enabled then
    EdtBuscar.SetFocus;

  vlAbrindoForm := False;
  ClientAncestralAfterScroll(ClientAncestral);
end;

procedure TfrmConfig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  sqlConfigGrupo.Active   := False;
  sqlValoresPadrao.Active := False;
  sqlValoresTabela.Active := False;

  dtmControles.sqlConfig.Refresh;

  Action := caFree;
  frmConfig := nil;
end;

procedure TfrmConfig.FormCloseQuery(
  Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  CanClose := True;

  if not FConfiguracaoList.HasValue then
    Exit;

  if FConfiguracaoList.Value.Any(
    function(
      const vpValue: IConfiguracao): Boolean
    begin
      Result := vpValue.Valor.Obrigatorio and
        not vpValue.Valor.Atualizado;
    end) then
    CanClose := not TMensagemUtils.ExibirMensagemPergunta(
      string.Format(
        'Existem configurações obrigatórias não atualizadas.%s' +
        'Deseja atualizá-las?',
        [sLineBreak]));
end;

procedure TfrmConfig.SetState(AState: TDataSetState);
begin
  inherited;
  PanelData.Enabled   := State in [dsBrowse];
  PanelGrids.Enabled  := State = dsBrowse;
  cxGridGrupo.Enabled := State = dsBrowse;
  pgcValores.Enabled  := State in [dsInsert, dsEdit];
  gbxBuscarParametro.Enabled := State = dsBrowse;
end;

procedure TfrmConfig.sqlConfigGrupoAfterScroll(DataSet: TDataSet);
var
  viSql : String;
begin
  inherited;
  viSql := ' SELECT * '+
           ' FROM G_CONFIG '+
           ' WHERE CONFIG_GRUPO_ID = '+ sqlConfigGrupoCONFIG_GRUPO_ID.AsString ;
  if vlFiltroParametro <> '' then
    viSql := viSql + ' AND CONFIG_ID IN ('+vlFiltroParametro+')';

  if FConfiguracaoList.HasValue then
    viSql := viSql +
      string.Format(
        ' AND CONFIG_ID IN (%s) ',
        [CriterioConfiguracao]);

  viSql := viSql + ' ORDER BY SECAO, TERMINAL, NOME ';

  ClientAncestral.AfterScroll := nil;
  ClientAncestral.Active := False;
  DataSetAncestral.SQL.Text := viSql;
  ClientAncestral.Active := True;

  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  ClientAncestralAfterScroll(ClientAncestral);
  SetState(dsBrowse);

  if (vlFiltroGrupo <> '') or
    FConfiguracaoList.HasValue then
    cxGridBasicaDBTableView1.DataController.Groups.FullExpand;

  cxGridGrupo.SetFocus;
end;

procedure TfrmConfig.ExecuteGravarExecute(Sender: TObject);
begin
  ClientAncestralCONFIG_GRUPO_ID.AsCurrency := sqlConfigGrupoCONFIG_GRUPO_ID.AsCurrency;
  ClientAncestralATUALIZADO.AsString := 'S'; 
  case vlTipoValor of
   1 : ClientAncestralVALOR.AsString := edtValorComum.EditValue;
   2 : ClientAncestralVALOR.AsString := cbxValorImpressora.EditValue;
   3 : ClientAncestralVALOR.AsString := lcbValoresPadrao.EditValue;
   4 : ClientAncestralVALOR.AsString := lcbValoresTabela.EditValue;
   5 : ClientAncestralVALOR.AsString := cbxValorCor.EditValue;
   6 : ClientAncestral.FieldByName('TEXTO').AsString := CompressString(fmeEditor.wptTexto.AsString);
   7 : ClientAncestralVALOR.AsString := cbxValorFonte.EditValue;
  end;

  if ClientAncestralTIPO_VALOR.AsString = '6' then
  begin
    PanelGrids.Enabled  := False;
    PanelData.Enabled   := True;
    tabDados.TabVisible := True;
  end;

  inherited;
  pgcValores.Enabled  := False;
  btnExportar.Enabled := True;
  btnImportar.Enabled := True;

  if ClientAncestralNOME.AsString = 'DEFINIR_VALOR_MARGEM' then
    ClientAncestral.Refresh;

  if tabTexto.TabVisible then
  begin
    pgcPesquisa.ActivePage := tabTexto;
    ClientAncestralAfterScroll(ClientAncestral);
  end;
  dtmControles.sqlConfig.Refresh;
end;

procedure TfrmConfig.ClientAncestralBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if State in [dsInsert] then
    ClientAncestral.FieldByName('CONFIG_ID').AsCurrency :=  dtmControles.GerarSequencia('T_CONFIG');
end;

procedure TfrmConfig.CarregarClientExportar;
var
  viSql : String;
begin
  inherited;

  viSql := ' SELECT C.* '+
           ' FROM G_CONFIG C '+
           '   LEFT OUTER JOIN G_CONFIG_GRUPO G ON '+
           '   C.CONFIG_GRUPO_ID = G.CONFIG_GRUPO_ID '+
           ' WHERE G.SISTEMA_ID = '+vgId.ToString +
           ' ORDER BY C.CONFIG_ID ';

  ClientAncestral.Active    := False;
  ClientDataExportar.Active := False;
  DataSetAncestral.SQL.Text := viSql;
  ClientDataExportar.Active := True;
end;

procedure TfrmConfig.ClientAncestralAfterPost(DataSet: TDataSet);
{$REGION 'Variáveis'}
var
  viConfiguracao: IConfiguracao;
  I: Integer;
{$ENDREGION}
begin
  inherited;
  if not FConfiguracaoList.HasValue then
    Exit;

  viConfiguracao := FConfiguracaoList.Value.Single(
    function(
      const vpValue: IConfiguracao): Boolean
    begin
      Result := CompareValue(
        vpValue.ID,
        ClientAncestralCONFIG_ID.AsInteger) = EqualsValue;
    end);

  I := FConfiguracaoList.Value.IndexOf(
    viConfiguracao);

  FConfiguracaoList.Value[I] := TConfiguracao.New(
    viConfiguracao.ID,
    viConfiguracao.Caminho,
    viConfiguracao.Descricao,
    TValorConfiguracao.New(
      viConfiguracao.Valor.Valor,
      viConfiguracao.Valor.Texto,
      ClientAncestralATUALIZADO.AsString.Equals(
        'S'),
      viConfiguracao.Valor.Obrigatorio));
end;

procedure TfrmConfig.ClientAncestralAfterScroll(DataSet: TDataSet);
  procedure HabilitaTab(vpTab1, vpTab2, vpTab3, vpTab4, vpTab5, vpTab6, vpTab7 : Boolean);
  begin
    tabDescritivo.TabVisible  := vpTab1;
    tabImpressora.TabVisible  := vpTab2;
    tabValorPadrao.TabVisible := vpTab3;
    tabValorTabela.TabVisible := vpTab4;
    tabCor.TabVisible         := vpTab5;
    tabTexto.TabVisible       := vpTab6;
    tabFonte.TabVisible       := vpTab7;
  end;

  procedure ConfigurarValorComum;
  begin
    edtValorComum.EditValue := ClientAncestralVALOR.AsString;
    HabilitaTab(True, False, False, False, False, False, False);
  end;

  procedure ConfigurarValorImpressora;
  begin
    cbxValorImpressora.EditValue := ClientAncestralVALOR.AsString;
    HabilitaTab(False, True, False, False, False, False, False);
  end;

  procedure ConfigurarValoresPadrao;
  begin
    sqlValoresPadrao.Active := False;
    sqlValoresPadrao.ParamByName('CONFIG_PADRAO_ID').AsBCD := ClientAncestralCONFIG_PADRAO_ID.AsCurrency;
    sqlValoresPadrao.Active := True;

    HabilitaTab(False, False, True, False, False, False, False);
    lcbValoresPadrao.EditValue := ClientAncestralVALOR.AsString;
  end;

  procedure ConfigurarValoresTabela;
  var
    viSql : String;

    function VerificaExisteCampo_Na_Tabela : Boolean;
    var
      viSqlAux : String;
    begin
       try
         viSqlAux :=  'select  rdb$field_name from rdb$relation_fields '+
                   '  where rdb$relation_name = '+QuotedStr(dtmControles.SimpleAuxiliar.FieldByName('TABELA').AsString)+
                   '    and rdb$field_name = '+QuotedStr('SISTEMA_ID');
         ExecutaSqlAuxiliar(viSqlAux, 0);
         if dtmControles.sqlAuxiliar.IsEmpty then
              Result := False
         else Result := True;
       except
          Result := false;
       end;
       dtmControles.sqlAuxiliar.Close;
    end;

  begin
    HabilitaTab(False, False, False, True, False, False, False);

    try
      ExecutaSimpleDSAux(' SELECT TABELA, KEYFIELD, LISTFIELD '+
                         ' FROM G_CONFIG_PADRAO '+
                         ' WHERE CONFIG_PADRAO_ID = '+ ClientAncestralCONFIG_PADRAO_ID.AsString,0);

      // Montar o sql dos Valores da Tabela Padrao
      try
        viSql := ' SELECT '+  dtmControles.SimpleAuxiliar.FieldByName('KEYFIELD').AsString+', '+
                              dtmControles.SimpleAuxiliar.FieldByName('LISTFIELD').AsString+
                 ' FROM '+ dtmControles.SimpleAuxiliar.FieldByName('TABELA').AsString;

        if VerificaExisteCampo_Na_Tabela then
        begin
          if vgId = 20 then
               viSql := viSql + ' WHERE SISTEMA_ID IN ('+IntToStr(vgId)+',5)'
          else viSql := viSql + ' WHERE SISTEMA_ID = '+ IntToStr(vgId);
        end;

        viSql := viSql + ' ORDER BY '+dtmControles.SimpleAuxiliar.FieldByName('LISTFIELD').AsString;

        sqlValoresTabela.Active := False;
        sqlValoresTabela.SQL.Text := viSql;
        sqlValoresTabela.Active := True;
      except

      end;

      if not sqlValoresTabela.IsEmpty then
      begin
        lcbValoresTabela.Properties.ListFieldNames := dtmControles.SimpleAuxiliar.FieldByName('LISTFIELD').AsString;
        lcbValoresTabela.Properties.KeyFieldNames  := dtmControles.SimpleAuxiliar.FieldByName('KEYFIELD').AsString;
      end;
    except
      Application.MessageBox('Campo com as configurações do tipo de valor inválido!!!', 'Erro', mb_Ok + mb_IconError);
      exit;
    end;
    if ClientAncestralVALOR.AsString <> '' then
      lcbValoresTabela.EditValue := ClientAncestralVALOR.AsInteger;
  end;

  procedure ConfigurarCor;
  begin
    if ClientAncestralVALOR.AsString <> '' then
      cbxValorCor.EditValue := ClientAncestralVALOR.AsString;
    HabilitaTab(False, False, False, False, True, False, False);
  end;

  procedure ConfigurarTexto;
  begin
    edtValorComum.EditValue     := 'VALOR DEFINIDO NO TEXTO';
    fmeEditor.wptTexto.AsString := DeCompressString(ClientAncestralTEXTO.AsString);
    HabilitaTab(True, False, False, False, False, True, False);
  end;

  procedure ConfigurarFonte;
  begin
    if ClientAncestralVALOR.AsString <> '' then
      cbxValorFonte.EditValue := ClientAncestralVALOR.AsString;
    HabilitaTab(False, False, False, False, False, False, True);
  end;

begin
  inherited;
  if vlAbrindoForm  then
    exit;

  LockWindowUpdate(Handle);
  if not ClientAncestral.IsEmpty then
  begin
    if (ClientAncestralTIPO_VALOR.AsString = '') then
    begin
      Application.MessageBox('Parametro com o tipo de valor inválido!!!', 'Erro', mb_Ok + mb_IconError);
      exit;
    end;

    vlTipoValor := ClientAncestralTIPO_VALOR.AsInteger;

    // Verifica o tipo do Parametro
    case vlTipoValor of
     1 : ConfigurarValorComum;
     2 : ConfigurarValorImpressora;
     3 : ConfigurarValoresPadrao;
     4 : ConfigurarValoresTabela;
     5 : ConfigurarCor;
     6 : ConfigurarTexto;
     7 : ConfigurarFonte;
    end;
  end;

  if ClientAncestralTERMINAL.AsString = '' then
  begin
    mniExcluirParametro.Enabled  := False;
    mniDuplicarParametro.Enabled := True;
  end
  else
  begin
    mniExcluirParametro.Enabled  := True;
    mniDuplicarParametro.Enabled := False;
  end;

  // Mostra Botão de Salvar Configuração de Margens
  if ClientAncestralNOME.AsString = 'DEFINIR_VALOR_MARGEM' then
       fmeEditor.btnSalvarConfiguracao.Visible := True
  else fmeEditor.btnSalvarConfiguracao.Visible := False;

  LockWindowUpdate(0);
end;

procedure TfrmConfig.ObterPortasImpressora;
var
  i : Integer;
  Flags, Count, NumInfo: DWORD;
  Buffer : String;
  PrinterInfo : PAnsiChar;
begin
  cbxvalorImpressora.Properties.Items.Clear;
  Flags := PRINTER_ENUM_CONNECTIONS or PRINTER_ENUM_LOCAL;
  EnumPrinters(Flags, nil, 5, nil, 0, Count, NumInfo);
  if Count = 0 then
    Exit;
  SetLength(Buffer, Count);
  if not EnumPrinters(Flags, nil, 5, PByte(Buffer), Count, Count, NumInfo) then
    Exit;
  PrinterInfo := PansiChar(Buffer);
  for i := 0 to NumInfo - 1 do begin
    with PPrinterInfo5(PrinterInfo)^ do
      cbxValorImpressora.Properties.Items.Add(String(pPortName));
    Inc(PrinterInfo,Sizeof(TPrinterInfo5));
  end;
end;

procedure TfrmConfig.cxButton1Click(Sender: TObject);
begin
  inherited;
  ColorDialog.Execute;
  cbxValorCor.EditValue := ColorDialog.Color;
end;

procedure TfrmConfig.EdtBuscarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 13 then
  begin
    btnBuscarParametro.SetFocus;
    btnBuscarParametroClick(self);
  end;
end;

procedure TfrmConfig.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  pgcValores.Enabled  := True;
  PanelData.Enabled   := True;
  btnExportar.Enabled := False;
  btnImportar.Enabled := False;

  if ClientAncestralTIPO_VALOR.AsString = '6' then
  begin
    PanelGrids.Enabled  := True;
    PanelData.Enabled   := False;
    tabDados.TabVisible := False;
  end;

  case vlTipoValor of
   1 : edtValorComum.SetFocus;
   2 : cbxValorImpressora.SetFocus;
   3 : lcbValoresPadrao.SetFocus;
   4 : lcbValoresTabela.SetFocus;
   5 : cbxValorCor.SetFocus;
   7 : cbxValorFonte.SetFocus;
  end;
end;

procedure TfrmConfig.ExecuteCancelarExecute(Sender: TObject);
begin
  if ClientAncestralTIPO_VALOR.AsString = '6' then
  begin
    PanelGrids.Enabled  := False;
    PanelData.Enabled   := True;
    tabDados.TabVisible := True;
  end;

  inherited;
  pgcValores.Enabled := False;
  PanelData.Enabled  := True;
  btnExportar.Enabled := True;
  btnImportar.Enabled := True;
  ClientAncestralAfterScroll(ClientAncestral);
end;

procedure TfrmConfig.ClientAncestralCalcFields(DataSet: TDataSet);
begin
  inherited;
//  if ClientAncestralTIPO_VALOR.AsString = '4' then
//       ClientAncestralcalc_Valor.AsString := lcbValoresTabela.Text
  ClientAncestralcalc_Valor.AsString := ClientAncestralVALOR.AsString;
end;

function TfrmConfig.CriterioConfiguracao: string;
begin
  Result := string.Join(
    ', ',
    TListTransform<IConfiguracao, string>.New(
      FConfiguracaoList.Value.Where(
        function(const vpValue: IConfiguracao): Boolean
        begin
          Result := CompareValue(
            vpValue.Caminho.ConfiguracaoGrupo.ID,
            sqlConfigGrupoCONFIG_GRUPO_ID.AsInteger) = EqualsValue;
        end),
      TListFactory<string>.New.GetInstance)
    .Transform(
      function(const vpValue: IConfiguracao): string
      begin
        Result := vpValue.ID.ToString;
      end)
    .ToArray);
end;

function TfrmConfig.CriterioConfiguracaoGrupo: string;
begin
  Result := string.Join(
    ', ',
    TListTransformUniqueValues<IConfiguracao, string>.New(
      FConfiguracaoList.Value,
      TListFactory<string>.New.GetInstance)
    .Transform(
      function(const vpValue: IConfiguracao): string
      begin
        Result := vpValue.Caminho.ConfiguracaoGrupo.ID.ToString;
      end)
    .ToArray);
end;

function TfrmConfig.CriterioSistemaID: string;
begin
  Result := string.Join(
    ', ',
    TListTransform<ISistema, string>.New(
      FSistemaList.Value,
      TListFactory<string>.New.GetInstance)
    .Transform(
      function(
        const vpValue: ISistema): string
      begin
        Result := vpValue.ID.ToString;
      end)
    .ToArray);
end;

procedure TfrmConfig.ExecuteIncluirExecute(Sender: TObject);
begin
//  inherited;

end;

procedure TfrmConfig.ExecutePesquisaExecute(Sender: TObject);
begin
//  inherited;

end;

procedure TfrmConfig.mniDuplicarParametroClick(Sender: TObject);
begin
  inherited;
  PanelData.Visible   := False;
  pnlDuplicar.Visible := True;
  PanelGrids.Enabled  := False;
end;

procedure TfrmConfig.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if not pnlDuplicar.Visible then
    inherited;

end;

class procedure TfrmConfig.Abrir(
  const vpValues: IList<IConfiguracao>);
begin
  if Assigned(
    frmConfig) then
    frmConfig.Close;

  Application.CreateForm(
    Self,
    frmConfig);

  frmConfig.FConfiguracaoList := TSome<IList<IConfiguracao>>.New(
    vpValues);

  frmConfig.FSistemaList := TSome<IList<ISistema>>.New(
    frmConfig.ListSistemaDistinct);

  if CompareValue(
    frmConfig.FSistemaList.Value.Count,
    1) = GreaterThanValue then
    frmConfig.cxGridDBTableView1SISTEMA_ID.GroupIndex := ZeroValue;

  ExibirFormulario(
    Self,
    frmConfig,
    True,
    False,
    True);
end;

procedure TfrmConfig.btnBuscarParametroClick(Sender: TObject);
var
  viSql : String;
begin
  inherited;
  vlFiltroParametro := '';
  vlFiltroGrupo     := '';

  viSql := ' SELECT C.CONFIG_ID, C.CONFIG_GRUPO_ID, C.NOME '+
           ' FROM G_CONFIG C '+
           '  LEFT OUTER JOIN G_CONFIG_GRUPO G ON '+
           '  C.CONFIG_GRUPO_ID = G.CONFIG_GRUPO_ID ';

  {if vgId = 20 then
       viSql := viSql + '  WHERE G.SISTEMA_ID = 5 '
  else viSql := viSql + '  WHERE G.SISTEMA_ID = '+ IntToStr(vgId);}

  viSql := viSql + WhereSistemaID(
    'G');

  viSql := viSql + ' AND UPPER(C.NOME) LIKE '+QuotedStr('%'+EdtBuscar.Text+'%');

  ExecutaSqlAuxiliar(viSql, 0);

  if dtmControles.sqlAuxiliar.IsEmpty then
  begin
    Application.MessageBox('Nenhum parâmetro encontrado!!!!', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;

  While not dtmControles.sqlAuxiliar.Eof do
  begin
    if vlFiltroParametro <> '' then
      vlFiltroParametro := vlFiltroParametro+',';
    vlFiltroParametro   := vlFiltroParametro + dtmControles.sqlAuxiliar.FieldByName('CONFIG_ID').AsString;

   if vlFiltroGrupo <> '' then
      vlFiltroGrupo := vlFiltroGrupo+',';
    vlFiltroGrupo := vlFiltroGrupo + dtmControles.sqlAuxiliar.FieldByName('CONFIG_GRUPO_ID').AsString;

    dtmControles.sqlAuxiliar.Next;
  end;
  LoadData;
  cxGridBasicaDBTableView1.DataController.Groups.FullExpand;
end;

procedure TfrmConfig.btnCancelarClick(Sender: TObject);
begin
  inherited;
  PanelData.Visible   := True;
  pnlDuplicar.Visible := False;
  PanelGrids.Enabled  := True;
end;

procedure TfrmConfig.btnDuplicarClick(Sender: TObject);
var
  viMensagem, viValorNulo : string;

  procedure DuplicarValor;
  begin
    ExecutaSqlAuxiliar(' INSERT INTO G_CONFIG (CONFIG_ID, '+
                       '              CONFIG_GRUPO_ID, '+
                       '              CONFIG_PADRAO_ID, '+
                       '              SECAO, '+
                       '              NOME, '+
                       '              VALOR, '+
                       '              DESCRICAO, '+
                       '              TEXTO, '+
                       '              TERMINAL, '+
                       '              TIPO_VALOR) '+
                       ' VALUES(      :CONFIG_ID, '+
                       '              :CONFIG_GRUPO_ID, '+
                                      viValorNulo+', '+
                       '              :SECAO, '+
                       '              :NOME, '+
                       '              :VALOR, '+
                       '              :DESCRICAO, '+
                       '              :TEXTO, '+
                       '              :TERMINAL, '+
                       '              :TIPO_VALOR)',2);
    with dtmControles.sqlAuxiliar do
    begin
      ParamByName('CONFIG_ID').AsBCD        := dtmControles.GerarSequencia('G_CONFIG') + 100000;
      ParamByName('CONFIG_GRUPO_ID').AsBCD  := dtmControles.SimpleAuxiliar.FieldByName('CONFIG_GRUPO_ID').AsCurrency;

      if viValorNulo <> 'null' then
        ParamByName('CONFIG_PADRAO_ID').AsBCD := dtmControles.SimpleAuxiliar.FieldByName('CONFIG_PADRAO_ID').AsCurrency;

      ParamByName('SECAO').AsString         := dtmControles.SimpleAuxiliar.FieldByName('SECAO').AsString;
      ParamByName('NOME').AsString          := dtmControles.SimpleAuxiliar.FieldByName('NOME').AsString;
      ParamByName('VALOR').AsString         := dtmControles.SimpleAuxiliar.FieldByName('VALOR').AsString;
      ParamByName('DESCRICAO').AsString     := dtmControles.SimpleAuxiliar.FieldByName('DESCRICAO').AsString;
      ParamByName('TEXTO').AsString           := dtmControles.SimpleAuxiliar.FieldByName('TEXTO').AsString;
      ParamByName('TERMINAL').AsString      := cbxTerminais.Text;
      ParamByName('TIPO_VALOR').AsString    := dtmControles.SimpleAuxiliar.FieldByName('TIPO_VALOR').AsString;
      ExecSQL;
    end;
  end;

begin
  inherited;
  if rdbSelecionado.Checked then
       viMensagem := 'Confirma duplicação do item para o terminal '+ cbxTerminais.EditText + '?'
  else viMensagem := 'Confirma duplicação da Seção '+ ClientAncestralSECAO.AsString +' para o terminal '+ cbxTerminais.EditText + '?';

  if Application.MessageBox (PChar(viMensagem), 'Confirmar', mb_IconQuestion + mb_YesNo) = idNo then
    exit
  else
  begin
    Screen.Cursor := crHourGlass;
    // Busca os parametros a serem duplicados
    if rdbSelecionado.Checked then
      ExecutaSimpleDSAux(' SELECT * FROM G_CONFIG '+
                         ' WHERE CONFIG_ID = '+ ClientAncestralCONFIG_ID.AsString,0)
    else
      ExecutaSimpleDSAux(' SELECT C.* '+
                         ' FROM G_CONFIG C, G_CONFIG_GRUPO G '+
                         ' WHERE C.SECAO = '+ QuotedStr(ClientAncestralSECAO.AsString)+
                         '   AND C.CONFIG_GRUPO_ID = G.CONFIG_GRUPO_ID '+
                         '   AND (C.TERMINAL = '+ QuotedStr('') +' OR C.TERMINAL IS NULL)'+ 
                         '   AND G.SISTEMA_ID = 2 ',0);

    with dtmControles do
    begin
      dtmControles.StartTransaction;
      try
        While not SimpleAuxiliar.Eof do
        begin
          if SimpleAuxiliar.FieldByName('CONFIG_PADRAO_ID').AsCurrency = 0 then
               viValorNulo := 'null'
          else viValorNulo := ':CONFIG_PADRAO_ID';

          DuplicarValor;
          SimpleAuxiliar.Next;
        end;
        dtmControles.Commit;
      except
        on E :Exception do
        begin
          dtmControles.Rollback;
          Screen.Cursor := crDefault;
          Application.MessageBox(PChar(e.message), 'Erro', MB_ICONERROR + MB_OK);
        end;
      end;
    end;
    ClientAncestral.Refresh;
    Screen.Cursor := crDefault;
  end;

  PanelData.Visible   := True;
  pnlDuplicar.Visible := False;
  PanelGrids.Enabled  := True;
  Application.MessageBox ('Valor(es) duplicado(s) com sucesso!!!', 'Informação', MB_ICONINFORMATION + MB_OK);
end;

procedure TfrmConfig.btnExportarClick(Sender: TObject);
begin
  CarregarClientExportar;
  ClientDataExportar.SaveToFile(ExtractFilePath(Application.ExeName) + 'XML_CONFIG.XML', dfXMLUTF8);
  ClientDataExportar.Active := False;
  ShowMessage('Arquivo exportado com Sucesso.'+ (ExtractFilePath(Application.ExeName) + 'XML_CONFIG.XML'));
  sqlConfigGrupoAfterScroll(sqlConfigGrupo);
end;

procedure TfrmConfig.btnImportarClick(Sender: TObject);

  procedure CarregarDadosAtualizacao;
  begin
    sqlXmlAtualizador.Active := False;
    try
      sqlXmlAtualizador.LoadFromFile(ExtractFilePath(Application.ExeName) + 'XML_CONFIG.XML');
    except
      abort;
    end;
    sqlXmlAtualizador.Active := True;
  end;

begin
  inherited;
  if Application.MessageBox('Atualizar Dados do Config. Confirma?','Pergunta', mb_IconQuestion + mb_YesNo) = idNo then
    Exit;

  CarregarDadosAtualizacao;
  CarregarClientExportar;
  sqlXmlAtualizador.First;
  while not sqlXmlAtualizador.Eof do
  begin
    // Atualizar
    if ClientDataExportar.Locate(
      'SECAO;NOME',
      VarArrayOf([
        sqlXmlAtualizador.FieldByName('SECAO').AsString,
        sqlXmlAtualizador.FieldByName('NOME').AsString]),
      [loCaseInsensitive, loPartialKey]) then
    begin
      ClientDataExportar.Edit;
      ClientDataExportarVALOR.AsString := sqlXmlAtualizador.FieldByName('VALOR').AsString;
      ClientDataExportarTEXTO.AsString := sqlXmlAtualizador.FieldByName('TEXTO').AsString;
      ClientDataExportar.Post;
      ClientDataExportar.ApplyUpdates(-1);
    end;
    sqlXmlAtualizador.Next;
  end;

  ShowMessage('Atualização efetuada com sucesso!!!');

  ClientDataExportar.Active := False;
  sqlConfigGrupoAfterScroll(sqlConfigGrupo);
  dtmControles.sqlAuxiliar.Active := False;
end;

procedure TfrmConfig.btnTerminalClick(Sender: TObject);
begin
  inherited;
  cbxTerminais.Text := RetornaIP;
end;

procedure TfrmConfig.FormShow(Sender: TObject);
begin
  inherited;
  if State in [dsBrowse] then
    ClientAncestralAfterScroll(ClientAncestral);
end;

procedure TfrmConfig.mniExcluirParametroClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox ('Confirma exclusão do parâmetro?', 'Confirmar', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  ClientAncestral.Delete;
  ClientAncestral.ApplyUpdates(-1);
  ClientAncestral.Refresh;
end;

function TfrmConfig.ListSistemaDistinct: IList<ISistema>;
begin
  Result := TListTransformUniqueValues<IConfiguracao, ISistema>.New(
    FConfiguracaoList.Value,
    TListFactory<ISistema>.New.GetInstance,
    function(
      const vpLeft: ISistema;
      const vpRight: ISistema): Boolean
    begin
      Result := CompareValue(
        vpLeft.ID,
        vpRight.ID) = EqualsValue;
    end)
    .Transform(
      function(
        const vpValue: IConfiguracao): ISistema
      begin
        Result := vpValue.Caminho.ConfiguracaoGrupo.Sistema;
      end);
end;

procedure TfrmConfig.LoadData;
var
  viSql : String;
begin
  viSql :=  ' SELECT * '+
            ' FROM G_CONFIG_GRUPO ';

  {if vgId = 20 then
       viSql := viSql + '  WHERE SISTEMA_ID = 5 '
  else viSql := viSql + '  WHERE SISTEMA_ID = '+ IntToStr(vgId);}

  viSql := viSql + WhereSistemaID(
    string.Empty);

  if vlFiltroGrupo <> '' then
    viSql := viSql + '  AND CONFIG_GRUPO_ID IN ('+ vlFiltroGrupo + ')';

  if FConfiguracaoList.HasValue then
    viSql := viSql +
      string.Format(
        ' AND CONFIG_GRUPO_ID IN (%s) ',
        [CriterioConfiguracaoGrupo]);

  viSql := viSql + ' ORDER BY DESCRICAO ';

  ClientAncestral.AfterScroll := nil;
  sqlConfigGrupo.AfterScroll := nil;

  sqlConfigGrupo.Active := False;
  sqlConfigGrupo.SQL.Text := viSql;
  sqlConfigGrupo.Active := True;

  sqlConfigGrupo.AfterScroll := sqlConfigGrupoAfterScroll;
  sqlConfigGrupoAfterScroll(sqlConfigGrupo);
  inherited;
end;

procedure TfrmConfig.fmeEditorwptTextoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  fmeEditor.wptTextoKeyPress(Sender, Key);
  if cxBtnAlterar.Enabled then
    ExecuteAlterarExecute(self);
end;

procedure TfrmConfig.fmeEditorbtnInserirImagemClick(Sender: TObject);
begin
  inherited;
  fmeEditor.btnInserirImagemClick(Sender);

end;

procedure TfrmConfig.fmeEditorbtnSalvarConfiguracaoClick(Sender: TObject);
begin
  inherited;
  fmeEditor.GravarParametrosConfig(sqlConfigGrupoDESCRICAO.AsString, ClientAncestralSECAO.AsString);
  ExecuteAlterarExecute(self);
end;

procedure TfrmConfig.fmeEditorbtnSaveImagemClick(Sender: TObject);
begin
  inherited;
  fmeEditor.btnSaveImagemClick(Sender);

end;

procedure TfrmConfig.Time1Click(Sender: TObject);
begin
  inherited;
  ActiveRTFEdit(fmeEditor.wptTexto).InputTextField(
           TWPTextFieldType((Sender as TMenuItem).Tag));
end;

function TfrmConfig.WhereSistemaID(
  const vpAliasConfiguracaoGrupo: string): string;
begin
  Result := 'WHERE ';

  Result := Result + IfThen(
    not vpAliasConfiguracaoGrupo.IsEmpty,
    vpAliasConfiguracaoGrupo + '.') + 'SISTEMA_ID ';

  if FSistemaList.HasValue then
  begin
    Result := Result +
      string.Format(
        'IN (%s)',
        [CriterioSistemaID]);

    Exit;
  end;

  Result := Result + string.Format(
    '= %d',
    [IfThen(
      CompareValue(
        vgId,
        20) = EqualsValue,
      5,
      vgId)]);
end;

procedure TfrmConfig.cxGridBasicaDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.RecordViewInfo.GridRecord.Values[5] <> 'S' then //Parâmetro Não Atualizado
    ACanvas.Brush.Color := clRed;
end;

procedure TfrmConfig.cxGridDBTableView1SISTEMA_IDGetDisplayText(
  Sender: TcxCustomGridTableItem; ARecord: TcxCustomGridRecord;
  var AText: string);
{$REGION 'Variáveis'}
var
  viSistemaID: Integer;
{$ENDREGION}
begin
  inherited;

  if not FSistemaList.HasValue then
    Exit;

  if AText.IsEmpty then
    Exit;

  viSistemaID := RetornaNumerico(
    AText).ToInteger;

  AText := FSistemaList.Value.Single(
    function(
      const vpValue: ISistema): Boolean
    begin
      Result := CompareValue(
        vpValue.ID,
        viSistemaID) = EqualsValue;
    end).Descricao;
end;

end.
