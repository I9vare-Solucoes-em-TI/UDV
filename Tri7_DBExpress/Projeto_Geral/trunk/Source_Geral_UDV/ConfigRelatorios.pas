unit ConfigRelatorios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, cxLookAndFeelPainters, FMTBcd, cxTextEdit, cxDBEdit,
  cxControls, cxContainer, cxEdit, cxLabel, DB, DBClient, Provider,
  SqlExpr, ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxGridCustomView, cxGrid, cxMemo, SimpleDS, frxClass,
  frxDBSet, frxDesgn, frxDCtrl, frxGZip, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxSplitter, cxCheckBox, cxImageComboBox, Menus, Buttons, cxLookAndFeels,
  cxNavigator;
type
  TfrmConfigRelatorios = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    grdConfRel: TcxGrid;
    grdConfRelDBTableView1: TcxGridDBTableView;
    grdConfRelLevel1: TcxGridLevel;
    grdConfRelDBTableView1CONFIG_RELATORIO_ID: TcxGridDBColumn;
    grdConfRelDBTableView1DESCRICAO: TcxGridDBColumn;
    ClientAncestralCONFIG_RELATORIO_ID: TFMTBCDField;
    ClientAncestralDESCRICAO: TStringField;
    ClientAncestralRELATORIO: TBlobField;
    cxSplitter1: TcxSplitter;
    cxLabel5: TcxLabel;
    sqlGrupoRelatorio: TSimpleDataSet;
    dsGrupoRelatorio: TDataSource;
    sqlGrupoRelatorioGRUPO_RELATORIO_ID: TFMTBCDField;
    sqlGrupoRelatorioDESCRICAO: TStringField;
    ClientAncestralGRUPO_RELATORIO_ID: TFMTBCDField;
    ClientAncestralSISTEMA_ID: TFMTBCDField;
    grdConfRelDBTableView1GRUPO_RELATORIO_ID: TcxGridDBColumn;
    ClientAncestralSITUACAO: TStringField;
    ClientAncestralHISTORICO: TBlobField;
    pnlRelatorio: TPanel;
    ClientAncestralINTERNO: TStringField;
    frxRelatorio: TfrxReport;
    PopupMenu1: TPopupMenu;
    ExportarRelatrios1: TMenuItem;
    ImportarRelatrio1: TMenuItem;
    OpenDialog1: TOpenDialog;
    N1: TMenuItem;
    GerarRotina1: TMenuItem;
    edtCodigo: TcxDBTextEdit;
    chbSituacao: TcxDBCheckBox;
    chbUsointerno: TcxDBCheckBox;
    edtDescricao: TcxDBTextEdit;
    lcbGrupoRelatorio: TcxDBLookupComboBox;
    btnGrupoRelatorio: TcxButton;
    btnHistorico: TcxButton;
    btnRelatorio: TcxButton;
    procedure ExecuteGravarExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExecuteIncluirExecute(Sender: TObject);
    procedure ExecuteAlterarExecute(Sender: TObject);
    procedure btnHistoricoClick(Sender: TObject);
    procedure ExecutePesquisaExecute(Sender: TObject);
    function frxRelatorioUserFunction(const MethodName: String;
      var Params: Variant): Variant;
    procedure ExportarRelatrios1Click(Sender: TObject);
    procedure ImportarRelatrio1Click(Sender: TObject);
    procedure GerarRotina1Click(Sender: TObject);
    procedure btnGrupoRelatorioClick(Sender: TObject);
  private
    { Private declarations }
    WPath : String;
    function CarregaHistorico : Boolean;

  public
    { Public declarations }
    procedure LoadData; override;
    procedure SetState (AState : TDataSetState);override;
  end;

var
  frmConfigRelatorios: TfrmConfigRelatorios;

implementation

uses Controles, Rotinas, VisualizaRelatorios, Pesquisa, GrupoRelatorios;

{$R *.dfm}

procedure TfrmConfigRelatorios.ExecuteGravarExecute(Sender: TObject);
begin
  ClientAncestralSISTEMA_ID.AsInteger := vgId;
  inherited;

end;

procedure TfrmConfigRelatorios.FormCreate(Sender: TObject);
begin
  WPath           := vgDiretorioCorrente + '\';
  sqlGrupoRelatorio.Connection := dtmControles.DB;
  CriarFuncoesRelatorio(frxRelatorio);
  inherited;
  sqlGrupoRelatorio.Close;
  sqlGrupoRelatorio.DataSet.Params[0].AsInteger := vgId;
  sqlGrupoRelatorio.Open;

  DataSetAncestral.Close;
  DataSetAncestral.Params[0].AsInteger := vgId;
  ClientAncestral.Close;
  ClientAncestral.Open;

  vgNomeTabela    := 'G_CONFIG_RELATORIO';
  vgChavePrimaria := 'CONFIG_RELATORIO_ID';

end;

procedure TfrmConfigRelatorios.LoadData;
begin
  if Trim(vgChave) <> '' then
     ClientAncestral.Locate('CONFIG_RELATORIO_ID', vgChave, [loCaseInsensitive]);
  inherited;
end;

procedure TfrmConfigRelatorios.SetState(AState: TDataSetState);
begin
  inherited;
  pnlRelatorio.Enabled := State = dsBrowse;
  grdConfRel.Enabled   := pnlRelatorio.Enabled;
end;

procedure TfrmConfigRelatorios.btnRelatorioClick(Sender: TObject);
begin
  inherited;
  vgVersao1 := 0;
  vgVersao2 := 0;
  CarregaRelatorio(ClientAncestralCONFIG_RELATORIO_ID.AsString, ClientAncestralRELATORIO.AsString, frxRelatorio);
  try
    frxRelatorio.Variables.Variables['vgNomeCartorio'] := QuotedStr(dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO', 'NOME', 'S'));  frxRelatorio.Variables.Variables['vgLogin'] := QuotedStr(vgLogin);;
  except
  end;
  frxRelatorio.DesignReport;
  GravarRelatorio(ClientAncestralCONFIG_RELATORIO_ID.AsString);
  ClientAncestral.Refresh;
end;

procedure TfrmConfigRelatorios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  sqlGrupoRelatorio.Close;
  Action := caFree;
  frmConfigRelatorios := nil;

end;

procedure TfrmConfigRelatorios.ExecuteIncluirExecute(Sender: TObject);
begin
  inherited;
  ClientAncestralSITUACAO.AsString := 'A';
  ClientAncestralINTERNO.AsString  := 'N';
  edtDescricao.SetFocus;
end;

procedure TfrmConfigRelatorios.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TfrmConfigRelatorios.CarregaHistorico : Boolean;
var Rel : TStringList;
    Caminho, Historico, ID :  string;
begin
  Result := False;
  if Trim(ClientAncestralHISTORICO.AsString) <> '' then
  begin
    ID := ClientAncestralCONFIG_RELATORIO_ID.AsString;
    Caminho   := WPath + ID + '.fr3';
    Historico := WPath + 'H' + ID + '.fr3';
    Rel := TStringList.Create;
    Rel.Text := DeCompressString(ClientAncestralHISTORICO.AsString);
    Rel.SaveToFile(Caminho);
    Rel.SaveToFile(Historico);
    Application.ProcessMessages;
    Rel.Free;
    vgVersao1 := DataHoraModificacao(Caminho);
    frxRelatorio.Clear;
    frxRelatorio.LoadFromFile(WPath + IntToStr(ClientAncestralCONFIG_RELATORIO_ID.AsInteger) + '.fr3');
    Result := True;
  end;
end;

procedure TfrmConfigRelatorios.btnHistoricoClick(Sender: TObject);
begin
  inherited;
  vgVersao1 := 0;
  vgVersao2 := 0;
  if CarregaHistorico then
  begin
    frxRelatorio.DesignReport;
    GravarRelatorio(ClientAncestralCONFIG_RELATORIO_ID.AsString);
    ClientAncestral.Refresh;
  end;
end;

procedure TfrmConfigRelatorios.ExecutePesquisaExecute(Sender: TObject);
begin
  inherited;
  vgChave := PesqConfigRelatorio;
  LoadData;

end;

function TfrmConfigRelatorios.frxRelatorioUserFunction(
  const MethodName: String; var Params: Variant): Variant;
begin
  inherited;
  Result := ExecutarFuncoesRelatorio(MethodName, Params);
end;

procedure TfrmConfigRelatorios.ExportarRelatrios1Click(Sender: TObject);
var ExpRel : TStringList;
    Caminho : String;
begin
  inherited;
  if not ClientAncestral.IsEmpty then
  begin
    Caminho := vgDiretorioCorrente + '\Rel\';
    if not DirectoryExists(Caminho) then
       MkDir(Caminho);
    ExpRel := TStringList.Create;

    with CreateMessageDialog('Deseja Exportar?', mtConfirmation, [mbYes, MbNo, mbCancel]) do
    begin
      Caption := 'Exportar';
      (FindComponent('YES') as TButton).Caption := 'Todos';
      (FindComponent('NO') as TButton).Caption := 'Atual';
      (FindComponent('CANCEL') as TButton).Caption := 'Cancelar';
      ShowModal;

      if (ModalResult = mrYes) then
      begin
        ClientAncestral.DisableControls;
        ClientAncestral.First;
        while not ClientAncestral.Eof  do
        begin
          ExpRel.Clear;
          ExpRel.Text := dtmControles.Cripto.TextToCriptoHex(DeCompressString(ClientAncestralRELATORIO.AsString));
          ExpRel.SaveToFile(Caminho + ClientAncestralDESCRICAO.AsString + '.rtl');
          Application.ProcessMessages;
          ClientAncestral.Next;
        end;
        ClientAncestral.EnableControls;
      end
      else begin
           ExpRel.Clear;
           ExpRel.Text := dtmControles.Cripto.TextToCriptoHex(DeCompressString(ClientAncestralRELATORIO.AsString));
           ExpRel.SaveToFile(Caminho + ClientAncestralDESCRICAO.AsString + '.rtl');
           Application.ProcessMessages;
      end;
    end;
    ExpRel.Free;
  end;
end;

procedure TfrmConfigRelatorios.ImportarRelatrio1Click(Sender: TObject);
begin
  inherited;
  if not ClientAncestral.IsEmpty then
    if OpenDialog1.Execute then
      if FileExists(OpenDialog1.FileName) then
      begin
        ClientAncestral.Edit;
        ClientAncestralRELATORIO.LoadFromFile(OpenDialog1.FileName);
        ClientAncestralRELATORIO.AsString := CompressString(dtmControles.Cripto.CriptoHexToText(ClientAncestralRELATORIO.AsString));
        ClientAncestral.Post;
        ClientAncestral.ApplyUpdates(-1);
      end;
end;

procedure TfrmConfigRelatorios.GerarRotina1Click(Sender: TObject);
var Sql, ID, MenuID, ChaveRotina : String;
begin
  inherited;
  MenuID := dtmControles.GetStr('SELECT SISTEMA_MENU_ID FROM G_SISTEMA_MENU ' +
                                'WHERE SISTEMA_ID = ' + IntToStr(vgId) +
                                '   AND DESCRICAO = ' + QuotedStr('Impressões'));
  if MenuID <> '' then
  begin
    ChaveRotina := 'REL_' + ClientAncestralCONFIG_RELATORIO_ID.AsString;
    Sql := 'SELECT SISTEMA_ROTINA_ID FROM G_SISTEMA_ROTINA ' +
           'WHERE SISTEMA_MENU_ID = ' + MenuID +
           '  AND CHAVE_ROTINA = ' + QuotedStr(ChaveRotina);

    if dtmControles.GetInt(Sql) = 0 then
    begin
      try
        dtmControles.StartTransaction;
        ID     := dtmControles.GerarSequencia('G_SISTEMA_ROTINA');
        Sql := ' INSERT INTO G_SISTEMA_ROTINA (SISTEMA_ROTINA_ID, CHAVE_ROTINA, '+
               ' DESCRICAO, SISTEMA_MENU_ID) '+
               ' VALUES ( ' + ID + ', ' +
                              QuotedStr(ChaveRotina) + ', ' +
                              QuotedStr(ClientAncestralDESCRICAO.AsString) + ', ' +
                              MenuID + ')';
        dtmControles.ExecSQL(Sql);
        dtmControles.Commit;
      except
        dtmControles.Roolback;
      end;
    end
    else Application.MessageBox('Já foi criada uma rotina para este relatório!', 'Atenção', MB_OK + MB_ICONWARNING);
  end
  else Application.MessageBox('Grupo relatório não encontrado!', 'Atenção', MB_OK + MB_ICONWARNING);

  inherited;

end;

procedure TfrmConfigRelatorios.btnGrupoRelatorioClick(Sender: TObject);
var Aux : String;
begin
  inherited;
  Aux := vgPermissaoRotina;
  vgPermissaoRotina := dtmControles.CodPermissao('CAD_GRUPOREL');
  if vgPermissaoRotina = '000000' then
  begin
    Application.MessageBox('Usuário não tem permissão de acessar esta rotina!', 'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  ExibirFormulario(TfrmGrupoRelatorio, frmGrupoRelatorio, True);
  vgPermissaoRotina := Aux;
  sqlGrupoRelatorio.Refresh;
end;

end.
