unit Anotacoes;

interface

uses
  Classes,
  Controls,
  cxButtons,
  cxClasses,
  cxControls,
  cxCustomData,
  cxData,
  cxDataStorage,
  cxDBData,
  cxEdit,
  cxFilter,
  cxGraphics,
  cxGrid,
  cxGridCustomTableView,
  cxGridCustomView,
  cxGridDBTableView,
  cxGridLevel,
  cxGridTableView,
  cxLookAndFeelPainters,
  cxLookAndFeels,
  cxNavigator,
  cxStyles,
  DB,
  DBClient,
  DbxDevartInterBase,
  Dialogs,
  dxSkinMcSkin,
  dxSkinOffice2007Black,
  dxSkinOffice2007Blue,
  dxSkinOffice2007Green,
  dxSkinOffice2007Pink,
  dxSkinOffice2007Silver,
  dxSkinsCore,
  dxSkinscxPCPainter,
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
  Forms,
  Graphics,
  I9Query,
  Menus,
  Messages,
  SimpleDS,
  StdCtrls,
  SysUtils,
  Variants,
  Windows;

type
  TfrmAnotacoes = class(TForm)
    BtnAnotacaoAlterar: TcxButton;
    BtnAnotacaoExcluir: TcxButton;
    BtnAnotacaoNova: TcxButton;
    BtnFechar: TcxButton;
    GrdAnotacao: TcxGrid;
    grdAnotacaoDBTableViewTITULO: TcxGridDBColumn;
    GrdAnotacaoDBTableView: TcxGridDBTableView;
    GrdAnotacaoLevel: TcxGridLevel;
    DtsAnotacao: TDataSource;
    PnlFechar: TPanel;
    PnlBotoes: TPanel;
    PnlBotoesBasicos: TPanel;
    SqlAnotacao: TI9Query;
    SqlAnotacaoANOTACAO_ID: TBCDField;
    SqlAnotacaoDATA: TSQLTimeStampField;
    SqlAnotacaoMENSAGEM: TBlobField;
    SqlAnotacaoTITULO: TStringField;
    SqlAnotacaoUSUARIO_ID: TBCDField;
    sqlAnotacaoSISTEMA_ID: TBCDField;
    sqlAnotacaoGERAL: TStringField;
    sqlAnotacaoSITUACAO: TStringField;
    sqlAnotacaoGRUPO: TStringField;
    grdAnotacaoDBTableViewGRUPO: TcxGridDBColumn;
    BtnPesquisar: TcxButton;

    procedure BtnAnotacaoAlterarClick(Sender: TObject);
    procedure BtnAnotacaoExcluirClick(Sender: TObject);
    procedure BtnAnotacaoNovaClick(Sender: TObject);
    procedure BtnFecharClick(Sender: TObject);
    procedure GrdAnotacaoDBTableViewDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BtnPesquisarClick(Sender: TObject);

  private

    {$REGION ' Anotação '}
    procedure IncluirAnotacao;

    procedure AlterarAnotacao(
      const vpAnotacaoId: Integer);

    procedure ExcluirAnotacao(
      const vpAnotacaoId: Integer);

    procedure PesquisarAnotacao;
    {$ENDREGION}

  public
  end;

var
  frmAnotacoes: TfrmAnotacoes;

implementation

uses
  Anotacao,
  Controles,
  MensagemUtils,
  Geral.Controller.Anotacao;

{$R *.dfm}

procedure TfrmAnotacoes.AlterarAnotacao(
  const vpAnotacaoId: Integer);
begin
  TfrmAnotacao.AbrirCadastroAnotacao(vpAnotacaoId);
  PesquisarAnotacao;
end;

procedure TfrmAnotacoes.btnAnotacaoAlterarClick(Sender: TObject);
begin
  AlterarAnotacao(sqlAnotacaoANOTACAO_ID.AsInteger);
end;

procedure TfrmAnotacoes.btnAnotacaoExcluirClick(Sender: TObject);
begin
  ExcluirAnotacao(sqlAnotacaoANOTACAO_ID.AsInteger);
end;

procedure TfrmAnotacoes.btnAnotacaoNovaClick(Sender: TObject);
begin
  IncluirAnotacao;
end;

procedure TfrmAnotacoes.BtnFecharClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmAnotacoes.BtnPesquisarClick(Sender: TObject);
begin
  PesquisarAnotacao;
end;

procedure TfrmAnotacoes.grdAnotacaoDBTableViewDblClick(Sender: TObject);
begin
  AlterarAnotacao(sqlAnotacaoANOTACAO_ID.AsInteger);
end;

procedure TfrmAnotacoes.ExcluirAnotacao(
  const vpAnotacaoId: Integer);
begin
  if not TMensagemUtils.ExibirMensagemPergunta(
    'Deseja realmente excluir esta anotação?',
    False) then
    Exit;

  TAnotacaoController.Excluir(vpAnotacaoId);
  PesquisarAnotacao;
end;

procedure TfrmAnotacoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmAnotacoes := nil;
end;

procedure TfrmAnotacoes.FormCreate(Sender: TObject);
begin
  sqlAnotacao.Connection := dtmControles.DB;

  PesquisarAnotacao;
end;

procedure TfrmAnotacoes.IncluirAnotacao;
begin
  TfrmAnotacao.AbrirCadastroAnotacao(0);
  PesquisarAnotacao;
end;

procedure TfrmAnotacoes.PesquisarAnotacao;
begin
  sqlAnotacao.Close;
  sqlAnotacao.Params.ParamByName('USUARIO_ID').AsInteger := StrToInt(vgUsuarioID);
  sqlAnotacao.Params.ParamByName('SISTEMA_ID').AsInteger := vgId;
  sqlAnotacao.Open;
end;

end.
