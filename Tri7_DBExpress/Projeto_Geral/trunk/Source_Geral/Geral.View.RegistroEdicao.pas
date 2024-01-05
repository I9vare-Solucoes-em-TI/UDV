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
  System.JSON,
  cxGridCustomPopupMenu,
  cxGridPopupMenu,
  Vcl.Menus,
  Geral.Model.Entity.Spec.JSON;

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
  private
    { Private declarations }
    FRegistrosEdicao: IJSONAPI<TJSONArray>;
    FPermissaoDesbloquearRegistroEdicao: string;

    function Desbloquear: Integer;
  public
    { Public declarations }
    constructor Create(
      const AOwner: TComponent;
      const vpRegistroEdicao: IJSONAPI<TJSONArray>;
      const vpPermissaoDesbloquearRegistroEdicao: string); reintroduce;

    class function New(
      const AOwner: TComponent;
      const vpRegistroEdicao: IJSONAPI<TJSONArray>;
      const vpPermissaoDesbloquearRegistroEdicao: string): TfrmRegistroEdicao;

    class function Abrir(
      const AOwner: TComponent;
      const vpRegistroEdicao: IJSONAPI<TJSONArray>;
      const vpPermissaoDesbloquearRegistroEdicao: string): TfrmRegistroEdicao;
  end;

implementation

uses
  Controles,
  ValidarPermissaoUsuario,
  System.Math,
  Geral.Controller.Impl.RegistroEdicao,
  System.Types,
  Geral.Model.Entity.Impl.DataSetSource.JSON;

{$R *.dfm}

{ TfrmRegistroEdicao }

class function TfrmRegistroEdicao.Abrir(
  const AOwner: TComponent;
  const vpRegistroEdicao: IJSONAPI<TJSONArray>;
  const vpPermissaoDesbloquearRegistroEdicao: string): TfrmRegistroEdicao;
begin
  Result := New(
    AOwner,
    vpRegistroEdicao,
    vpPermissaoDesbloquearRegistroEdicao);

  try
    Result.ShowModal;
  finally
    Result.Free;
  end;
end;

constructor TfrmRegistroEdicao.Create(
  const AOwner: TComponent;
  const vpRegistroEdicao: IJSONAPI<TJSONArray>;
  const vpPermissaoDesbloquearRegistroEdicao: string);
begin
  inherited Create(
    AOwner);

  FRegistrosEdicao := vpRegistroEdicao;
  FPermissaoDesbloquearRegistroEdicao := vpPermissaoDesbloquearRegistroEdicao;
end;

function TfrmRegistroEdicao.Desbloquear: Integer;
{$REGION 'Variáveis'}
var
  viPermissao: string;
{$ENDREGION}
begin
  viPermissao := LiberarPermissaoUsuario(
    FPermissaoDesbloquearRegistroEdicao)
  .Chars[5];

  if not viPermissao.Equals(
    '1') then
    Exit(
      ZeroValue);

  Result := TDesbloqueioRegistroEdicao.New(
    tblRegistroEdicaoTABELA.AsString,
    tblRegistroEdicaoCHAVE.AsInteger,
    tblRegistroEdicaoCAMPO.AsString,
    tblRegistroEdicaoUSUARIO_ID.AsInteger)
  .Unlock;
end;

procedure TfrmRegistroEdicao.FormCreate(Sender: TObject);
begin
  tblRegistroEdicao.Open;

  TJSONArrayAsDataSetSource<TFDMemTable>.New(
    FRegistrosEdicao.JSONValue,
    tblRegistroEdicao)
  .Data;

  tblRegistroEdicao.First;
end;

procedure TfrmRegistroEdicao.FormDestroy(Sender: TObject);
begin
  tblRegistroEdicao.Close;
end;

procedure TfrmRegistroEdicao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if CompareValue(
    Key,
    VK_ESCAPE) = EqualsValue then
    Close;
end;

procedure TfrmRegistroEdicao.mniDesbloquearClick(Sender: TObject);
{$REGION 'Variáveis'}
var
  I: Integer;
{$ENDREGION}
begin
  dtmControles.StartTransaction;
  try
    I := Desbloquear;
    dtmControles.Commit;

    if CompareValue(
      I,
      ZeroValue) = EqualsValue then
      Exit;

    tblRegistroEdicao.Delete;
  except
    dtmControles.Roolback;
  end;
end;

class function TfrmRegistroEdicao.New(
  const AOwner: TComponent;
  const vpRegistroEdicao: IJSONAPI<TJSONArray>;
  const vpPermissaoDesbloquearRegistroEdicao: string): TfrmRegistroEdicao;
begin
  Result := Create(
    AOwner,
    vpRegistroEdicao,
    vpPermissaoDesbloquearRegistroEdicao);
end;

end.
