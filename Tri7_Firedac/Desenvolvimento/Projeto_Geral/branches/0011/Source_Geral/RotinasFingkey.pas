unit RotinasFingkey;

interface

uses
 Dialogs, System.SysUtils, ComObj, DbClient, Forms, Controls, System.UITypes, I9Query;

type
  TBiometria = Record
    NomeTabela, NomeIdTabela  : string;
    Chave_id, idDigitalGravar, idDigitalScannear, idDigitalScannear2 : integer;
    AtualizarDigital : Boolean;
  end;

var
  vlobjNBioBSP, vlobjDevice, vlobjExtraction, vlobjIndexSearch, vlobjMatching, vlobjImage : variant;
  vlCodigoDigital, vlCodigoVerificar : WideString;
  vlVetBiometria : TBiometria;

  vgNomePessoaBiometrica : string;
  vgChavePessoaBiometria : integer;
  vgCaptura : Boolean;

  Function  CriarModuloFingKey:Boolean;
  procedure FecharModuloFingKey;
  Function  LocalizarHardwareFingKey(vpMensagem : Boolean = True):Boolean;
  procedure ExcluirArquivosDigital(const vpChaveId, vpDigitalId: Integer);
  Function  CapturarDigital(vpOperacao : Char; vpMostrarCapturador : Boolean = False; vpTitulo : string = ''):Integer;
  Function  VerificarDigital(vpDigital : WideString):integer;
  Function  CarregarBaseBiometria(vpFiltrar : Boolean = True):Boolean;
  Function  VerificarDedoScanner(vpDedoScanner : Integer):String;
  function  VerificarPastaImagem(vpPastaImagem : string; vpNumero : Integer):string;


implementation

{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

uses Controles, DB, CapturarBiometriaVerifica, Rotinas;


function VerificarPastaImagem(vpPastaImagem : string; vpNumero : Integer):string;
var
  viPasta,
  viSubPasta,
  viLocalImagem: string;
begin
  Result := EmptyStr;

  viLocalImagem := Trim(dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'LOCAL_IMAGEM', 'S'));

  if (viLocalImagem = '') or (not DirectoryExists(viLocalImagem)) then
  begin
    ShowMessage('Local de Imagens de '+ vpPastaImagem+' não encontrado!!!');
    Screen.Cursor := crDefault;
    Abort;
  end;

  viPasta := IncludeTrailingPathDelimiter(viLocalImagem) + vpPastaImagem;

  viSubPasta := Copy(FormatFloat('000000',vpNumero),1,3);

  viPasta := IncludeTrailingPathDelimiter(IncludeTrailingPathDelimiter(viPasta) + viSubPasta);

  if not DirectoryExists(viPasta) then
    ForceDirectories(viPasta);

  Result := viPasta;
end;

Function  VerificarDedoScanner(vpDedoScanner : Integer):String;
begin
  case vpDedoScanner of
    1  : Result := 'Polegar Direito';
    2  : Result := 'Indicador Direito';
    3  : Result := 'Médio Direito';
    4  : Result := 'Anelar Direito';
    5  : Result := 'Minimo Direito';
    6  : Result := 'Polegar Esquerdo';
    7  : Result := 'Indicador Esquerdo';
    8  : Result := 'Médio Esquerdo';
    9  : Result := 'Anelar Esquerdo';
    10 : Result := 'Minimo Esquerdo';
  end;

end;

Function CriarModuloFingKey:Boolean;
begin
  Result := False;
  try
    vlobjNBioBSP     := CreateOleObject('NBioBSPCOM.NBioBSP');
    vlobjDevice      := vlobjNBioBSP.Device;
    vlobjExtraction  := vlobjNBioBSP.Extraction;
    vlobjIndexSearch := vlobjNBioBSP.IndexSearch;
    vlobjImage       := vlobjNBioBSP.FPImage;

    if (vlobjIndexSearch.ErrorCode <> 0) then
      ShowMessage('Falha na criação do módulo do Scanner FingKey.'+#13+#13+'Instale o SDK do Scanner FingKey!!!');
    CriarModuloFingKey := vlobjIndexSearch.ErrorCode = 0;
  except
    Abort;
  end;
end;

procedure FecharModuloFingKey;
begin
  vlobjNBioBSP := 0;
end;

Function LocalizarHardwareFingKey(vpMensagem : Boolean = True):Boolean;
begin
  Result := False;
  try
    vlobjDevice.Open(255);

    if vlobjDevice.ErrorCode <> 0 then
    begin
      vlobjDevice.Close(255);
      abort;
    end;

    Result := True;
    vlobjDevice.Close(255);

    // Inicializa Parametros do Objeto
    vlobjExtraction.WindowStyle := 1; // Pode ser 1(Form do Fingkey Invisivel) ou 0(Form do Fingkey Visivel);
    vlobjExtraction.FPForeColor := '$$00804000';
    vlobjExtraction.FPBackColor := '$$00804000';
  except
    Result := False;
    if vpMensagem then
      MessageDlg('Erro ao tentar localizar o "Scanner da Digital Biomética"!!!', mtError, [mbOK],0);
  end;
end;

procedure ExcluirArquivosDigital(const vpChaveId, vpDigitalId: Integer);
var
  viPasta,
  viNomeArquivo: string;
  viIdBiometria: Integer;
var
  viQuery: TI9Query;
begin
  if vlVetBiometria.NomeTabela <> 'T_BIOMETRIA_PESSOA' then
    Exit;

  viQuery            := TI9Query.Create(nil);
  viQuery.Connection := dtmControles.DB;
  try
    viQuery.SQL.Text := 'SELECT ' + vlVetBiometria.NomeIdTabela +
                        ' FROM ' + vlVetBiometria.NomeTabela +
                        ' WHERE CHAVE_ID = '+IntToStr(vpChaveId) +
                        ' AND DIGITAL_ID = '+IntToStr(vpDigitalId);
    viQuery.Open;
    viQuery.First;
    while not viQuery.Eof do
    begin
      viIdBiometria := viQuery.FieldByName(vlVetBiometria.NomeIdTabela).AsInteger;

      viPasta := VerificarPastaImagem('BIOMETRIA', viIdBiometria);
      if not viPasta.IsEmpty then
      begin
        viNomeArquivo := viPasta+'BIO_'+FormatFloat('00000000',viIdBiometria)+'#'+vgImgExt;
        if FileExists(viNomeArquivo) then
          DeleteFile(viNomeArquivo);
      end;
      viQuery.Next;
    end;
  finally
    viQuery.Close;
    FreeAndNil(viQuery);
  end;
end;

Function CapturarDigital(vpOperacao : Char; vpMostrarCapturador : Boolean = False; vpTitulo : string = ''):Integer;
var
  viFlag : integer;
  viDigital,
  viPasta : string;

  procedure GravarDigital;
  var
    viIdBiometria: Integer;
    viNomeArquivo: string;
    viQuery: TI9Query;
  begin
    viQuery            := TI9Query.Create(nil);
    viQuery.Connection := dtmControles.DB;

    try
       viQuery.SQL.Text := ' INSERT INTO '+vlVetBiometria.NomeTabela + ' ( '+
                                          vlVetBiometria.NomeIdTabela +', '+
                                          ' DIGITAL_ID, '+
                                          ' OBJETO, '+
                                          ' IMAGEM, '+
                                          ' CHAVE_ID) '+
                            ' VALUES ( '+
                                          ' :ID_TABELA, '+
                                          ' :DIGITAL_ID, '+
                                          ' :OBJETO, '+
                                          ' :IMAGEM, '+
                                          ' :CHAVE_ID)';

      //Gerar Sequência
      viIdBiometria := dtmControles.GerarSequencia(vlVetBiometria.NomeTabela);

      viQuery.ParamByName('ID_TABELA').AsInteger  := viIdBiometria;
      viQuery.ParamByName('DIGITAL_ID').AsInteger := vlVetBiometria.idDigitalGravar;

      if viFlag = 1 then
        viQuery.ParamByName('OBJETO').AsString := CompressString(vlobjExtraction.TextEncodeFIR)
      else
        viQuery.ParamByName('OBJETO').AsString := CompressString(vlCodigoDigital);

      if vlVetBiometria.NomeTabela = 'T_BIOMETRIA_PESSOA' then
      begin
        if FileExists(viDigital) then
        begin
          viPasta := VerificarPastaImagem('BIOMETRIA', viIdBiometria);
          if not viPasta.IsEmpty then
          begin
            viNomeArquivo := viPasta+'BIO_'+FormatFloat('00000000',viIdBiometria)+'#'+vgImgExt;
            CopyFiles(viDigital, viNomeArquivo);
            if not FileExists(viNomeArquivo) then
              MessageDlg('Erro, não foi possivel salvar a imagem da BIOMETRIA no servidor!', mtError, [mbOK],0);
          end;
        end;
      end;

      viQuery.ParamByName('CHAVE_ID').AsInteger := vlVetBiometria.Chave_id;
      viQuery.ExecSQL;
    finally
      FreeAndNil(viQuery);
    end;
  end;

begin
  Result := -1;

  if vlVetBiometria.idDigitalScannear = -1 then
  begin
    Screen.Cursor := crDefault;
    abort;
  end;

  try
    vlobjDevice.Open(255);
    try
      if not vpMostrarCapturador then
        vlobjExtraction.Capture(1)
      else
      begin
        if frmCapturarBiometriaVerifica = nil then
          Application.CreateForm(TfrmCapturarBiometriaVerifica, frmCapturarBiometriaVerifica);

        try
          frmCapturarBiometriaVerifica.lblInformacao.Caption := vpTitulo;

          frmCapturarBiometriaVerifica.lblDedo2.Visible := vlVetBiometria.idDigitalScannear2 <> 0;
          if vlVetBiometria.idDigitalScannear > 0 then
          begin
            frmCapturarBiometriaVerifica.lblDedo.Caption := VerificarDedoScanner(vlVetBiometria.idDigitalScannear);
            if vlVetBiometria.idDigitalScannear2 <> 0 then
              frmCapturarBiometriaVerifica.lblDedo2.Caption := 'e/ou '+ VerificarDedoScanner(vlVetBiometria.idDigitalScannear2);
          end
          else
            frmCapturarBiometriaVerifica.lblDedo.Caption := 'Coloque o Dedo...';

          frmCapturarBiometriaVerifica.Show;

          vlobjExtraction.FingerWnd := frmCapturarBiometriaVerifica.pnlPrimeiraCaptura.Handle;
          frmCapturarBiometriaVerifica.Refresh;
          frmCapturarBiometriaVerifica.ProgressClick(nil);
          vlobjExtraction.Capture(1);

        finally
         frmCapturarBiometriaVerifica.Close;
        end;
      end;

      Result := -1;
      if vlobjExtraction.TextEncodeFIR = '' then
      begin
        if vpMostrarCapturador then
          Result := 0;
        vgCaptura := False;
        vlobjDevice.Close(255);
        Screen.Cursor := crDefault;
        exit;
      end;

      vgCaptura := True;

      case vpOperacao of
       'C' : begin
               vlCodigoDigital := vlobjExtraction.TextEncodeFIR;
               Result := VerificarDigital(vlCodigoDigital);
             end;

       'V' : Result := VerificarDigital(vlobjExtraction.TextEncodeFIR);

       'G' : begin
               // Salva Imagem
               viDigital := Copy(ExtractFilePath(Application.ExeName),1,Length(ExtractFilePath(Application.ExeName))-1) + '\digital.jpg';
               if FileExists(viDigital) then
                 DeleteFile(viDigital);

               vlobjImage.Export;
               vlobjImage.Save(viDigital, 3, 0, 1);

               // Verifica Digitais Biométricas
               vlobjMatching := vlobjNBioBSP.Matching;
               vlobjMatching.VerifyMatch(vlCodigoDigital, vlobjExtraction.TextEncodeFIR);

               if vlobjMatching.MatchingResult <> 1 then
               begin
                 vgCaptura := False;
                 ShowMessage('Digitais Biométricas não conferem!');
               end
               else
               begin
                 viFlag := 2;
                 if vlVetBiometria.AtualizarDigital then
                 begin
                   ExcluirArquivosDigital(vlVetBiometria.Chave_id, vlVetBiometria.idDigitalGravar);

                   dtmControles.ExecSQL(' DELETE FROM '+vlVetBiometria.NomeTabela +
                                        ' WHERE CHAVE_ID   = '+ IntToStr(vlVetBiometria.Chave_id)+
                                        '   AND DIGITAl_ID = '+ IntToStr(vlVetBiometria.idDigitalGravar));
                 end;

                 repeat
                   GravarDigital;
                   Dec(viFlag);
                 until viFlag = 0;
               end;
               Result := 1;

               DeleteFile(viDigital);
             end;
      end;
    except
      vgCaptura := False;
    end;
  finally
    vlVetBiometria.idDigitalScannear := -1;
    Screen.Cursor := crDefault;
    vlobjDevice.Close(255);
    Application.ProcessMessages;
  end;

end;

Function CarregarBaseBiometria(vpFiltrar : Boolean = True):Boolean;
var
  viQuery: TI9Query;
begin
  vlobjIndexSearch.ClearDB;
  vlVetBiometria.idDigitalScannear  := 0;
  vlVetBiometria.idDigitalScannear2 := 0;

  viQuery            := TI9Query.Create(nil);
  viQuery.Connection := dtmControles.DB;

  try
    // Pega as Digitais
    if vpFiltrar then
      viQuery.SQL.Text := ' SELECT * FROM '+vlVetBiometria.NomeTabela +
                          ' WHERE CHAVE_ID   = '+ IntToStr(vlVetBiometria.Chave_id)
    else
      viQuery.SQL.Text := ' SELECT * FROM '+vlVetBiometria.NomeTabela;
    viQuery.Open;

    viQuery.First;
    While not viQuery.Eof do
    begin
      if (vlVetBiometria.idDigitalGravar = viQuery.FieldByName('DIGITAL_ID').AsInteger) and
         (vlVetBiometria.AtualizarDigital) then
      begin
        viQuery.Next;
        Continue;
      end;

      vlobjIndexSearch.AddFIR(DeCompressString(viQuery.FieldByName('OBJETO').AsString),
                              viQuery.FieldByName(vlVetBiometria.NomeIdTabela).AsInteger);

      if (vlVetBiometria.idDigitalScannear = 0) and (vpFiltrar) then
      begin
        vlVetBiometria.idDigitalScannear := viQuery.FieldByName('DIGITAL_ID').AsInteger;
        if viQuery.RecordCount > 1 then
        begin
          viQuery.Last;
          vlVetBiometria.idDigitalScannear2 := viQuery.FieldByName('DIGITAL_ID').AsInteger;
          viQuery.First;
        end;
      end;

      viQuery.Next;
    end;

    Result := not viQuery.IsEmpty;
  finally
    FreeAndNil(viQuery);
  end;
end;

Function VerificarDigital(vpDigital : WideString):integer;
var
  viSql: string;
begin
  vlobjIndexSearch.IdentifyUser(vpDigital, 7);

  if vlobjIndexSearch.ErrorCode = 0 then
  begin
    viSql :=  ' SELECT CHAVE_ID FROM '+ vlVetBiometria.NomeTabela +
              ' WHERE ' + vlVetBiometria.NomeIdTabela + ' = '+ IntToStr(vlobjIndexSearch.UserID);
    Result := dtmControles.GetInt(viSql);
  end
  else
    Result := 0;
end;

end.
