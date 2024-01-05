unit AtualizacaoSistema;

interface

uses
  Forms, SysUtils, Controls, System.Classes;

  procedure AtualizarEstruturaSistema;

implementation

{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

uses
  Controles, Atualizacao, Rotinas;

procedure AtualizarEstruturaSistema;
var
 arq   : TextFile;
 linha, visql: String;
 viArquivo : string;
 viAtualizando : Boolean;

 Function SetarProximaAtualizacao:Boolean;
 begin
   repeat
     Readln ( arq, linha );
   until (POS('ATUALIZACAO', UpperCase(linha)) > 0) or (Eof ( arq ));

   SetarProximaAtualizacao := (Eof ( arq ));
 end;

 procedure ImportarRelatorio;
 var
   viIdRelatorio,
   viNomeArquivoRelatorio,
   viArquivo : String;
 begin
   viIdRelatorio          := copy(visql, 21, 3);
   viNomeArquivoRelatorio := copy(visql, 25, 60);

   With dtmControles do
   begin
     DataSetAncestral.Close;
     DataSetAncestral.ParamByName('SISTEMA_ID').AsInteger := 17;
     DataSetAncestral.ParamByName('CONFIG_RELATORIO_ID').AsInteger := StrtoInt(viIdRelatorio);
     ClientAncestral.Close;
     ClientAncestral.Open;
   end;

   viArquivo := GetCurrentDir + '\Rel\'+viNomeArquivoRelatorio;

   if FileExists(viArquivo) then
    With dtmControles do
    begin
      ClientAncestral.Edit;
      ClientAncestralRELATORIO.LoadFromFile(viArquivo);
      ClientAncestralRELATORIO.AsString := CompressString(dtmControles.Cripto.CriptoHexToText(ClientAncestralRELATORIO.AsString));
      ClientAncestral.Post;
      ClientAncestral.ApplyUpdates(-1);
    end;
 end;

begin
  if FileExists(IncludeTrailingPathDelimiter(GetCurrentDir)+ 'AtualizaRegistro.dll') then
       viArquivo := 'AtualizaRegistro.dll'
  else exit;

  AssignFile ( arq, IncludeTrailingPathDelimiter(GetCurrentDir) + viArquivo);
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





