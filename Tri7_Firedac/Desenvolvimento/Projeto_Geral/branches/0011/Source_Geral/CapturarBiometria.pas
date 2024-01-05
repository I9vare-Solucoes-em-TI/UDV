unit CapturarBiometria;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, CadAuxiliar, cxLabel, StdCtrls, ExtCtrls, cxPC, DB, DBClient,
  cxButtons, Menus,
  FMTBcd, cxControls, cxContainer, cxEdit, jpeg,
  Provider, SqlExpr, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  dxBarBuiltInMenu, System.UITypes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, I9Query;

type
  TfrmCapturarBiometria = class(TfrmCadAuxiliar)
    pgcCapturarBiometria: TcxPageControl;
    tabSelecao: TcxTabSheet;
    tabCapturar: TcxTabSheet;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    lblInformacaoObservacao: TcxLabel;
    Dedo10: TShape;
    Dedo9: TShape;
    Dedo8: TShape;
    Dedo7: TShape;
    Dedo6: TShape;
    Dedo1: TShape;
    Dedo2: TShape;
    Dedo3: TShape;
    Dedo4: TShape;
    Dedo5: TShape;
    cxLabel1: TcxLabel;
    Panel3: TPanel;
    pnlPrimeiraCaptura: TPanel;
    lblPrimeiraCaptuta: TcxLabel;
    pnlMostrarSegundaCaptura: TPanel;
    pnlSegundaCaptura: TPanel;
    lblInfo2Captura: TcxLabel;
    lblSegundaCaptura: TcxLabel;
    btnRetornar: TcxButton;
    btnIniciarNovamente: TcxButton;
    Image1: TImage;
    Panel4: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Dedo1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Dedo1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Dedo1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btnRetornarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblPrimeiraCaptutaClick(Sender: TObject);
    procedure lblSegundaCapturaClick(Sender: TObject);
    procedure btnIniciarNovamenteClick(Sender: TObject);
    procedure pgcCapturarBiometriaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    vlDedoSel : String[2];
    procedure AtualizarSelecao;
    procedure HabilitarPaineisBiometricos2(vpHabilitado : Boolean);
    //function VerificarPastaNomeImagem(vpPastaImagem : string; vpNumero : Integer):string;
  public
    { Public declarations }
  end;

var
  frmCapturarBiometria: TfrmCapturarBiometria;
implementation

uses RotinasFingkey, Controles;

{$R *.dfm}
{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

procedure TfrmCapturarBiometria.FormCreate(Sender: TObject);
begin
  inherited;
  pgcCapturarBiometria.ActivePageIndex := 0;
  pgcCapturarBiometria.HideTabs        := True;

  ClientAncestral.Active := False;
  DataSetAncestral.SQL.Text := ' SELECT * FROM '+ vlVetBiometria.NomeTabela +
                                  ' WHERE CHAVE_ID = '+IntToStr(vlVetBiometria.Chave_id);
  ClientAncestral.Active := True;
  AtualizarSelecao;
end;

procedure TfrmCapturarBiometria.Dedo1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  vlDedoSel := copy((TShape(Sender).Name),5,2);
end;

procedure TfrmCapturarBiometria.Dedo1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  vlDedoSel := copy((TShape(Sender).Name),5,2);
  if ClientAncestral.Locate('DIGITAL_ID',StrToInt(vlDedoSel), [loCaseInsensitive]) then
       TShape(Sender).Brush.Color := clRed
  else TShape(Sender).Brush.Color := clNavy;
end;

procedure TfrmCapturarBiometria.AtualizarSelecao;
var
  i : integer;
begin
  for i := 1 to 10 do
    if ClientAncestral.Locate('DIGITAL_ID',i, [loCaseInsensitive]) then
         TShape(FindComponent('Dedo'+ IntToStr(i))).Brush.Color := clRed
    else TShape(FindComponent('Dedo'+ IntToStr(i))).Brush.Color := $00808040;
end;

procedure TfrmCapturarBiometria.Dedo1MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  vlVetBiometria.idDigitalGravar := StrToInt(copy((TShape(Sender).Name),5,2));
  AtualizarSelecao;
  vlVetBiometria.AtualizarDigital := False;

  if TShape(Sender).Brush.Color = clRed then
  begin
    with CreateMessageDialog('O que deseja fazer?', mtConfirmation, [mbYes, MbNo, mbCancel]) do
    begin
      Caption := 'Pergunta do Sistema ?';
      Width   := 280;
      (FindComponent('YES') as TButton).Caption    := 'Atualizar';
      (FindComponent('NO') as TButton).Caption     := 'Excluir';
      (FindComponent('NO') as TButton).Width       := 80;
      (FindComponent('CANCEL') as TButton).Caption := 'Cancelar';
      (FindComponent('CANCEL') as TButton).Left    := 185;
      ShowModal;
      {Associado}
      if (ModalResult = mrYes) then
      begin
        vlVetBiometria.AtualizarDigital      := True;
        pgcCapturarBiometria.ActivePageIndex := 1;
        pgcCapturarBiometriaChange(self);
      end
      else
        if(ModalResult = mrNo) then
        begin
          vlDedoSel := copy((TShape(Sender).Name),5,2);

          ExcluirArquivosDigital(vlVetBiometria.Chave_id, StrToInt(vlDedoSel));

          ExecutaSqlAuxiliar(' DELETE FROM '+ vlVetBiometria.NomeTabela +
                             ' WHERE CHAVE_ID = '+IntToStr(vlVetBiometria.Chave_id)+
                             ' AND DIGITAL_ID = '+vlDedoSel,1);
          ClientAncestral.Refresh;
          AtualizarSelecao;
        end
        else exit
    end;
  end
  else
  begin
    pgcCapturarBiometria.ActivePageIndex := 1;
    pgcCapturarBiometriaChange(self);
  end;
  dtmControles.sqlAuxiliar.Active := False;  
end;

procedure TfrmCapturarBiometria.Image1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  AtualizarSelecao;
end;

procedure TfrmCapturarBiometria.btnRetornarClick(Sender: TObject);
begin
  pgcCapturarBiometria.ActivePageIndex := 0;
  lblPrimeiraCaptuta.Enabled           := True;
  lblPrimeiraCaptuta.Caption           := 'Pressione para 1ª Captura (F5)';
  HabilitarPaineisBiometricos2(False);
  pgcCapturarBiometriaChange(self);
  ClientAncestral.Refresh;
end;

procedure TfrmCapturarBiometria.FormShow(Sender: TObject);
begin
  inherited;
  if not LocalizarHardwareFingKey then
    btnCancelarClick(self);
end;

procedure TfrmCapturarBiometria.lblPrimeiraCaptutaClick(Sender: TObject);
var
  viCapturarDigital : Integer;
begin
  inherited;
  if not LocalizarHardwareFingKey then
    exit;

  CarregarBaseBiometria;
  lblPrimeiraCaptuta.Caption := 'Realizando Captura';
  lblPrimeiraCaptuta.Refresh;
  lblPrimeiraCaptuta.Enabled := False;

  vlVetBiometria.idDigitalGravar   := StrToInt(vlDedoSel);
  vlobjExtraction.FingerWnd        := pnlPrimeiraCaptura.Handle;
  vlVetBiometria.idDigitalScannear := 0;

  viCapturarDigital := CapturarDigital('C');

  if viCapturarDigital <> 0 then
  begin
    if viCapturarDigital = -1 then
         ShowMessage('Não foi possivel capturar a Digital. Tente Novamente!!!')
    else ShowMessage('Esta Digital já está Cadastrada para esta pessoa!!!');

    lblPrimeiraCaptuta.Caption := 'Pressione para 1ª Captura (F5)';
    lblPrimeiraCaptuta.Enabled := True;
    pnlPrimeiraCaptura.Refresh;
    exit;
  end;

  if vgCaptura then
  begin
    lblPrimeiraCaptuta.Caption  := '1ª Captura OK';
    HabilitarPaineisBiometricos2(True);
  end
  else
  begin
    lblPrimeiraCaptuta.Caption := 'Pressione para 1ª Captura (F5)';
    lblPrimeiraCaptuta.Enabled := True;
  end;
  lblPrimeiraCaptuta.Refresh;
end;

procedure TfrmCapturarBiometria.lblSegundaCapturaClick(Sender: TObject);
begin
  inherited;
  lblSegundaCaptura.Caption := 'Realizando Captura';
  lblSegundaCaptura.Refresh;

  vlVetBiometria.idDigitalScannear := 0;
  vlobjExtraction.FingerWnd := pnlSegundaCaptura.Handle;
  CapturarDigital('G');

  if vgCaptura then
  begin
    lblSegundaCaptura.Caption := '2ª Captura OK';
    if Application.MessageBox('Digital Capturada com sucesso. Capturar Outra?' ,'Pergunta', mb_IconQuestion + mb_YesNo + MB_DEFBUTTON2) = idNo then
         btnCancelarClick(self)
    else btnRetornarClick(self);
  end
  else
    if Application.MessageBox('Realizar Captura Novamente?' ,'Pergunta', mb_IconQuestion + mb_YesNo + MB_DEFBUTTON2) = idNo then
         btnCancelarClick(self)
    else btnIniciarNovamenteClick(self);
  lblSegundaCaptura.Refresh;
end;

procedure TfrmCapturarBiometria.btnIniciarNovamenteClick(Sender: TObject);
begin
  inherited;
  pnlPrimeiraCaptura.Refresh;
  pnlSegundaCaptura.Refresh;
  HabilitarPaineisBiometricos2(False);
  lblSegundaCaptura.Caption := 'Pressione para 2ª Captura (F6)';
  lblPrimeiraCaptutaClick(self);
end;

procedure TfrmCapturarBiometria.pgcCapturarBiometriaChange(
  Sender: TObject);
begin
  inherited;
  lblInformacaoObservacao.Visible := pgcCapturarBiometria.ActivePageIndex = 0;
  btnRetornar.Enabled             := pgcCapturarBiometria.ActivePageIndex = 1;
  if pgcCapturarBiometria.ActivePageIndex = 0 then
    btnIniciarNovamente.Enabled   := False;
end;

procedure TfrmCapturarBiometria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  vlVetBiometria.AtualizarDigital := False;

  Action := caFree;
  frmCapturarBiometria := nil;
end;

procedure TfrmCapturarBiometria.HabilitarPaineisBiometricos2(
  vpHabilitado: Boolean);
begin
  pnlMostrarSegundaCaptura.Visible := vpHabilitado;
  lblInfo2Captura.Visible          := vpHabilitado;
  lblSegundaCaptura.Visible        := vpHabilitado;
  btnIniciarNovamente.Enabled      := vpHabilitado;
end;

procedure TfrmCapturarBiometria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (key = 116) then
    if (lblPrimeiraCaptuta.Enabled) and (pgcCapturarBiometria.ActivePageIndex = 1) then
      lblPrimeiraCaptutaClick(self);

  if (key = 117) then
    if (lblSegundaCaptura.Visible) and (lblSegundaCaptura.Enabled) and (pgcCapturarBiometria.ActivePageIndex = 1) then
      lblSegundaCapturaClick(self);
end;

end.
