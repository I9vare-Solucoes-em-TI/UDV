unit ConfigIndividual;

interface

uses
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
  DbxDevartInterBase;

type
  TtipoParametro = array[1..6] of string[15];

type
  TfrmConfigIndividual = class(TfrmCadBasico)
    cxSplitter1: TcxSplitter;
    sqlConfigGrupo: TSimpleDataSet;
    dtsConfigGrupo: TDataSource;
    sqlConfigGrupoCONFIG_GRUPO_ID: TFMTBCDField;
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
    ClientAncestralCONFIG_ID: TFMTBCDField;
    ClientAncestralCONFIG_GRUPO_ID: TFMTBCDField;
    ClientAncestralCONFIG_PADRAO_ID: TFMTBCDField;
    ClientAncestralSECAO: TStringField;
    ClientAncestralNOME: TStringField;
    ClientAncestralVALOR: TStringField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralTEXTO: TBlobField;
    ClientAncestralTERMINAL: TStringField;
    sqlValoresPadrao: TSimpleDataSet;
    dtsValoresPadrao: TDataSource;
    sqlValoresTabela: TSimpleDataSet;
    dtsValoresTabela: TDataSource;
    ColorDialog: TColorDialog;
    ClientAncestralTIPO_VALOR: TStringField;
    sqlValoresPadraoCONFIG_PADRAO_VALOR_ID: TFMTBCDField;
    sqlValoresPadraoCONFIG_PADRAO_ID: TFMTBCDField;
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
  private
    vlTipoValor : integer;
    vlGrupo,vlSecao,vlNome : string;

    procedure CarregarParametros;

  public
    procedure SetState (AState : TDataSetState);override;
    procedure LoadData;override;
    procedure ObterPortasImpressora;

  end;

var
  frmConfigIndividual: TfrmConfigIndividual;
  vgSecaoConfig, vgNomeConfig, vgGrupoConfig : TStringList;

const
  vlTipoParametro : TtipoParametro = ('Descritivo', 'Impressora', 'Padrao', 'Tabela', 'Cor', 'Texto');

implementation

uses Controles, DateUtils, Math, Rotinas;

{$R *.dfm}

procedure TfrmConfigIndividual.FormCreate(Sender: TObject);
begin
  inherited;

  sqlConfigGrupo.Connection   := dtmControles.DB;
  sqlValoresPadrao.Connection := dtmControles.DB;
  sqlValoresTabela.Connection := dtmControles.DB;

  PanelData.Enabled := True;
  ObterPortasImpressora;
end;

procedure TfrmConfigIndividual.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  sqlConfigGrupo.Active   := False;
  sqlValoresPadrao.Active := False;
  sqlValoresTabela.Active := False;

  dtmControles.sqlConfig.Refresh;

  Action := caFree;
  frmConfigIndividual := nil;
end;

procedure TfrmConfigIndividual.SetState(AState: TDataSetState);
begin
  inherited;
  PanelData.Enabled   := State in [dsBrowse];
  PanelGrids.Enabled  := State = dsBrowse;
  cxGridGrupo.Enabled := State = dsBrowse;
  pgcValores.Enabled  := State in [dsInsert, dsEdit];
end;

procedure TfrmConfigIndividual.sqlConfigGrupoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  SetState(dsBrowse);
end;

procedure TfrmConfigIndividual.ExecuteGravarExecute(Sender: TObject);
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
  pgcValores.Enabled := False;

  if ClientAncestralNOME.AsString = 'DEFINIR_VALOR_MARGEM' then
    ClientAncestral.Refresh;

  if tabTexto.TabVisible then
  begin
    pgcPesquisa.ActivePage := tabTexto;
    ClientAncestralAfterScroll(ClientAncestral);
  end;
  dtmControles.sqlConfig.Refresh;
end;

procedure TfrmConfigIndividual.ClientAncestralBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if State in [dsInsert] then
    ClientAncestral.FieldByName('CONFIG_ID').AsCurrency :=  dtmControles.GerarSequencia('T_CONFIG');
end;

procedure TfrmConfigIndividual.CarregarParametros;
var i : integer;
begin
  vlGrupo := '';
  vlSecao := '';
  vlNome := '';
  //GRUPO
  for i := 0 to vgGrupoConfig.Count -1 do
  begin
    if vlGrupo = '' then
    begin
      vlGrupo := vgGrupoConfig.Strings[i];
      vlSecao := vgSecaoConfig.Strings[i];
      vlNome := vgNomeConfig.Strings[i];
    end
    else
    begin
      vlGrupo := vlGrupo + ', '+vgGrupoConfig.Strings[i];
      vlSecao := vlSecao + ', '+vgSecaoConfig.Strings[i];
      vlNome  := vlNome + ', '+vgNomeConfig.Strings[i];
    end;
  end;

end;

procedure TfrmConfigIndividual.ClientAncestralAfterScroll(DataSet: TDataSet);
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
    sqlValoresPadrao.DataSet.ParamByName('CONFIG_PADRAO_ID').AsBCD := ClientAncestralCONFIG_PADRAO_ID.AsCurrency;
    sqlValoresPadrao.Active := True;

    HabilitaTab(False, False, True, False, False, False, False);
    lcbValoresPadrao.EditValue := ClientAncestralVALOR.AsString;
  end;

  procedure ConfigurarValoresTabela;
  begin
    HabilitaTab(False, False, False, True, False, False, False);

    try
      ExecutaSimpleDSAux(' SELECT TABELA, KEYFIELD, LISTFIELD '+
                         ' FROM G_CONFIG_PADRAO '+
                         ' WHERE CONFIG_PADRAO_ID = '+ ClientAncestralCONFIG_PADRAO_ID.AsString,0);

      // Montar o sql dos Valores da Tabela Padrao
      sqlValoresTabela.Active := False;
      sqlValoresTabela.DataSet.CommandText := ' SELECT '+  dtmControles.SimpleAuxiliar.FieldByName('KEYFIELD').AsString+', '+
                                                           dtmControles.SimpleAuxiliar.FieldByName('LISTFIELD').AsString+
                                              ' FROM '+ dtmControles.SimpleAuxiliar.FieldByName('TABELA').AsString+
                                              ' ORDER BY '+dtmControles.SimpleAuxiliar.FieldByName('LISTFIELD').AsString;
      sqlValoresTabela.Active := True;

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

procedure TfrmConfigIndividual.ObterPortasImpressora;
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

procedure TfrmConfigIndividual.cxButton1Click(Sender: TObject);
begin
  inherited;
  ColorDialog.Execute;
  cbxValorCor.EditValue := ColorDialog.Color;
end;

procedure TfrmConfigIndividual.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  pgcValores.Enabled := True;
  PanelData.Enabled  := True;
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

procedure TfrmConfigIndividual.ExecuteCancelarExecute(Sender: TObject);
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
  ClientAncestralAfterScroll(ClientAncestral);
end;

procedure TfrmConfigIndividual.ClientAncestralCalcFields(DataSet: TDataSet);
begin
  inherited;
//  if ClientAncestralTIPO_VALOR.AsString = '4' then
//       ClientAncestralcalc_Valor.AsString := lcbValoresTabela.Text
  ClientAncestralcalc_Valor.AsString := ClientAncestralVALOR.AsString;
end;

procedure TfrmConfigIndividual.ExecuteIncluirExecute(Sender: TObject);
begin
//  inherited;

end;

procedure TfrmConfigIndividual.ExecutePesquisaExecute(Sender: TObject);
begin
//  inherited;

end;

procedure TfrmConfigIndividual.mniDuplicarParametroClick(Sender: TObject);
begin
  inherited;
  PanelData.Visible   := False;
  pnlDuplicar.Visible := True;
  PanelGrids.Enabled  := False;
end;

procedure TfrmConfigIndividual.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if not pnlDuplicar.Visible then
    inherited;

end;

procedure TfrmConfigIndividual.btnCancelarClick(Sender: TObject);
begin
  inherited;
  PanelData.Visible   := True;
  pnlDuplicar.Visible := False;
  PanelGrids.Enabled  := True;
end;

procedure TfrmConfigIndividual.btnDuplicarClick(Sender: TObject);
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
      ExecSQL(FALSE);
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
      try
        dtmControles.StartTransaction;
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
          dtmControles.Roolback;
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

procedure TfrmConfigIndividual.btnTerminalClick(Sender: TObject);
begin
  inherited;
  dtmControles.BuscarIpRede(cbxTerminais);
end;

procedure TfrmConfigIndividual.FormShow(Sender: TObject);
begin
  inherited;

  if State in [dsBrowse] then
    ClientAncestralAfterScroll(ClientAncestral);
end;

procedure TfrmConfigIndividual.mniExcluirParametroClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox ('Confirma exclusão do parâmetro?', 'Confirmar', mb_IconQuestion + mb_YesNo) = idNo then
    exit;

  ClientAncestral.Delete;
  ClientAncestral.ApplyUpdates(-1);
  ClientAncestral.Refresh;  
end;

procedure TfrmConfigIndividual.LoadData;
begin
  ClientAncestral.AfterScroll := nil;
  sqlConfigGrupo.Active := False;
  if vgId = 20 then
       sqlConfigGrupo.DataSet.ParamByName('SISTEMA_ID').AsBCD := 5
  else sqlConfigGrupo.DataSet.ParamByName('SISTEMA_ID').AsBCD := vgId;

  CarregarParametros;

  sqlConfigGrupo.DataSet.CommandText := 'SELECT * FROM G_CONFIG_GRUPO '+
                                        '  WHERE SISTEMA_ID = '+IntToStr(vgId) +
                                        '  AND DESCRICAO IN ('+vlGrupo+')';

  sqlConfigGrupo.Active := True;

  ClientAncestral.Open;
  ClientAncestral.Filtered := False;
  ClientAncestral.Filter := ' SECAO IN ('+vlSecao+') AND NOME IN ('+vlNome+')';
  ClientAncestral.Filtered := True;

  ClientAncestral.AfterScroll := ClientAncestralAfterScroll;
  inherited;
end;

procedure TfrmConfigIndividual.fmeEditorwptTextoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  fmeEditor.wptTextoKeyPress(Sender, Key);
  if cxBtnAlterar.Enabled then
    ExecuteAlterarExecute(self);
end;

procedure TfrmConfigIndividual.fmeEditorbtnSalvarConfiguracaoClick(Sender: TObject);
begin
  inherited;
  fmeEditor.GravarParametrosConfig(sqlConfigGrupoDESCRICAO.AsString, ClientAncestralSECAO.AsString);
  ExecuteAlterarExecute(self);
end;

procedure TfrmConfigIndividual.Time1Click(Sender: TObject);
begin
  inherited;
  ActiveRTFEdit(fmeEditor.wptTexto).InputTextField(
           TWPTextFieldType((Sender as TMenuItem).Tag));
end;

procedure TfrmConfigIndividual.cxGridBasicaDBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
  inherited;
  if AViewInfo.RecordViewInfo.GridRecord.Values[5] <> 'S' then //Parâmetro Não Atualizado
    ACanvas.Brush.Color := clRed;
end;

end.
