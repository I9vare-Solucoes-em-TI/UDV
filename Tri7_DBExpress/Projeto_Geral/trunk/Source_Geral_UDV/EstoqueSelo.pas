unit EstoqueSelo;
interface

uses
  I9Query,
  Windows, WinInet, SysUtils, Classes, StdCtrls, ExtCtrls, Graphics, Dialogs,
  SimpleDS, MSNPopUp, Forms;

  Type

  TEstoqueSelo = class(TObject)
  private
    FTimer: TTimer;
    FMSN: TMSNPopUp;
    FResumo : string;
    FConfirmarAlterta : Boolean;

    FIdSistema,
    FIdUsuario: String;

    procedure Timer1Timer(Sender: TObject);
    procedure msnURLClick(Sender: TObject; URL: string);
    procedure VisualizarResumo;
  public
    constructor Create;
    destructor Destroy; override;

    procedure VerificaEstoque(vpMSN : Boolean = True);
    procedure Ativar;

    property IdSistema: String read FIdSistema write FIdSistema;
    property IdUsuario: String read FIdUsuario write FIdUsuario;
  end;
implementation

uses Rotinas, Controles, VisualizaEstoqueSelo;

procedure TEstoqueSelo.Ativar;
var
  viValidar : Boolean;
  viSql : string;
begin
  viValidar := True;

  if FIdUsuario <> '' then
  begin
    viSql := 'SELECT U.ALERTA_SELO_MINIMO '+
             'FROM G_USUARIO U '+
             'LEFT JOIN G_USUARIO_SISTEMA US ON '+
             '   US.USUARIO_ID = U.USUARIO_ID '+
             'WHERE U.USUARIO_ID = ' + FIdUsuario +
             '  AND U.ALERTA_SELO_MINIMO = ''S'' ';
      
    viValidar := (dtmControles.GetStr(viSql) = 'S');
  end;

  if viValidar then
    FTimer.Enabled  := True;
end;

constructor TEstoqueSelo.Create;
begin
  FIdSistema := '';
  FIdUsuario := '';
  FResumo    := '';

  FTimer            := TTimer.Create(nil);
  FTimer.OnTimer    := Timer1Timer;
  FTimer.Interval   := 5000;
  FTimer.Enabled    := False;
  FIdSistema        := '';
  FConfirmarAlterta := True;

  FMSN := TMSNPopUp.Create(nil);
  FMSN.Title          := 'ATENÇÃO';
  FMSN.Text           := 'EXISTE(M) ESTOQUE(S) DE SELO(S) ABAIXO DO MÍNIMO!';
  FMSN.GradientColor1 := $0080FFFF;
  FMSN.URL            := '';
  FMSN.TimeOut        := 1000;
  FMSN.Options        := [msnCascadePopups,msnAllowScroll,msnAllowHyperlink];
  FMSN.OnURLClick     := msnURLClick;
end;

destructor TEstoqueSelo.Destroy;
begin
  FMSN.ClosePopUps;
  FreeAndNil(FMSN);
  FreeAndNil(FTimer);
  inherited;
end;

procedure TEstoqueSelo.msnURLClick(Sender: TObject; URL: string);
begin
  VisualizarResumo;
end;

procedure TEstoqueSelo.VerificaEstoque(vpMSN : Boolean = True);
  function RetornaCaracter(Car :string;QUANT:integer):String;
  var
    I,Tamanho:integer;
    aux: string;
  begin
    aux := Car;
    Tamanho := length(Car);
    for I:=1 to quant-tamanho do
      Car := Car + aux;
    RetornaCaracter := Car;
  end;

var
  viSql,
  viCondicao,
  viControle : string;
  SQL: TI9Query;
begin
  FResumo    := '';
  viControle := '';
  viCondicao := '';
  FTimer.Interval := 3600000; // 1 (uma) hora

  if FIdSistema <> '' then
    viCondicao := ' AND SG.SISTEMA_ID = ' + FIdSistema;

  viSql := ' SELECT S.DESCRICAO AS SISTEMA, SG.DESCRICAO, SG.ESTOQUE_MINIMO, COUNT(SL.SELO_LOTE_ID) AS TOTAL_DISPONIVEL ' +
           ' FROM G_SELO_GRUPO SG ' +
           ' LEFT JOIN G_SISTEMA S ON '+
           '   SG.SISTEMA_ID = S.SISTEMA_ID '+
           ' LEFT JOIN G_SELO_LOTE SO ON ' +
           '   SG.SELO_GRUPO_ID = SO.SELO_GRUPO_ID  ' +
           ' LEFT JOIN G_SELO_LIVRO SL ON ' +
           '   SO.SELO_LOTE_ID = SL.SELO_LOTE_ID ' +
           ' WHERE SG.ESTOQUE_MINIMO > 0 ' + viCondicao +
           '   AND SO.SITUACAO = ''I'' AND SL.SELO_SITUACAO_ID = 1 ' +
           ' GROUP BY SISTEMA, SG.DESCRICAO, SG.ESTOQUE_MINIMO ' +
           ' HAVING  (SG.ESTOQUE_MINIMO > COUNT(SL.SELO_LOTE_ID)) ' +
           ' ORDER BY SISTEMA, SG.DESCRICAO ';

  SQL := TI9Query.Create(nil);
  SQL.Connection := dtmControles.DB;
  try
    SQL.SQL.Text := viSql;
    SQL.Open;
    if SQL.Active then
    begin
      SQL.First;
      while (not SQL.EOF) do
      begin
        if viControle <> SQL.FieldByName('SISTEMA').AsString then
        begin
          if FResumo = '' then
            FResumo := RetBrancos('SERVIÇO', 40) +
                       RetBrancos('ESTOQUE MÍNIMO', 20) +
                       'TOTAL DISPONIVEL';

          viControle := SQL.FieldByName('SISTEMA').AsString;
          FResumo := FResumo + #13#10 + RetornaCaracter('-', 80) + #13#10 + 'SISTEMA: ' + viControle + #13#10 +
          RetornaCaracter('-', 80) + #13#10;
        end;

        FResumo := FResumo + RetBrancos(SQL.FieldByName('DESCRICAO').AsString, 40) +
                             RetBrancos(RetBrancos(SQL.FieldByName('ESTOQUE_MINIMO').AsString,14, 1), 20) +
                             RetBrancos(SQL.FieldByName('TOTAL_DISPONIVEL').AsString, 16, 1) + #13#10;
        SQL.Next;
      end;
    end
  except

  end;
  SQL.Close;
  FreeAndNil(SQL);

  if FResumo <> '' then
  begin
    FResumo := AnsiUpperCase(FResumo);
    if vpMSN then
    begin
      FMSN.ShowPopUp;
      if FConfirmarAlterta then
      begin
        FConfirmarAlterta := False;
        if Application.MessageBox('Manter alerta de estoque mínimo ativo para esta sessão?', 'Estoque mínimo', MB_YESNO + MB_ICONQUESTION) = IDNO then
          FTimer.Enabled  := False;
      end;
    end
    else
      VisualizarResumo;
  end
  else ShowMessage('Não foi encontrado nenhum Selo com estoque mínimo!!!');

end;

procedure TEstoqueSelo.VisualizarResumo;
begin
  if frmVisualizaEstoqueSelo = nil then
    frmVisualizaEstoqueSelo := TfrmVisualizaEstoqueSelo.Create(nil);
  frmVisualizaEstoqueSelo.rchTexto.Text := FResumo;
  frmVisualizaEstoqueSelo.ShowModal;
end;

procedure TEstoqueSelo.Timer1Timer(Sender: TObject);
begin
  VerificaEstoque;
end;

end.
