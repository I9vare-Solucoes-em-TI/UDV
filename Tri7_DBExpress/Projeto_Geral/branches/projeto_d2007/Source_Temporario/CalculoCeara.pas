unit CalculoCeara;

interface

uses
  Controles,SysUtils;

Type
  TCalculoTabelaCeara = Record
    ResultadoEmol, ResultadoFermoju : Currency;
  End;

  procedure CalculoTabelaCeara(vpValorDocumento, vpValorEmolumento, vpValorInicio, vpPeriodo :
            Currency; vpGrupoTabela : String = 'CALCULO_ANO');

var
  vgCalculoTabela : TCalculoTabelaCeara;

implementation


procedure CalculoTabelaCeara(vpValorDocumento, vpValorEmolumento, vpValorInicio, vpPeriodo :
            Currency; vpGrupoTabela : String = 'CALCULO_ANO');
var
  viEmolAdExcedente, viEmolFracao, viEmolMaximoAd, FermojuAdEmol, FermojuTxAdicional : Currency;
var
  viAno : String;
begin

  viAno := dtmControles.GetStr(' SELECT ANO FROM G_EMOLUMENTO_PERIODO WHERE EMOLUMENTO_PERIODO_ID = '+CurrToStr(vpPeriodo));

  viEmolAdExcedente   := dtmControles.BuscarConfig('CALCULO_CEARA',vpGrupoTabela+'_'+viAno,'EMOLUMENTO_ADICIONAL_EXCEDENTE','D');
  viEmolFracao        := dtmControles.BuscarConfig('CALCULO_CEARA',vpGrupoTabela+'_'+viAno,'EMOLUMENTO_FRACAO_EXCEDENTE','D');
  viEmolMaximoAd      := dtmControles.BuscarConfig('CALCULO_CEARA',vpGrupoTabela+'_'+viAno,'EMOLUMENTO_MAXIMO_ADICIONAL','D');
  FermojuAdEmol       := dtmControles.BuscarConfig('CALCULO_CEARA',vpGrupoTabela+'_'+viAno,'FERMOJU_ADICIONAL_EMOLUMENTO','D');
  FermojuTxAdicional  := dtmControles.BuscarConfig('CALCULO_CEARA',vpGrupoTabela+'_'+viAno,'FERMOJU_TAXA_ADICIONAL','D');

  // Calculo Emolumentos Fase 1 (Estado do Ceará)
  vgCalculoTabela.ResultadoEmol := ((vpValorDocumento-(vpValorInicio-0.01))/viEmolFracao) * viEmolAdExcedente;

  if vgCalculoTabela.ResultadoEmol > viEmolMaximoAd then
       vgCalculoTabela.ResultadoEmol := viEmolMaximoAd + dtmControles.sqlAuxiliar.Fields[0].AsCurrency
  else vgCalculoTabela.ResultadoEmol := vgCalculoTabela.ResultadoEmol + vpValorEmolumento;

  vgCalculoTabela.ResultadoFermoju := (((vgCalculoTabela.ResultadoEmol-vpValorEmolumento) * FermojuAdEmol)/100)+ FermojuTxAdicional;
  vgCalculoTabela.ResultadoFermoju := (((vgCalculoTabela.ResultadoEmol-vpValorEmolumento) * FermojuAdEmol)/100)+ FermojuTxAdicional;

  // Calculo Emolumentos Fase 1 (Estado do Ceará)
{  vgCalculoTabela.ResultadoEmol := ((vpValorDocumento-(vpValorInicio-0.01))/viEmolFracao) * viEmolAdExcedente;

  // Calculo Emolumentos Fase 2
  vgCalculoTabela.ResultadoEmol := vgCalculoTabela.ResultadoEmol + vpValorEmolumento;

  // Calculo Emolumentos Fase 3
  if vgCalculoTabela.ResultadoEmol > viEmolMaximoAd then
    vgCalculoTabela.ResultadoEmol := viEmolMaximoAd + dtmControles.sqlAuxiliar.Fields[0].AsCurrency;

  vgCalculoTabela.ResultadoFermoju := (((vgCalculoTabela.ResultadoEmol-vpValorEmolumento) * FermojuAdEmol)/100)+ FermojuTxAdicional;}
end;


end.
