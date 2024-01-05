unit AtualizacaoSistema;

interface

uses
  Forms, SysUtils, Controls;

  procedure AtualizarEstruturaSistema;

implementation

uses
  Controles, Atualizacao, Rotinas;


procedure AtualizarEstruturaSistema;
var
 arq   : TextFile;
 linha, visql: String;
 viArquivo : string;
 viAtualizando : Boolean;
 viVersaoScript : string;

 Function SetarProximaAtualizacao:Boolean;
 begin
   repeat
     Readln ( arq, linha );
   until (POS('ATUALIZACAO', UpperCase(linha)) > 0) or (Eof ( arq ));

   SetarProximaAtualizacao := (Eof ( arq ));
 end;

 procedure ImportarRelatorio;
 var
   viIdRelatorio, viNomeArquivoRelatorio : String;
 begin
   viIdRelatorio          := copy(visql, 21, 3);
   viNomeArquivoRelatorio := copy(visql, 25, 60);

   With dtmControles do
   begin
     DataSetAncestral.Close;
     DataSetAncestral.Params[0].AsInteger := 17;
     DataSetAncestral.Params[1].AsInteger := StrtoInt(viIdRelatorio);
     ClientAncestral.Close;
     ClientAncestral.Open;
   end;

  if FileExists(GetCurrentDir + '\Rel\'+viNomeArquivoRelatorio) then
    With dtmControles do
    begin
      ClientAncestral.Edit;
      ClientAncestralRELATORIO.LoadFromFile(GetCurrentDir + '\Rel\'+viNomeArquivoRelatorio);
      ClientAncestralRELATORIO.AsString := CompressString(dtmControles.Cripto.CriptoHexToText(ClientAncestralRELATORIO.AsString));
      ClientAncestral.Post;
      ClientAncestral.ApplyUpdates(-1);
    end;
 end;

begin
  if FileExists(GetCurrentDir + '\AtualizaRegistro.dll') then
       viArquivo := 'AtualizaRegistro.dll'
  else exit;

  AssignFile ( arq, GetCurrentDir + '\'+ viArquivo);
  Reset ( arq );
  if SetarProximaAtualizacao then
  begin
    CloseFile( arq );
    Screen.Cursor := crDefault;
    exit;
  end;

  viAtualizando := False;
  while not Eof ( arq ) do
  begin
    try
      Readln ( arq, linha );

      if POS('ATUALIZACAO', UpperCase(linha)) > 0 then
        Continue;

      if trim(linha) <> '' then
        visql := visql + ' ' + linha
      else
      begin
        if trim(visql) <> '' then
        begin
          if POS('IMPORTAR_RELATORIO', UpperCase(visql)) > 0  then
            ImportarRelatorio
          else
          begin
            ExecutaSqlAuxiliar(visql,1);
            if (not viAtualizando) then
            begin
              frmAtualizacao := TfrmAtualizacao.Create(nil);
              frmAtualizacao.Show;
              frmAtualizacao.Refresh;
              Screen.Cursor := crHourGlass;
              viAtualizando := True;
            end;
          end;
        end;
        visql := '';
      end;

    except
      if SetarProximaAtualizacao then
        Break;
      visql := '';
    end;
  end;

  CloseFile( arq );

  if frmAtualizacao <> nil then
    frmAtualizacao.Close;
end;

end.
