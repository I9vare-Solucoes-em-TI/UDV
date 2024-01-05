unit Calculadora;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, cxButtons, cxContainer, cxEdit, cxLabel,
  cxTextEdit, cxSpinEdit, cxRichEdit, cxControls,
  Menus, cxMaskEdit, cxMemo, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters;

type
  TfrmCalculadora = class(TForm)
    pnlPrincipal: TPanel;
    btn1: TcxButton;
    btn2: TcxButton;
    btn3: TcxButton;
    btn4: TcxButton;
    btn5: TcxButton;
    btn6: TcxButton;
    btn7: TcxButton;
    btn8: TcxButton;
    btn9: TcxButton;
    btn0: TcxButton;
    btnVirgula: TcxButton;
    btnSoma: TcxButton;
    btnSubtrai: TcxButton;
    btnMultiplica: TcxButton;
    btnDivide: TcxButton;
    btnMod: TcxButton;
    btnPorcentagem: TcxButton;
    btnDiv: TcxButton;
    edtCasasDecimais: TcxSpinEdit;
    lblCasasDecimais: TcxLabel;
    edtEntrada: TcxTextEdit;
    btnZerarSoma: TcxButton;
    btnLimparHistorico: TcxButton;
    btnImprimirHistorico: TcxButton;
    Panel1: TPanel;
    btnCancelar: TcxButton;
    pnl1: TPanel;
    edtResultado: TcxRichEdit;
    pnlResultado: TPanel;
    procedure btnNumeroClick(Sender: TObject);
    procedure edtCasasDecimaisPropertiesChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnImprimirHistoricoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLimparHistoricoClick(Sender: TObject);
    procedure btnSomaClick(Sender: TObject);
    procedure edtEntradaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtEntradaKeyPress(Sender: TObject; var Key: Char);
    procedure edtEntradaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure btnZerarSomaClick(Sender: TObject);
  private
    { Private declarations }
    vMascara, vOperador, vUltimoOperador: string;
    vEntrada, vValorAtual, vResultado: Double;
    procedure ValidarValorEntrada;
    procedure DeletaResultado;
    procedure CorTotal;
    procedure CorNormal;
  public
    { Public declarations }
  end;

var
  frmCalculadora: TfrmCalculadora;

implementation

{$R *.dfm}

procedure TfrmCalculadora.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCalculadora.btnImprimirHistoricoClick(Sender: TObject);
begin
  edtResultado.Print('RESULTADO ' + #10 + edtResultado.Text);
end;

procedure TfrmCalculadora.btnLimparHistoricoClick(Sender: TObject);
begin
  edtResultado.Clear;
  pnlResultado.Caption := '';
  edtEntrada.SetFocus;
  vValorAtual := 0;
end;

procedure TfrmCalculadora.btnNumeroClick(Sender: TObject);
begin
  edtEntrada.Text := edtEntrada.Text + (Sender as TcxButton).Caption;
end;

procedure TfrmCalculadora.btnSomaClick(Sender: TObject);
begin
  ValidarValorEntrada;

  vOperador := (Sender as TcxButton).Caption;

  if edtResultado.Lines.Count = 0 then
    vValorAtual := 0;

  if vOperador = '+' then
    vResultado := vValorAtual + vEntrada
  else if vOperador = '-' then
    vResultado := vValorAtual - vEntrada
  else if vOperador = '*' then
  begin
    if vValorAtual = 0 then
      vResultado := vEntrada
    else
      vResultado := vValorAtual * vEntrada;
  end
  else if vOperador = '/' then
  begin
    if vValorAtual = 0 then
      vResultado := vEntrada
    else
      vResultado := vValorAtual / vEntrada;
  end
  else if vOperador = '%' then
  begin
    if vValorAtual = 0 then
      vResultado := vEntrada
    else
      vResultado := (vValorAtual * vEntrada) / 100;
  end
  else if vOperador = 'Div' then
  begin
    if vValorAtual = 0 then
      vResultado := vEntrada
    else
      vResultado :=  Round(vValorAtual) div Round(vEntrada);
  end
  else if vOperador = 'Mod' then
  begin
    if vValorAtual = 0 then
      vResultado := vEntrada
    else
      vResultado := Round(vValorAtual) mod Round(vEntrada);
  end;

  vValorAtual := vResultado;

  if vValorAtual = 0 then
    edtResultado.Lines.Add(FormatFloat(vMascara,vResultado) + ' = ')
  else
  begin
    if vUltimoOperador = vOperador then
      DeletaResultado;

    edtResultado.Lines.Add(FormatFloat(vMascara, vEntrada) + ' ' + vOperador + ' ');
    edtResultado.Lines.Add('------------------------');
    CorTotal;

    if vOperador = '+' then
      edtResultado.Lines.Add('Soma: ' + FormatFloat(vMascara, vResultado) + ' = ')
    else if vOperador = '-' then
      edtResultado.Lines.Add('Subtração: ' + FormatFloat(vMascara, vResultado) + ' = ')
    else if vOperador = '*' then
      edtResultado.Lines.Add('Multiplicação: ' + FormatFloat(vMascara, vResultado) + ' = ')
    else if vOperador = '/' then
      edtResultado.Lines.Add('Divisão: ' + FormatFloat(vMascara, vResultado) + ' = ')
    else if vOperador = '%' then
      edtResultado.Lines.Add('%: ' + FormatFloat(vMascara, vResultado) + ' = ')
    else if vOperador = 'Div' then
      edtResultado.Lines.Add('Inteiro: ' + FormatFloat(vMascara, vResultado) + ' = ')
    else if vOperador = 'Mod' then
      edtResultado.Lines.Add('Resto: ' + FormatFloat(vMascara, vResultado) + ' = ');

    CorNormal;
  end;

  if vResultado >= 0 then
    pnlResultado.Font.Color := clBlue
  else
    pnlResultado.Font.Color := clRed;

  pnlResultado.Caption := FormatFloat(vMascara, vResultado);

  edtEntrada.Clear;

  edtResultado.SelStart := Perform(EM_LINEINDEX, (edtResultado.Lines.Count - 1), 0);

  vUltimoOperador := vOperador;
  edtEntrada.SetFocus;
end;

procedure TfrmCalculadora.btnZerarSomaClick(Sender: TObject);
begin
  edtEntrada.Clear;
end;

procedure TfrmCalculadora.edtCasasDecimaisPropertiesChange(Sender: TObject);
var
  i: Integer;
begin
  if edtCasasDecimais.Value = 0 then
    vMascara := '#,#00'
  else
  begin
    vMascara := '#,#00.';

    for i := 1 to edtCasasDecimais.Value do
      vMascara := vMascara + '0';
  end;
end;

procedure TfrmCalculadora.edtEntradaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ADD then
    btnSoma.Click
  else if Key = VK_SUBTRACT then
    btnSubtrai.Click
  else if Key = VK_MULTIPLY then
    btnMultiplica.Click
  else if Key = VK_DIVIDE then
    btnDivide.Click
  else if Key = VK_ESCAPE then
    btnLimparHistorico.Click
  else if Key = VK_RETURN then
  begin
    if Trim(edtEntrada.Text) = '' then
      edtEntrada.Text := FloatToStr(vEntrada);
    if vUltimoOperador = '+' then
      btnSoma.Click
    else if vUltimoOperador = '-' then
      btnSubtrai.Click
    else if vUltimoOperador = '*' then
      btnMultiplica.Click
    else if vUltimoOperador = '/' then
      btnDivide.Click;
  end;
end;

procedure TfrmCalculadora.edtEntradaKeyPress(Sender: TObject; var Key: Char);
begin
  if (not CharInSet(Key,['0'..'9', #8,',']))  then
    Key := #0;
end;

procedure TfrmCalculadora.edtEntradaKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ADD then
    edtEntrada.Clear
  else if Key = VK_SUBTRACT then
    edtEntrada.Clear
  else if Key = VK_MULTIPLY then
    edtEntrada.Clear
  else if Key = VK_DIVIDE then
    edtEntrada.Clear;
end;

procedure TfrmCalculadora.FormActivate(Sender: TObject);
begin
  edtEntrada.SetFocus;
end;

procedure TfrmCalculadora.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmCalculadora := nil;
end;

procedure TfrmCalculadora.ValidarValorEntrada;
begin
  try
    vEntrada := StrToFloat(edtEntrada.Text);
  except
    Application.MessageBox(
      'O valor digitado não é um valor numérico! ' +
      #13#10 +
      'Por favor digite um valor válido!',
      'ATENÇÃO!',
      MB_OK + MB_ICONWARNING
    );

    edtEntrada.Text := '';
    Abort;
  end;
end;

procedure TfrmCalculadora.DeletaResultado;
begin
  if edtResultado.Lines.Count = 1 then
  begin
    edtResultado.Lines.Delete(edtResultado.Lines.Count-1);
  end
  else if edtResultado.Lines.Count > 1 then
  begin
    edtResultado.Lines.Delete(edtResultado.Lines.Count-1);
    edtResultado.Lines.Delete(edtResultado.Lines.Count-1);
  end;
end;

procedure TfrmCalculadora.CorTotal;
begin
  if vResultado >= 0 then
    edtResultado.SelAttributes.Color := clBLue // Cor Azul
  else
    edtResultado.SelAttributes.Color := clRed; // Cor Vermelho

  edtResultado.SelAttributes.Style := [fsBold];// Negrito
end;

procedure TfrmCalculadora.CorNormal;
begin
  edtResultado.SelAttributes.Style := []; // Volta ao estilo normal
  edtResultado.SelAttributes.Color := clBlack; // Volta à cor normal
end;

end.
