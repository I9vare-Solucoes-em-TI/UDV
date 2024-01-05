unit ConfigRelatorios;

interface

uses
  I9Query,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadBasico, FMTBcd, cxTextEdit, cxDBEdit,
  cxControls, cxContainer, cxEdit, cxLabel, DB, DBClient, Provider, SqlExpr,
  ActnList, ComCtrls, StdCtrls, cxButtons, ExtCtrls,
  cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, SimpleDS, frxClass,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxSplitter, cxCheckBox, Menus, Buttons,
  Data.DBXInterBase, System.Actions,
  System.StrUtils, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxNavigator, cxDBData,
  DbxDevartInterBase, dxSkinsCore, dxSkinBlack, dxSkinDevExpressDarkStyle,
  dxSkinDevExpressStyle, dxSkinMcSkin, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  GrupoRelatorios;

type
  TConfiguracaoRelatorio = class
  private
    FConfiguracaoRelatorioID: Integer;
    FDescricao: string;
    FGrupoRelatorios: TGrupoRelatorios;
    FSituacao: Boolean;

    procedure SetConfiguracaoRelatorioID(
      const Value: Integer);

    procedure SetDescricao(
      const Value: string);

    procedure SetGrupoRelatorios(
      const Value: TGrupoRelatorios);

    procedure SetSituacao(
      const Value: Boolean);
  public
    constructor Create; overload;

    constructor Create(
      const vpConfiguracaoRelatorioID: Integer;
      const vpDescricao: string;
      const vpSituacao: Boolean); overload;

    constructor Create(
      const vpConfiguracaoRelatorioID: Integer;
      const vpDescricao: string;
      const vpGrupoRelatorios: TGrupoRelatorios;
      const vpSituacao: Boolean); overload;

    property ConfiguracaoRelatorioID: Integer read FConfiguracaoRelatorioID
      write SetConfiguracaoRelatorioID;

    property Descricao: string read FDescricao write SetDescricao;

    property GrupoRelatorios: TGrupoRelatorios read FGrupoRelatorios
      write SetGrupoRelatorios;

    property Situacao: Boolean read FSituacao write SetSituacao;
  end;

  TfrmConfigRelatorios = class(TfrmCadBasico)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    grdConfRel: TcxGrid;
    grdConfRelDBTableView1: TcxGridDBTableView;
    grdConfRelLevel1: TcxGridLevel;
    grdConfRelDBTableView1CONFIG_RELATORIO_ID: TcxGridDBColumn;
    grdConfRelDBTableView1DESCRICAO: TcxGridDBColumn;
    ClientAncestralCONFIG_RELATORIO_ID: TBCDField;
    ClientAncestralDESCRICAO: TStringField;
    cxSplitter1: TcxSplitter;
    cxLabel5: TcxLabel;
    sqlGrupoRelatorio: TI9Query;
    dsGrupoRelatorio: TDataSource;
    sqlGrupoRelatorioGRUPO_RELATORIO_ID: TBCDField;
    sqlGrupoRelatorioDESCRICAO: TStringField;
    ClientAncestralGRUPO_RELATORIO_ID: TBCDField;
    ClientAncestralSISTEMA_ID: TBCDField;
    grdConfRelDBTableView1GRUPO_RELATORIO_ID: TcxGridDBColumn;
    ClientAncestralSITUACAO: TStringField;
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
    chbEditar: TcxDBCheckBox;
    ClientAncestralEDITAR: TStringField;
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
    WPath: String;
    vlId, vlId1 : Integer;
    function CarregaHistorico: Boolean;
    function GetRelatorio(vCampo: string): string;
  public
    { Public declarations }
    procedure LoadData; override;
    procedure SetState(AState: TDataSetState); override;
  end;

var
  frmConfigRelatorios: TfrmConfigRelatorios;

implementation

uses Controles, Rotinas, VisualizaRelatorios, Pesquisa;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure TfrmConfigRelatorios.ExecuteGravarExecute(Sender: TObject);
begin
  ClientAncestralSISTEMA_ID.AsInteger := vlId;
  inherited;

end;

procedure TfrmConfigRelatorios.FormCreate(Sender: TObject);
begin
  WPath := vgDiretorioCorrente + '\';
  sqlGrupoRelatorio.Connection := dtmControles.DB;
  CriarFuncoesRelatorio(frxRelatorio);
  inherited;

  vlId1 := vgId;
  vlId  := vgId;
  if vgId = 20 then
  begin
    vlId  := 5;
    vlId1 := 17;
  end;

  sqlGrupoRelatorio.Close;
  sqlGrupoRelatorio.Params[0].AsInteger := vlId;
  sqlGrupoRelatorio.Params[1].AsInteger := vlId1;
  sqlGrupoRelatorio.Open;

  DataSetAncestral.Close;
  DataSetAncestral.Params[0].AsInteger := vlId;
  DataSetAncestral.Params[1].AsInteger := vlId1;
  ClientAncestral.Close;
  ClientAncestral.Open;

  vgNomeTabela := 'G_CONFIG_RELATORIO';
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
  grdConfRel.Enabled := pnlRelatorio.Enabled;
end;

procedure TfrmConfigRelatorios.btnRelatorioClick(Sender: TObject);
begin
  inherited;
  vgVersao1 := 0;
  vgVersao2 := 0;

  try
    CarregaRelatorio(ClientAncestralCONFIG_RELATORIO_ID.AsString, GetRelatorio('RELATORIO'), frxRelatorio);
    try
      frxRelatorio.Variables.Variables['vgNomeCartorio'] :=
        QuotedStr(dtmControles.BuscarConfig('PRINCIPAL', 'CARTORIO',
        'NOME', 'S'));
      frxRelatorio.Variables.Variables['vgLogin'] := QuotedStr(vgLogin);
    except
    end;
    frxRelatorio.DesignReport();
    GravarRelatorio(ClientAncestralCONFIG_RELATORIO_ID.AsString);

    ClientAncestral.Close;
    ClientAncestral.Open;
  except
    on E: Exception do
    begin
      Application.MessageBox(PChar(E.Message), 'Atenção', MB_ICONWARNING + MB_OK);
    end;
  end;
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
  ClientAncestralINTERNO.AsString := 'N';
  edtDescricao.SetFocus;
end;

procedure TfrmConfigRelatorios.ExecuteAlterarExecute(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

function TfrmConfigRelatorios.CarregaHistorico: Boolean;
var
  Rel: TStringList;
  viCampoHistorico, Caminho, Historico, ID: string;
begin
//  Result := False;
//  if Trim(ClientAncestralHISTORICO.AsString) <> '' then
//  begin
//    ID := ClientAncestralCONFIG_RELATORIO_ID.AsString;
//    Caminho := WPath + ID + '.fr3';
//    Historico := WPath + 'H' + ID + '.fr3';
//    Rel := TStringList.Create;
//    Rel.Text := DeCompressString(ClientAncestralHISTORICO.AsString);
//    Rel.SaveToFile(Caminho);
//    Rel.SaveToFile(Historico);
//    Application.ProcessMessages;
//    Rel.Free;
//    vgVersao1 := DataHoraModificacao(Caminho);
//    frxRelatorio.Clear;
//    frxRelatorio.LoadFromFile
//      (WPath + IntToStr(ClientAncestralCONFIG_RELATORIO_ID.AsInteger) + '.fr3');
//    Result := True;
//  end;

  Result := False;

  viCampoHistorico := GetRelatorio('HISTORICO');
  if Trim(viCampoHistorico) <> '' then
  begin
    ID := ClientAncestralCONFIG_RELATORIO_ID.AsString;
    Caminho   := WPath + ID + '.fr3';
    Historico := WPath + 'H' + ID + '.fr3';
    Rel := TStringList.Create;
    Rel.Text := DeCompressString(AnsiString(viCampoHistorico));
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

function TfrmConfigRelatorios.frxRelatorioUserFunction(const MethodName: String;
  var Params: Variant): Variant;
begin
  inherited;
  Result := ExecutarFuncoesRelatorio(MethodName, Params);
end;

procedure TfrmConfigRelatorios.ExportarRelatrios1Click(Sender: TObject);
var
  ExpRel: TStringList;
  Caminho: String;
begin
  inherited;
  if not ClientAncestral.IsEmpty then
  begin
    Caminho := vgDiretorioCorrente + '\Rel\';
    if not DirectoryExists(Caminho) then
      MkDir(Caminho);
    ExpRel := TStringList.Create;

    with CreateMessageDialog('Deseja Exportar?', mtConfirmation,
      [mbYes, MbNo, mbCancel]) do
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
        while not ClientAncestral.Eof do
        begin
          ExpRel.Clear;
          ExpRel.Text := DeCompressString(GetRelatorio('RELATORIO'));
          //ExpRel.Text := GetRelatorio('RELATORIO');
          ExpRel.SaveToFile(Caminho + ClientAncestralDESCRICAO.AsString + '.rtl');
          Application.ProcessMessages;
          ClientAncestral.Next;

        end;
        ClientAncestral.EnableControls;
      end
      else
      begin
        ExpRel.Clear;
        ExpRel.Text := DeCompressString(GetRelatorio('RELATORIO'));
        //ExpRel.Text := GetRelatorio('RELATORIO');
        ExpRel.SaveToFile(Caminho + ClientAncestralDESCRICAO.AsString + '.rtl');
        Application.ProcessMessages;

      end;
    end;
    ExpRel.Free;
  end;
end;

procedure TfrmConfigRelatorios.ImportarRelatrio1Click(Sender: TObject);
var
  vSqlRelatorio : TI9Query;
begin
  inherited;
//  if not ClientAncestral.IsEmpty then
//    if OpenDialog1.Execute then
//      if FileExists(OpenDialog1.FileName) then
//      begin
//        ClientAncestral.Edit;
//        ClientAncestralRELATORIO.LoadFromFile(OpenDialog1.FileName);
//        (*ClientAncestralRELATORIO.AsString :=
//          CompressString(dtmControles.Cripto.CriptoHexToText
//          (ClientAncestralRELATORIO.AsString));*)
//        ClientAncestral.Post;
//        ClientAncestral.ApplyUpdates(-1);
//      end;

  if not ClientAncestral.IsEmpty then
  begin
    if OpenDialog1.Execute then
    begin
      if FileExists(OpenDialog1.FileName) then
      begin

        vSqlRelatorio := TI9Query.Create(Application);
        vSqlRelatorio.Connection := dtmControles.DB;

        with vSqlRelatorio do
        begin
          Active := False;

          SQL.Text :=
            'UPDATE G_CONFIG_RELATORIO '+
            ' SET RELATORIO = :RELATORIO '+
            ' WHERE CONFIG_RELATORIO_ID = :CONFIG_RELATORIO_ID ';


          ParamByName('RELATORIO').ParamType := ptInput;
          ParamByName('RELATORIO').DataType  := ftBlob;
          ParamByName('RELATORIO').LoadFromFile(OpenDialog1.FileName, ftBlob);
          ParamByName('CONFIG_RELATORIO_ID').ParamType := ptInput;
          ParamByName('CONFIG_RELATORIO_ID').DataType  := ftInteger;
          ParamByName('CONFIG_RELATORIO_ID').AsString  := ClientAncestralCONFIG_RELATORIO_ID.AsString;
          Execute;
        end;

        vSqlRelatorio.Free;
      end;
    end;
  end;
end;

procedure TfrmConfigRelatorios.GerarRotina1Click(Sender: TObject);
var
  Sql, ID, MenuID, ChaveRotina: String;
begin
  inherited;
  MenuID := dtmControles.GetStr('SELECT SISTEMA_MENU_ID FROM G_SISTEMA_MENU ' +
    'WHERE SISTEMA_ID = ' + IntToStr(vlId) + '   AND DESCRICAO = ' +
    QuotedStr(IfThen(vlId = 1, 'Relatório', 'Impressões')));
  if MenuID <> '' then
  begin
    ChaveRotina := 'REL_' + ClientAncestralCONFIG_RELATORIO_ID.AsString;
    Sql := 'SELECT SISTEMA_ROTINA_ID FROM G_SISTEMA_ROTINA ' +
      'WHERE SISTEMA_MENU_ID = ' + MenuID + '  AND CHAVE_ROTINA = ' +
      QuotedStr(ChaveRotina);

    if dtmControles.GetInt(Sql) = 0 then
    begin
      dtmControles.StartTransaction;
      try
        ID := dtmControles.GerarSequencia('G_SISTEMA_ROTINA');
        Sql := ' INSERT INTO G_SISTEMA_ROTINA (SISTEMA_ROTINA_ID, CHAVE_ROTINA, '
          + ' DESCRICAO, SISTEMA_MENU_ID) ' + ' VALUES ( ' + ID + ', ' +
          QuotedStr(ChaveRotina) + ', ' +
          QuotedStr(ClientAncestralDESCRICAO.AsString) + ', ' + MenuID + ')';
        dtmControles.ExecSQL(Sql);
        dtmControles.Commit;
      except
        dtmControles.Roolback;
      end;
    end
    else
      Application.MessageBox('Já foi criada uma rotina para este relatório!',
        'Atenção', MB_OK + MB_ICONWARNING);
  end
  else
    Application.MessageBox('Grupo relatório não encontrado!', 'Atenção',
      MB_OK + MB_ICONWARNING);

  inherited;

end;

function TfrmConfigRelatorios.GetRelatorio(vCampo: string): string;
begin
  with dtmControles.SimpleAuxiliar do
  begin
    Active := False;
    SQL.Text :=
      ' SELECT ' + vCampo +
      ' FROM G_CONFIG_RELATORIO ' +
      ' WHERE CONFIG_RELATORIO_ID = :CONFIG_RELATORIO_ID ';

    Params[0].AsCurrency := ClientAncestralCONFIG_RELATORIO_ID.AsCurrency;
    Active := True;
  end;

  Result := dtmControles.SimpleAuxiliar.Fields[0].AsString;

  dtmControles.SimpleAuxiliar.Active := False;
end;

procedure TfrmConfigRelatorios.btnGrupoRelatorioClick(Sender: TObject);
var
  Aux: String;
begin
  inherited;
  Aux := vgPermissaoRotina;
  vgPermissaoRotina := dtmControles.CodPermissao('CAD_GRUPOREL');
  if vgPermissaoRotina = '000000' then
  begin
    Application.MessageBox('Usuário não tem permissão de acessar esta rotina!',
      'Atenção', MB_OK + MB_ICONWARNING);
    Abort;
  end;
  ExibirFormulario(TfrmGrupoRelatorio, frmGrupoRelatorio, True);
  vgPermissaoRotina := Aux;
  sqlGrupoRelatorio.Refresh;
end;

{ TConfiguracaoRelatorio }

constructor TConfiguracaoRelatorio.Create(
  const vpConfiguracaoRelatorioID: Integer;
  const vpDescricao: string;
  const vpGrupoRelatorios: TGrupoRelatorios;
  const vpSituacao: Boolean);
begin
  Create(vpConfiguracaoRelatorioID, vpDescricao, vpSituacao);
  GrupoRelatorios := vpGrupoRelatorios;
end;

constructor TConfiguracaoRelatorio.Create;
begin
  inherited;
end;

constructor TConfiguracaoRelatorio.Create(
  const vpConfiguracaoRelatorioID: Integer;
  const vpDescricao: string;
  const vpSituacao: Boolean);
begin
  Create;

  ConfiguracaoRelatorioID := vpConfiguracaoRelatorioID;
  Descricao := vpDescricao;
  Situacao := vpSituacao;
end;

procedure TConfiguracaoRelatorio.SetConfiguracaoRelatorioID(
  const Value: Integer);
begin
  FConfiguracaoRelatorioID := Value;
end;

procedure TConfiguracaoRelatorio.SetDescricao(
  const Value: string);
begin
  FDescricao := Value;
end;

procedure TConfiguracaoRelatorio.SetGrupoRelatorios(
  const Value: TGrupoRelatorios);
begin
  FGrupoRelatorios := Value;
end;

procedure TConfiguracaoRelatorio.SetSituacao(
  const Value: Boolean);
begin
  FSituacao := Value;
end;

end.
