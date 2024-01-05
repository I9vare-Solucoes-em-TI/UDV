unit Geral.View.RegistroEdicao;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  Data.DB,
  cxDBData,
  cxGridLevel,
  cxClasses,
  cxGridCustomView,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGrid,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  cxGridCustomPopupMenu,
  cxGridPopupMenu,
  Vcl.Menus;

type
  TfrmRegistroEdicao = class(TForm)
    grdRegistroEdicaoDBTableView: TcxGridDBTableView;
    grdRegistroEdicaoLevel: TcxGridLevel;
    grdRegistroEdicao: TcxGrid;
    tblRegistroEdicao: TFDMemTable;
    dtsRegistroEdicao: TDataSource;
    tblRegistroEdicaoREGISTRO_EDICAO_ID: TIntegerField;
    tblRegistroEdicaoTABELA: TStringField;
    tblRegistroEdicaoCHAVE: TIntegerField;
    tblRegistroEdicaoCAMPO: TStringField;
    tblRegistroEdicaoDATA: TDateTimeField;
    tblRegistroEdicaoIP_MAQUINA: TStringField;
    tblRegistroEdicaoNOME_ESTACAO: TStringField;
    grdRegistroEdicaoDBTableViewTABELA: TcxGridDBColumn;
    grdRegistroEdicaoDBTableViewCHAVE: TcxGridDBColumn;
    grdRegistroEdicaoDBTableViewCAMPO: TcxGridDBColumn;
    grdRegistroEdicaoDBTableViewDATA: TcxGridDBColumn;
    grdRegistroEdicaoDBTableViewIP_MAQUINA: TcxGridDBColumn;
    grdRegistroEdicaoDBTableViewNOME_ESTACAO: TcxGridDBColumn;
    tblRegistroEdicaoUSUARIO_ID: TIntegerField;
    tblRegistroEdicaoLOGIN: TStringField;
    grdRegistroEdicaoDBTableViewLOGIN: TcxGridDBColumn;
    pmnOpcoes: TPopupMenu;
    mniDesbloquear: TMenuItem;
    cxGridPopupMenu: TcxGridPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure mniDesbloquearClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pmnOpcoesPopup(Sender: TObject);
  private
    { Private declarations }
    FRegistroEdicao: TDataSet;

    constructor Create(
      AOwner: TComponent;
      const vpRegistroEdicao: TDataSet); reintroduce;

    class function New(
      AOwner: TComponent;
      const vpRegistroEdicao: TDataSet): TfrmRegistroEdicao;
  public
    { Public declarations }
    class procedure Abrir(
      const vpRegistroEdicao: TDataSet);
  end;

implementation

uses
  Controles,
  ValidarPermissaoUsuario,
  Geral.Controller.Impl.RegistroEdicao,
  MensagemUtils,
  System.StrUtils,
  Geral.Controller.Spec.RegistroEdicao;

{$R *.dfm}

{ TfrmRegistroEdicao }

class procedure TfrmRegistroEdicao.Abrir(
  const vpRegistroEdicao: TDataSet);
{$REGION 'Variáveis'}
var
  viFrmRegistroEdicao: TfrmRegistroEdicao;
{$ENDREGION}
begin
  viFrmRegistroEdicao := New(
    Application,
    vpRegistroEdicao);

  viFrmRegistroEdicao.ShowModal;
end;

constructor TfrmRegistroEdicao.Create(
  AOwner: TComponent;
  const vpRegistroEdicao: TDataSet);
begin
  inherited Create(
    AOwner);

  FRegistroEdicao := vpRegistroEdicao;
end;

procedure TfrmRegistroEdicao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := TCloseAction.caFree;
end;

procedure TfrmRegistroEdicao.FormCreate(Sender: TObject);
begin
  tblRegistroEdicao.Open;

  tblRegistroEdicao.CopyDataSet(
    FRegistroEdicao);
end;

procedure TfrmRegistroEdicao.FormDestroy(Sender: TObject);
begin
  tblRegistroEdicao.Close;
end;

procedure TfrmRegistroEdicao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmRegistroEdicao.mniDesbloquearClick(Sender: TObject);
{$REGION 'Variáveis'}
var
  I: Integer;
  viPermissao: string;
  viInTransaction: Boolean;
  viControleRegistroEdicao: IControleRegistroEdicao;
  viTabela: string;
  viChave: Integer;
  viCampo: string;
  viUsuarioID: Integer;
{$ENDREGION}
begin
  if tblRegistroEdicao.IsEmpty then
  begin
    TMensagemUtils.ExibirMensagemAtencao(
      'Nenhum registro para desbloquear.');
  
    Exit;
  end;

  if not TMensagemUtils.ExibirMensagemPergunta(
    'Tem certeza que deseja desbloquear?',
    False) then
    Exit;

  viPermissao := LiberarPermissaoUsuario(
    'ESP_DESBLOQUEAR_REG_EDICAO',
    6,
    20);

  if viPermissao[6] = '0' then
    Exit;

  viInTransaction := dtmControles.DB.InTransaction;
  if not viInTransaction then
    dtmControles.DB.StartTransaction;

  try
    viControleRegistroEdicao := TControleRegistroEdicao.New;
    viTabela := tblRegistroEdicaoTABELA.AsString;
    viChave := tblRegistroEdicaoCHAVE.AsInteger;
    viCampo := tblRegistroEdicaoCAMPO.AsString;
    viUsuarioID := tblRegistroEdicaoUSUARIO_ID.AsInteger;

    I := viControleRegistroEdicao.Desbloquear(
      viTabela,
      viChave,
      viCampo,
      viUsuarioID);

    if I > 0 then
      tblRegistroEdicao.Delete;

    if not viInTransaction then
      dtmControles.DB.Commit;  
  except
    on E: Exception do
    begin
      if not viInTransaction then
        dtmControles.DB.Rollback;

      TMensagemUtils.ExibirMensagemErro(
        string.Format(
          'Não foi possível desbloquear devido ao motivo abaixo:%s%s',
          [DupeString(
            sLineBreak,
            2),
          E.Message]));
    end;
  end;
end;

class function TfrmRegistroEdicao.New(
  AOwner: TComponent;
  const vpRegistroEdicao: TDataSet): TfrmRegistroEdicao;
begin
  Result := Create(
    AOwner,
    vpRegistroEdicao);
end;

procedure TfrmRegistroEdicao.pmnOpcoesPopup(Sender: TObject);
begin
  mniDesbloquear.Enabled := not tblRegistroEdicao.IsEmpty;
end;

end.
