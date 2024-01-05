unit RotinasFingkey;

interface

uses
 Dialogs, SysUtils, ComObj, DbClient, Forms;

type
  TBiometria = Record
    NomeTabela, NomeIdTabela  : string;
    Chave_id, idDigitalGravar, idDigitalScannear : integer;
    AtualizarDigital : Boolean;
  end;

var
  vlobjNBioBSP, vlobjDevice, vlobjExtraction, vlobjIndexSearch, vlobjMatching : variant;
  vlCodigoDigital, vlCodigoVerificar : WideString;
  vlVetBiometria : TBiometria;

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


implementation

uses Controles, DB, CapturarBiometriaVerifica, Rotinas;

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
  try
    vlobjNBioBSP     := CreateOleObject('NBioBSPCOM.NBioBSP');
    vlobjDevice      := vlobjNBioBSP.Device;
    vlobjExtraction  := vlobjNBioBSP.Extraction;
    vlobjIndexSearch := vlobjNBioBSP.IndexSearch;

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

  procedure GravarDigital;
  begin
    ExecutaSqlAuxiliar(' INSERT INTO '+vlVetBiometria.NomeTabela + ' ( '+
                          vlVetBiometria.NomeIdTabela +', '+
                       '   DIGITAL_ID, '+
                       '   OBJETO, '+
                       '   CHAVE_ID) '+
                       ' VALUES ( '+
      '             :ID_TABELA, '+
      '             :DIGITAL_ID, '+
      '             :OBJETO, '+
      '             :CHAVE_ID)',2);
    dtmControles.sqlAuxiliar.ParamByName('ID_TABELA').AsInteger  := dtmControles.GerarSequencia(vlVetBiometria.NomeTabela);
    dtmControles.sqlAuxiliar.ParamByName('DIGITAL_ID').AsInteger := vlVetBiometria.idDigitalGravar;
    if viFlag = 1 then
         dtmControles.sqlAuxiliar.ParamByName('OBJETO').AsBlob := CompressString(vlobjExtraction.TextEncodeFIR)
    else dtmControles.sqlAuxiliar.ParamByName('OBJETO').AsBlob := CompressString(vlCodigoDigital);
    dtmControles.sqlAuxiliar.ParamByName('CHAVE_ID').AsInteger := vlVetBiometria.Chave_id;
    dtmControles.sqlAuxiliar.ExecSQL(FALSE);
  end;

begin
  try
    if vlVetBiometria.idDigitalScannear = -1 then
      abort;

    vlobjDevice.Open(255);

    if not vpMostrarCapturador then
      vlobjExtraction.Capture(1)
    else
    begin
      ExibirFormulario(TfrmCapturarBiometriaVerifica, frmCapturarBiometriaVerifica, True, True);
      frmCapturarBiometriaVerifica.lblInformacao.Caption := vpTitulo;

      if vlVetBiometria.idDigitalScannear > 0 then
           frmCapturarBiometriaVerifica.lblDedo.Caption := VerificarDedoScanner(vlVetBiometria.idDigitalScannear)
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
        CapturarDigital := 0;
      vgCaptura := False;
      exit;
    end;

    vgCaptura := True;
    case vpOperacao of
     'C' : begin
             vlCodigoDigital := vlobjExtraction.TextEncodeFIR;
             CapturarDigital := VerificarDigital(vlCodigoDigital);
           end;

     'V' : CapturarDigital := VerificarDigital(vlobjExtraction.TextEncodeFIR);

     'G' : begin
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
             CapturarDigital := 1;
           end;
    end;
  except
    vgCaptura := False;
  end;
  vlVetBiometria.idDigitalScannear := -1;
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
  vlVetBiometria.idDigitalScannear := 0;
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
      vlVetBiometria.idDigitalScannear := dtmControles.SimpleAuxiliar.FieldByName('DIGITAL_ID').AsInteger;

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
