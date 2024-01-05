unit ControleBloqueio;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DateUtils, AlertaBloqueio;
type
  TControleBloqueio = class(TObject)
  private
    { Private declarations }
    FTimer : TTimer;
    FTolerancia : Integer;
    FHorarioInicial: TTime;
    FHorarioFinal : TTime;
    FServidorHorario : TTime;
    FBloqueio : Boolean;
    FHorarioAnterior : TTime;

    procedure BloqueioHorario(Sender: TObject);
    function Validar : Boolean;
  public
    { Public declarations }
    constructor Create;
    destructor Destroy; override;
    function Ativar : Boolean;

    property HorarioInicio: TTime read FHorarioInicial write FHorarioInicial;
    property HorarioFinal: TTime read FHorarioFinal write FHorarioFinal;
    property Tolerancia: Integer read FTolerancia write FTolerancia;//Minutos
    property ServidorHorario: TTime read FServidorHorario write FServidorHorario;//Servidor de Horário
    property Bloqueio: Boolean read FBloqueio write FBloqueio;//Minutos

  end;

implementation

{ TControleBloqueio }

function TControleBloqueio.Ativar : Boolean;
begin
  if Validar then
  begin
    Result := True;
    FTimer.Enabled  := True;
    BloqueioHorario(nil);
  end
  else
  begin
    Result := False;
  end;
end;

procedure TControleBloqueio.BloqueioHorario(Sender: TObject);
var
  viHora : TTime;
begin
  viHora := Time;

  if ((FHorarioAnterior - viHora) > 0)  then
  begin
    if frmAlertaBloqueio = nil then
      Application.CreateForm(TfrmAlertaBloqueio, frmAlertaBloqueio);
    frmAlertaBloqueio.Top  := 0;
    frmAlertaBloqueio.Left := Screen.Width - frmAlertaBloqueio.Width;
    frmAlertaBloqueio.vlTempoInicial  := viHora;
    frmAlertaBloqueio.vlTempoRestante := viHora + (60 / SecsPerDay);
    frmAlertaBloqueio.Show;
  end
  else
  if (viHora >= FHorarioFinal) then
  begin
    FTimer.Enabled  := False;

    if frmAlertaBloqueio = nil then
      Application.CreateForm(TfrmAlertaBloqueio, frmAlertaBloqueio);
    frmAlertaBloqueio.Top  := 0;
    frmAlertaBloqueio.Left := Screen.Width - frmAlertaBloqueio.Width;
    frmAlertaBloqueio.vlTempoInicial  := viHora;
    frmAlertaBloqueio.vlTempoRestante := FHorarioFinal + (FTolerancia / SecsPerDay);
    frmAlertaBloqueio.Show;
  end;

  FHorarioAnterior := viHora;
end;

constructor TControleBloqueio.Create;
begin
  //Parâmetros
  FHorarioInicial := StrToTime('08:00:00');//Horário Inicio
  FHorarioFinal   := StrToTime('18:00:00');//Horário Final
  FTolerancia     := 600;// 10 Minutos (valor em segundos)
  FBloqueio       := False;
  FHorarioAnterior := 0;

  //Criar Timer
  FTimer          := TTimer.Create(NIL);
  FTimer.Name     := 'TimerBloqueio';
  FTimer.OnTimer  := BloqueioHorario;
  FTimer.Interval := 60000;//1 minuto
  FTimer.Enabled  := False;
end;

destructor TControleBloqueio.Destroy;
begin
  FreeAndNil(FTimer);
  inherited;
end;

function TControleBloqueio.Validar: Boolean;
var
  viHora : TTime;
begin
  viHora := Time;

  if ((FServidorHorario - viHora) > (600/SecsPerDay))  then
    FBloqueio := True;

  if FBloqueio then
    Result := False
  else
  if (not FBloqueio) and (viHora >= (FHorarioInicial - (FTolerancia / SecsPerDay))) and (viHora < (FHorarioFinal + (FTolerancia / SecsPerDay))) then
    Result := True
  else
  begin
    //ShowMessage('Sistema não pode ser usado pois esta fora do horário padrão de funcionamento!');
    Result := False;
  end
end;

end.
