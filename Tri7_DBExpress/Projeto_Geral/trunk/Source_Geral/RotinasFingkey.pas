unit RotinasFingkey;

interface

uses
 Dialogs, SysUtils, ComObj, DbClient, Forms, Controls, System.UITypes;

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

  vlArquivo, vlSubPasta, vlPasta, vlLocalImagem : String;

  vgNomePessoaBiometrica : string;
  vgChavePessoaBiometria : integer;
  vgCaptura : Boolean;

  Function  LocalizarHardwareFingKey(vpMensagem : Boolean = True):Boolean;
  Function  CriarModuloFingKey:Boolean;
  Function  CapturarDigital(vpOperacao : Char; vpMostrarCapturador : Boolean = False; vpTitulo : string = ''):Integer;
  Function  VerificarDigital(vpDigital : WideString):integer;
  Function  CarregarBaseBiometria(vpFiltrar : Boolean = True):Boolean;
  Function  VerificarDedoScanner(vpDedoScanner : Integer):String;
  procedure ExecutaSimpleDSAux(vpSql : string; vpTipo : integer);
  procedure ExecutaSqlAuxiliar(vpSql : string; vpTipo : integer);
  function VerificarPastaImagem(vpPastaImagem : string; vpNumero : Integer):Boolean;


implementation

{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

uses Controles, DB, CapturarBiometriaVerifica, Rotinas;


function VerificarPastaImagem(vpPastaImagem : string; vpNumero : Integer):Boolean;
begin
  vlLocalImagem := dtmControles.BuscarConfig('IMAGEM', 'GERAL', 'LOCAL_IMAGEM', 'S');

  vlPasta := Trim(vlLocalImagem+'\'+vpPastaImagem);
  if (vlPasta = '') or (not DirectoryExists(vlPasta)) then
  begin
    ShowMessage('Local de Imagens de '+ vpPastaImagem+' n�o encontrado!!!');
    Screen.Cursor := crDefault;
    Result := False;
    Abort;
  end;

  vlSubPasta := Copy(FormatFloat('000000',vpNumero),1,3);
  if Copy(vlPasta,Length(vlPasta),1) <> '\' then
    vlPasta := vlPasta + '\';
  vlPasta := vlPasta + vlSubPasta + '\';

  if not DirectoryExists(vlPasta) then
    MkDir(vlPasta);
  Result := True;
end;

procedure ExecutaSimpleDSAux(vpSql: string; vpTipo: integer);
begin
  with dtmControles.SimpleAuxiliar do
  begin
    Active := False;
    DataSet.CommandText := '';
    DataSet.CommandText := vpSql;
    case vpTipo of
      0 : Active := True;
      1 : Execute;
      // Tipo = 2, significa que vai receber parametros.
    end;
  end;
end;


Function  VerificarDedoScanner(vpDedoScanner : Integer):String;
begin
  case vpDedoScanner of
    1  : Result := 'Polegar Direito';
    2  : Result := 'Indicador Direito';
    3  : Result := 'M�dio Direito';
    4  : Result := 'Anelar Direito';
    5  : Result := 'Minimo Direito';
    6  : Result := 'Polegar Esquerdo';
    7  : Result := 'Indicador Esquerdo';
    8  : Result := 'M�dio Esquerdo';
    9  : Result := 'Anelar Esquerdo';
    10 : Result := 'Minimo Esquerdo';
  end;

end;

Function LocalizarHardwareFingKey(vpMensagem : Boolean = True):Boolean;
begin
  try
    vlobjDevice.Open(255);

    if vlobjDevice.ErrorCode <> 0 then
    begin
      vlobjDevice.Close(255);
      LocalizarHardwareFingKey := False;
      abort;
    end;
    LocalizarHardwareFingKey := True;
    vlobjDevice.Close(255);

    // Inicializa Parametros do Objeto
    vlobjExtraction.WindowStyle := 1; // Pode ser 1(Form do Fingkey Invisivel) ou 0(Form do Fingkey Visivel);
    vlobjExtraction.FPForeColor := '$$00804000';
    vlobjExtraction.FPBackColor := '$$00804000';
  except
    LocalizarHardwareFingKey := False;
    if vpMensagem then
      MessageDlg('Erro ao tentar localizar o "Scanner da Digital Biom�tica"!!!', mtError, [mbOK],0);
  end;
end;

procedure ExecutaSqlAuxiliar(vpSql : string; vpTipo : integer);
begin
  with dtmControles.sqlAuxiliar do
  begin
    Active := False;
    sql.Clear;
    SQL.Add(vpSql);
    case vpTipo of
      0 : Active := True;
      1 : ExecSQL(FALSE);
      // Tipo = 2, significa que vai receber parametros.
    end;
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
      ShowMessage('Falha na cria��o do m�dulo do Scanner FingKey.'+#13+#13+'Instale o SDK do Scanner FingKey!!!');
    CriarModuloFingKey := vlobjIndexSearch.ErrorCode = 0;
  except
    Abort;
  end;
end;

Function CapturarDigital(vpOperacao : Char; vpMostrarCapturador : Boolean = False; vpTitulo : string = ''):Integer;
var
  viFlag : integer;
  viDigital,
  viNomeArquivo : string;

  procedure GravarDigital;
  var
    viIdBiometria : Integer;
  begin
     ExecutaSqlAuxiliar(' INSERT INTO '+vlVetBiometria.NomeTabela + ' ( '+
                          vlVetBiometria.NomeIdTabela +', '+
                       '   DIGITAL_ID, '+
                       '   OBJETO, '+
                       '   IMAGEM, '+
                       '   CHAVE_ID) '+
                       ' VALUES ( '+
      '             :ID_TABELA, '+
      '             :DIGITAL_ID, '+
      '             :OBJETO, '+
      '             :IMAGEM, '+
      '             :CHAVE_ID)',2);
    viIdBiometria := dtmControles.GerarSequencia(vlVetBiometria.NomeTabela);
    dtmControles.sqlAuxiliar.ParamByName('ID_TABELA').AsInteger  := viIdBiometria;
    dtmControles.sqlAuxiliar.ParamByName('DIGITAL_ID').AsInteger := vlVetBiometria.idDigitalGravar;

    if viFlag = 1 then
         dtmControles.sqlAuxiliar.ParamByName('OBJETO').AsString := CompressString(vlobjExtraction.TextEncodeFIR)
    else dtmControles.sqlAuxiliar.ParamByName('OBJETO').AsString := CompressString(vlCodigoDigital);

    //Grava imagem se existir
    //if FileExists(viDigital) then
    //  dtmControles.sqlAuxiliar.ParamByName('IMAGEM').LoadFromFile(viDigital, ftBlob);

    if vlVetBiometria.NomeTabela = 'T_BIOMETRIA_PESSOA' then
    begin
      if FileExists(viDigital) then
      begin
        VerificarPastaImagem('BIOMETRIA',viIdBiometria);
        viNomeArquivo := vlPasta+'BIO_'+FormatFloat('00000000',viIdBiometria)+'#'+vgImgExt;
        CopyFiles(viDigital,viNomeArquivo);
      end;
    end;

    dtmControles.sqlAuxiliar.ParamByName('CHAVE_ID').AsInteger := vlVetBiometria.Chave_id;
    dtmControles.sqlAuxiliar.ExecSQL(FALSE);
  end;

begin
  Result := -1;
  try
    if vlVetBiometria.idDigitalScannear = -1 then
    begin
      Screen.Cursor := crDefault;
      abort;
    end;

    vlobjDevice.Open(255);

    if not vpMostrarCapturador then
      vlobjExtraction.Capture(1)
    else
    begin
      ExibirFormulario(TfrmCapturarBiometriaVerifica, frmCapturarBiometriaVerifica, True, True);
      frmCapturarBiometriaVerifica.lblInformacao.Caption := vpTitulo;

      frmCapturarBiometriaVerifica.lblDedo2.Visible := vlVetBiometria.idDigitalScannear2 <> 0;
      if vlVetBiometria.idDigitalScannear > 0 then
      begin
        frmCapturarBiometriaVerifica.lblDedo.Caption := VerificarDedoScanner(vlVetBiometria.idDigitalScannear);
        if vlVetBiometria.idDigitalScannear2 <> 0 then
          frmCapturarBiometriaVerifica.lblDedo2.Caption := 'e/ou '+ VerificarDedoScanner(vlVetBiometria.idDigitalScannear2);
      end
      else frmCapturarBiometriaVerifica.lblDedo.Caption := 'Coloque o Dedo...';

      vlobjExtraction.FingerWnd := frmCapturarBiometriaVerifica.pnlPrimeiraCaptura.Handle;
      frmCapturarBiometriaVerifica.Refresh;
      frmCapturarBiometriaVerifica.ProgressClick(nil);
      vlobjExtraction.Capture(1);
      frmCapturarBiometriaVerifica.Close;
    end;

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

             // Verifica Digitais Biom�tricas
             vlobjMatching := vlobjNBioBSP.Matching;
             vlobjMatching.VerifyMatch(vlCodigoDigital, vlobjExtraction.TextEncodeFIR);

             if vlobjMatching.MatchingResult <> 1 then
             begin
               vgCaptura := False;
               ShowMessage('Digitais Biom�tricas n�o conferem!');
             end
             else
             begin
               viFlag := 2;
               if vlVetBiometria.AtualizarDigital then
                 ExecutaSqlAuxiliar(' DELETE FROM '+vlVetBiometria.NomeTabela +
                                    ' WHERE CHAVE_ID   = '+ IntToStr(vlVetBiometria.Chave_id)+
                                    '   AND DIGITAl_ID = '+ IntToStr(vlVetBiometria.idDigitalGravar),1);

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
  vlVetBiometria.idDigitalScannear := -1;
  Screen.Cursor := crDefault;
  vlobjDevice.Close(255);
end;

Function CarregarBaseBiometria(vpFiltrar : Boolean = True):Boolean;
begin
  // Pega as Digitais
  if vpFiltrar then
       ExecutaSimpleDSAux(' SELECT * FROM '+vlVetBiometria.NomeTabela +
                          ' WHERE CHAVE_ID   = '+ IntToStr(vlVetBiometria.Chave_id),0)
  else ExecutaSimpleDSAux(' SELECT * FROM '+vlVetBiometria.NomeTabela,0);

  vlobjIndexSearch.ClearDB;
  vlVetBiometria.idDigitalScannear  := 0;
  vlVetBiometria.idDigitalScannear2 := 0;
  While not dtmControles.SimpleAuxiliar.Eof do
  begin
    if (vlVetBiometria.idDigitalGravar = dtmControles.SimpleAuxiliar.FieldByName('DIGITAL_ID').AsInteger) and
       (vlVetBiometria.AtualizarDigital) then
    begin
      dtmControles.SimpleAuxiliar.Next;
      Continue;
    end;
    vlobjIndexSearch.AddFIR(DeCompressString(dtmControles.SimpleAuxiliar.FieldByName('OBJETO').AsString),
                            dtmControles.SimpleAuxiliar.RecNo);
    if (vlVetBiometria.idDigitalScannear = 0) and (vpFiltrar) then
    begin
      vlVetBiometria.idDigitalScannear := dtmControles.SimpleAuxiliar.FieldByName('DIGITAL_ID').AsInteger;
      if dtmControles.SimpleAuxiliar.RecordCount > 1 then
      begin
        dtmControles.SimpleAuxiliar.Last;
        vlVetBiometria.idDigitalScannear2 := dtmControles.SimpleAuxiliar.FieldByName('DIGITAL_ID').AsInteger;
        dtmControles.SimpleAuxiliar.First;
      end;
    end;

    dtmControles.SimpleAuxiliar.Next;
  end;
  CarregarBaseBiometria := not dtmControles.SimpleAuxiliar.IsEmpty;
end;

Function VerificarDigital(vpDigital : WideString):integer;
begin
  vlobjIndexSearch.IdentifyUser(vpDigital, 5);

  if vlobjIndexSearch.ErrorCode = 0 then
  begin
    dtmControles.SimpleAuxiliar.RecNo := vlobjIndexSearch.UserID;
    VerificarDigital := dtmControles.SimpleAuxiliar.FieldByName('CHAVE_ID').AsInteger;
  end
  else VerificarDigital := 0;
end;

end.
