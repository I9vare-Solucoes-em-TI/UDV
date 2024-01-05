program ClientesVersao;

uses
  Forms,
  ControleVersao in 'ControleVersao.pas' {frmControleVersao};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmControleVersao, frmControleVersao);
  Application.Run;
end.
