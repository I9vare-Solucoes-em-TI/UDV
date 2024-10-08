unit EstoqueSelo;
interface

uses
  I9Query,
  Windows, WinInet, SysUtils, Classes, StdCtrls, ExtCtrls, Graphics, Dialogs,
  SimpleDS, MSNPopUp, Forms;

type
  TExecuteProc = procedure of object;

type TREstoque = class(TThread)
  private
      procedure Estoque;
  protected
      ExecEstoque : TExecuteProc;
      procedure Execute; override;
  end; { of class declaration }

Type
  TEstoqueSelo = class(TObject)
  private
    FTimer: TTimer;
    FMSN: TMSNPopUp;
    FResumo : string;
    FConfirmarAlterta : Boolean;

    FIdSistema,
    FIdUsuario: String;
    FExibirMSN : Boolean;

    procedure Timer1Timer(Sender: TObject);
    procedure msnURLClick(Sender: TObject; URL: string);
    procedure VisualizarResumo;
  public
    constructor Create;
    destructor Destroy; override;

    procedure VerificaEstoque;
    procedure Ativar;

    property IdSistema: String read FIdSistema write FIdSistema;
    property IdUsuario: String read FIdUsuario write FIdUsuario;
    property MSN: Boolean read FExibirMSN write FExibirMSN;
  end;
implementation

{$WARN SYMBOL_DEPRECATED OFF}

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
  FExibirMSN := True;

  FTimer            := TTimer.Create(nil);
  FTimer.OnTimer    := Timer1Timer;
  FTimer.Interval   := 60000;
  FTimer.Enabled    := False;
  FIdSistema        := '';
  FConfirmarAlterta := True;

  FMSN := TMSNPopUp.Create(nil);
  FMSN.Title          := 'ATEN��O';
  FMSN.Text           := 'EXISTE(M) ESTOQUE(S) DE SELO(S) ABAIXO DO M�NIMO!';
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

procedure TEstoqueSelo.VerificaEstoque;
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
    viSql := ' SELECT * FROM G_SP_ESTOQUE_SELO ' +
             ' WHERE SISTEMA_ID = ' + FIdSistema +
             ' ORDER BY SISTEMA, DESCRICAO '
  else
    viSql := ' SELECT * FROM G_SP_ESTOQUE_SELO ' +
             ' ORDER BY SISTEMA, DESCRICAO ';

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
            FResumo := RetBrancos('N�MERO', 10) +
                       RetBrancos('SERVI�O', 40) +
                       RetBrancos('ESTOQUE M�NIMO', 20) +
                       'TOTAL DISPONIVEL';

          viControle := SQL.FieldByName('SISTEMA').AsString;
          FResumo := FResumo + #13#10 + RetornaCaracter('-', 90) + #13#10 + 'SISTEMA: ' + viControle + #13#10 +
          RetornaCaracter('-', 90) + #13#10;
        end;

        FResumo := FResumo + RetBrancos(SQL.FieldByName('NUMERO').AsString, 10) +
                             RetBrancos(SQL.FieldByName('DESCRICAO').AsString, 40) +
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
    if FExibirMSN then
    begin
      FMSN.ShowPopUp;
      if FConfirmarAlterta then
      begin
        FConfirmarAlterta := False;
        if Application.MessageBox('Manter alerta de estoque m�nimo ativo para esta sess�o?', 'Estoque m�nimo', MB_YESNO + MB_ICONQUESTION) = IDNO then
          FTimer.Enabled  := False;
      end;
    end
    else
      VisualizarResumo;
  end;
end;

procedure TEstoqueSelo.VisualizarResumo;
begin
  if frmVisualizaEstoqueSelo = nil then
    frmVisualizaEstoqueSelo := TfrmVisualizaEstoqueSelo.Create(nil);
  frmVisualizaEstoqueSelo.rchTexto.Text := FResumo;
  frmVisualizaEstoqueSelo.ShowModal;
end;

procedure TEstoqueSelo.Timer1Timer(Sender: TObject);
var
  ThR : TREstoque;
begin
  ThR := TREstoque.Create (True);  // start
  ThR.FreeOnTerminate:= true;
  ThR.ExecEstoque := VerificaEstoque;
  Application.ProcessMessages;
  ThR.Resume;
end;

{ TREstoque }

procedure TREstoque.Estoque;
begin
  if @ExecEstoque <> nil then
    ExecEstoque;
end;

procedure TREstoque.Execute;
begin
  inherited;
  Synchronize(Estoque);
end;

end.


