unit FDControle;

interface

uses
  I9Query,
  I9Connection,
  I9Query,
  I9Connection,
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  FireDAC.Comp.UI,
  FireDAC.Phys.IBBase;

type
  TdtmFD = class(TDataModule)
    FDConnection: TI9Connection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
    FDQuery: TI9Query;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function GerarSequencia(
      const vpTabela: string): Integer;

    function AtualizarOuInserirSequenciaMax(
      const vpTabela: string;
      const vpChave: string): Integer;

    function AtualizarOuInserirSequencia(
      const vpTabela: string;
      const vpSequencia: Integer): Integer;

    procedure ExecuteSQL(vpSql : string);
  end;

var
  dtmFD: TdtmFD;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Controles;

{$R *.dfm}

function TdtmFD.AtualizarOuInserirSequencia(
  const vpTabela: string;
  const vpSequencia: Integer): Integer;
begin
  Result := FDConnection.ExecSQL(
    'UPDATE OR INSERT INTO G_SEQUENCIA ' +
    '(TABELA, SEQUENCIA) ' +
    'VALUES (:P_TABELA, :P_SEQUENCIA) ' +
    'MATCHING (TABELA)',
    [vpTabela,
    vpSequencia]);
end;

function TdtmFD.AtualizarOuInserirSequenciaMax(
  const vpTabela: string;
  const vpChave: string): Integer;
begin
  Result := FDConnection.ExecSQL(
    string.Format(
      'UPDATE OR INSERT INTO G_SEQUENCIA ' +
      '(TABELA, SEQUENCIA) ' +
      'VALUES (:P_TABELA, (SELECT COALESCE(MAX(%s), 0) FROM %s)) ' +
      'MATCHING (TABELA)',
      [vpChave,
      vpTabela]),
    [vpTabela]);
end;

procedure TdtmFD.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Close;
  FDConnection.Params.Database := dtmControles.Cripto.CriptoHexToText(vgBaseDados);
  FDConnection.Params.UserName := dtmControles.Cripto.CriptoHexToText(vgUsuario);
  FDConnection.Params.Password := dtmControles.Cripto.CriptoHexToText(vgSenha);
  FDConnection.Open;
end;

procedure TdtmFD.DataModuleDestroy(Sender: TObject);
begin
  FDConnection.Close;
end;

procedure TdtmFD.ExecuteSQL(vpSql: string);
begin
  FDQuery.SQL.Clear;
  FDQuery.SQL.Text := vpSql;
  FDQuery.ExecSQL;
end;

function TdtmFD.GerarSequencia(
  const vpTabela: string): Integer;
{$REGION 'Variáveis'}
var
  viInTransaction: Boolean;
{$ENDREGION}
begin
  if vpTabela.IsEmpty then
    raise Exception.Create(
      'Por favor, informe a tabela.');

  viInTransaction := FDConnection.InTransaction;
  if not viInTransaction then
    FDConnection.StartTransaction;

  try
    Result := FDConnection.ExecSQLScalar(
      'SELECT SEQUENCIA FROM G_SP_SEQUENCIAS(:P_TABELA)',
      [vpTabela]);

    if not viInTransaction then
      FDConnection.Commit;
  except
    if not viInTransaction then
      FDConnection.Rollback;
    raise;
  end;
end;

end.
