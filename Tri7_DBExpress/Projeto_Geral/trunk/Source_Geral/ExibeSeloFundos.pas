unit ExibeSeloFundos;

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
  Data.DB,
  Datasnap.DBClient,
  cxControls,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGridLevel,
  cxClasses,
  cxGridCustomView,
  cxGrid,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  cxButtons,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  Vcl.Menus,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  cxDBData,
  FundoTipo,
  SeloLivroList;

type
  TfrmExibeSeloFundos = class(TForm)
    sqlSeloFundos: TClientDataSet;
    sqlSeloFundosDescricao: TStringField;
    sqlSeloFundosValorCalculado: TCurrencyField;
    pnlInferior: TPanel;
    dtsSeloFundos: TDataSource;
    btnFechar: TcxButton;
    grdSeloFundos: TcxGrid;
    cxGridDBTableViewSeloFundos: TcxGridDBTableView;
    cxGridLevelSeloFundos: TcxGridLevel;
    cxGridDBTableViewSeloFundosDescricao: TcxGridDBColumn;
    cxGridDBTableViewSeloFundosValorCalculado: TcxGridDBColumn;
    sqlSeloFundosPercentual: TFloatField;
    cxGridDBTableViewSeloFundosPercentual: TcxGridDBColumn;
    sqlSeloFundosSigla: TStringField;
    cxGridDBTableViewSeloFundosSigla: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure CarregarSeloFundos(
      const vpSeloLivroID: Integer); overload;

    procedure CarregarSeloFundos(
      const vpSelosLivroID: TStrings;
      const vpFundoTipos: TFundoTipos); overload;
  public
    { Public declarations }
    class procedure ExibirSeloFundos(
      const vpSeloLivroID: Integer); overload;

    class procedure ExibirSeloFundos(
      const vpSelosLivroID: TStrings;
      const vpFundoTipos: TFundoTipos); overload;

    class procedure ExibirSeloFundos(
      const vpSeloLivroList: TSeloLivroList;
      const vpFundoTipos: TFundoTipos); overload;
  end;

implementation

uses
  SeloFundoDAO,
  SeloFundo,
  IntegerList,
  SeloLivroListHelper,
  IntegerListHelper;

{$R *.dfm}

{ TfrmExibeSeloFundos }

procedure TfrmExibeSeloFundos.CarregarSeloFundos(
  const vpSeloLivroID: Integer);
{$REGION 'Variáveis'}
var
  viSeloFundoDAO: TSeloFundoDAO;
  viSeloFundos: TSeloFundos;
  viSeloFundo: TSeloFundo;
{$ENDREGION}
begin
  viSeloFundoDAO := TSeloFundoDAO.Create;
  viSeloFundos := nil;

  try
    viSeloFundos := viSeloFundoDAO.Get(vpSeloLivroID);

    for viSeloFundo in viSeloFundos do
    begin
      sqlSeloFundos.Append;

      sqlSeloFundosDescricao.AsString := viSeloFundo.FundoTipo.Descricao;
      sqlSeloFundosPercentual.AsFloat := viSeloFundo.FundoTipo.Percentual;
      sqlSeloFundosValorCalculado.AsCurrency := viSeloFundo.ValorCalculado;
      sqlSeloFundosSigla.AsString := viSeloFundo.FundoTipo.Sigla;
      sqlSeloFundos.Post;
    end;

    sqlSeloFundos.First;
  finally
    viSeloFundoDAO.Free;
    viSeloFundos.Free;
  end;
end;

class procedure TfrmExibeSeloFundos.ExibirSeloFundos(
  const vpSeloLivroID: Integer);
{$REGION 'Variáveis'}
var
  viFrmExibeSeloFundos: TfrmExibeSeloFundos;
{$ENDREGION}
begin
  Application.CreateForm(Self, viFrmExibeSeloFundos);
  viFrmExibeSeloFundos.CarregarSeloFundos(vpSeloLivroID);
  viFrmExibeSeloFundos.ShowModal;
end;

class procedure TfrmExibeSeloFundos.ExibirSeloFundos(
  const vpSelosLivroID: TStrings;
  const vpFundoTipos: TFundoTipos);
{$REGION 'Variáveis'}
var
  viFrmExibeSeloFundos: TfrmExibeSeloFundos;
{$ENDREGION}
begin
  Application.CreateForm(Self, viFrmExibeSeloFundos);
  viFrmExibeSeloFundos.Caption := 'Fundos Detalhados Global';
  viFrmExibeSeloFundos.CarregarSeloFundos(vpSelosLivroID, vpFundoTipos);
  viFrmExibeSeloFundos.ShowModal;
end;

procedure TfrmExibeSeloFundos.FormClose(Sender: TObject; var Action:
    TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmExibeSeloFundos.CarregarSeloFundos(
  const vpSelosLivroID: TStrings;
  const vpFundoTipos: TFundoTipos);
{$REGION 'Variáveis'}
var
  viSeloFundoDAO: TSeloFundoDAO;
  viSeloFundos: TSeloFundos;
  viFundoTipo: TFundoTipo;
  viSeloFundosAgrupado: TSeloFundos;
{$ENDREGION}
begin
  if not Assigned(vpSelosLivroID) or
    (vpSelosLivroID.Count = 0) then
    Exit;

  viSeloFundoDAO := TSeloFundoDAO.Create;
  viSeloFundos := nil;

  try
    viSeloFundos := viSeloFundoDAO.Get(vpSelosLivroID);

    if viSeloFundos.Count = 0 then
      Exit;

    for viFundoTipo in vpFundoTipos do
    begin
      viSeloFundosAgrupado := viSeloFundos.Get(viFundoTipo);

      try
        sqlSeloFundos.Append;

        sqlSeloFundosDescricao.AsString := viFundoTipo.Descricao;
        sqlSeloFundosPercentual.AsFloat := viFundoTipo.Percentual;

        sqlSeloFundosValorCalculado.AsCurrency := viSeloFundosAgrupado.
          ValorCalculado;

        sqlSeloFundosSigla.AsString := viFundoTipo.Sigla;
        sqlSeloFundos.Post;
      finally
        viSeloFundosAgrupado.Free;
      end;
    end;

    sqlSeloFundos.First;
  finally
    viSeloFundoDAO.Free;
    viSeloFundos.Free;
  end;
end;

class procedure TfrmExibeSeloFundos.ExibirSeloFundos(
  const vpSeloLivroList: TSeloLivroList;
  const vpFundoTipos: TFundoTipos);
{$REGION 'Variáveis'}
var
  viIDs: TIntegerList;
  viStrings: TStrings;
{$ENDREGION}
begin
  if not Assigned(vpSeloLivroList) or
    not Assigned(vpFundoTipos) then
    Exit;

  viIDs := vpSeloLivroList.GetIDs;
  viStrings := viIDs.ToStrings;

  try
    ExibirSeloFundos(viStrings, vpFundoTipos);
  finally
    viIDs.Free;
    viStrings.Free;
  end;
end;

end.
