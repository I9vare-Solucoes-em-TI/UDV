unit Anotacao;

interface

uses
  CadAuxiliar,
  Classes,
  Controls,
  cxButtons,
  cxCheckBox,
  cxContainer,
  cxControls,
  cxDBEdit,
  cxDropDownEdit,
  cxEdit,
  cxGraphics,
  cxLabel,
  cxLookAndFeelPainters,
  cxLookAndFeels,
  cxMaskEdit,
  cxTextEdit,
  DB,
  DBClient,
  DbxDevartInterBase,
  Dialogs,
  ExtCtrls,
  FireDAC.Comp.Client,
  FireDAC.Comp.DataSet,
  FireDAC.DApt,
  FireDAC.DApt.Intf,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Async,
  FireDAC.Stan.Error,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FMTBcd,
  Forms,
  FrameEditorSimples,
  Graphics,
  I9Query,
  Menus,
  Provider,
  SimpleDS,
  SqlExpr,
  StdCtrls,
  SysUtils,
  Variants,
  Windows, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, dxSkinsCore, dxSkinMcSkin, dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver;

type
  TfrmAnotacao = class(TfrmCadAuxiliar)
    CbxGrupo: TcxDBLookupComboBox;
    chbSituacao: TcxDBCheckBox;
    dtsAnotacao: TDataSource;
    edtDescricao: TcxDBTextEdit;
    fmeEditorSimples: TfmeEditorSimples;
    LblGrupo: TcxLabel;
    lblInformacao: TLabel;
    LblTitulo: TcxLabel;
    PnlTexto: TPanel;
    PnlCampos: TPanel;
    sqlAnotacao: TI9Query;
    sqlAnotacaoANOTACAO_ID: TBCDField;
    sqlAnotacaoDATA: TSQLTimeStampField;
    sqlAnotacaoGRUPO: TStringField;
    sqlAnotacaoMENSAGEM: TBlobField;
    sqlAnotacaoSITUACAO: TStringField;
    sqlAnotacaoTITULO: TStringField;
    sqlAnotacaoUSUARIO_ID: TBCDField;
    sqlAnotacaoSISTEMA_ID: TBCDField;
    sqlAnotacaoGERAL: TStringField;
    PnlAcao: TPanel;
    btnConfirmar: TcxButton;
    btnCancelarItem: TcxButton;
    SqlLookupAnotacaoGrupo: TI9Query;
    StringField3: TStringField;
    DtsLookupAnotacaoGrupo: TDataSource;
    chbExclusivoSistemaOrigem: TcxDBCheckBox;
    sqlAnotacaoEXCLUSIVO_SISTEMA_ORIGEM: TStringField;

    procedure btnCancelarItemClick(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure sqlAnotacaoAfterScroll(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);

  private
    vlAnotacaoId: Integer;

    procedure ConfigurarTela;
  public
    class function AbrirCadastroAnotacao(
      const vpAnotacaoId: Integer): Boolean;
  end;

implementation

uses
  Controles,
  Rotinas,
  Geral.Model.Sistema;

{$R *.dfm}

class function TfrmAnotacao.AbrirCadastroAnotacao(
  const vpAnotacaoId: Integer): Boolean;
var
  viFrmAnotacao: TfrmAnotacao;
begin
  Result := False;
  viFrmAnotacao := nil;
  try
    viFrmAnotacao := TfrmAnotacao.Create(dtmControles.DB);
    viFrmAnotacao.vlAnotacaoId := vpAnotacaoId;

    if viFrmAnotacao.ShowModal = mrOk then
    begin
      Result := True;
      Exit;
    end;

  finally
    FreeAndNil(viFrmAnotacao);
  end;
end;

procedure TfrmAnotacao.btnCancelarItemClick(Sender: TObject);
begin
  inherited;
  Self.ModalResult := mrCancel;
end;

procedure TfrmAnotacao.btnConfirmarClick(Sender: TObject);
begin
  inherited;
  VerificarPreenchimentoEDT_DB(edtDescricao.Text, 'Descrição', edtDescricao);

  if sqlAnotacaoANOTACAO_ID.AsInteger = 0 then
  begin
    sqlAnotacaoANOTACAO_ID.AsInteger := dtmControles.GerarSequencia('G_ANOTACAO');
    sqlAnotacaoUSUARIO_ID.AsInteger := StrToInt(vgUsuarioID);
    sqlAnotacaoSISTEMA_ID.AsInteger := vgId;
    sqlAnotacaoDATA.AsDateTime := dtmControles.DataHoraBanco(3);

    if vgId = CI_COD_SISTEMA_JURIDICO then // Equivale ao sistema financeiro
      sqlAnotacaoEXCLUSIVO_SISTEMA_ORIGEM.AsString := 'S';
  end;

  sqlAnotacaoMENSAGEM.AsAnsiString := CompressString(fmeEditorSimples.wptTexto.AsString);
  sqlAnotacao.Post;

  Self.ModalResult := mrOk;
end;

procedure TfrmAnotacao.ConfigurarTela;
begin
  if vgId = CI_COD_SISTEMA_JURIDICO then // Equivale ao sistema financeiro
  begin
    chbExclusivoSistemaOrigem.Visible := False;
    CbxGrupo.Width := 546;
    chbSituacao.Left := CbxGrupo.Left + CbxGrupo.Width + 4;
  end
  else
  begin
    chbExclusivoSistemaOrigem.Visible := True;
    CbxGrupo.Width := 495;
    chbSituacao.Left := CbxGrupo.Left + CbxGrupo.Width + 4;

    if sqlAnotacaoANOTACAO_ID.AsInteger > 0 then
      chbExclusivoSistemaOrigem.Enabled := vgId = sqlAnotacaoSISTEMA_ID.AsInteger;
  end;
end;

procedure TfrmAnotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmAnotacao.FormCreate(Sender: TObject);
begin
  inherited;
  sqlAnotacao.Connection := dtmControles.DB;
  SqlLookupAnotacaoGrupo.Connection := dtmControles.DB;

  vlAnotacaoId := 0;
end;

procedure TfrmAnotacao.FormShow(Sender: TObject);
begin
  inherited;
  SqlLookupAnotacaoGrupo.Close;
  SqlLookupAnotacaoGrupo.Open;

  sqlAnotacao.Params.ParamByName('ANOTACAO_ID').AsInteger := vlAnotacaoId;
  sqlAnotacao.Open;
  sqlAnotacao.Edit;

  if vlAnotacaoId <= 0 then
    sqlAnotacaoSITUACAO.AsString := 'A';

  if sqlAnotacaoANOTACAO_ID.AsInteger > 0 then
    lblInformacao.Caption := ' Alterando anotação '
  else if sqlAnotacaoANOTACAO_ID.AsInteger = 0 then
    lblInformacao.Caption := ' Nova anotação ';

  ConfigurarTela;

  CbxGrupo.SetFocus;
end;

procedure TfrmAnotacao.sqlAnotacaoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  fmeEditorSimples.wptTexto.AsString := DeCompressString(sqlAnotacaoMENSAGEM.AsString);
end;

end.
