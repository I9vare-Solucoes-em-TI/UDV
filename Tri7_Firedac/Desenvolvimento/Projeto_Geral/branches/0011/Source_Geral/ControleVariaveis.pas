unit ControleVariaveis;

interface

uses
  I9Query,
  FireDAC.Stan.Param,
  I9Query, Graphics, DB, Controls, FMTBcd, SqlExpr, Registry, Variants,
  Grids, DBGrids, ComCtrls, Classes, SysUtils, SimpleDS, StdCtrls,
  WPCTRRich, WPRTEDefs, Forms, ClipBrd,
  WPCTRMemo, WPRTEDefsConsts, Vcl.Dialogs;

type
  VetorAss = array[1..5] of string;

  RegDadosCabecalho = record
    Folha, Livro, Protocolo : String;
  end;

  TExecuteFunction = function:boolean of object;

  TConfigEditor = Record
    MargemDireita, MargemEsquerda, MargemInferior, MargemSuperior,
    MargemRodape, MargemCabecalho, PaginaAltura, PaginaLargura : Integer;
    PaginaEspelho, Orientacao, FonteTipo, AtivarZoom : string;
    MargemVerticalVerso, MargemVersoLivro, MargemVersoTraslado : Double;
    FonteTamanho, FonteTamAssinatura : single;
    CabecalhoDiferente, CabecalhoTipo, ZoomPadrao : integer;
    RodapeDiferente, RodapeTipo : integer;
  end;

  TQualificacao = Record
    ChaveId : integer;
    WptPrincipal, WptAuxiliar, WptTextoMarcacao, WptTeste, WptTextoLista : TWPRichText;
    StlPrincipal, StlComplemento, stlAuxiliar, StlCampos, StlLista, StlBookMark, StlErros : TStringList;
    ParametrosCondicao: TFDParams;
    stlMarcacaoFixaA : TStringList;
    VincQtdSexo   : array[1..8,1..2] of string;
    VincSeparador : array[1..3] of string;
    Qtd, Sexo, CaixaAlta, CaixaAltaBaixa, CaixaBaixa, Palavra, PessoaJuridicaId, AuxAtoOrdemQualifica : string;
    CondicaoSql, AuxAtoAposParte : string;
    IgnorarMascara, OutorganteRecOutorgado, UsarTabelaAuxiliar, QualificarGramatica,
    AtivarSeparador, AuxAtoAposOutorgado, PreencherDataVazia, ManterFonteMinuta, QrCode : Boolean;
    Tipo : Char;
    Stylo : WrtStyle;
    VincStylo : array[0..30] of WrtStyle;
    viStyliId : integer;
    stlListaSequencial : TStringList;
    Sequencial : integer;
    Fonte : TFontName;
    MarcacaoIdentificada : String;
    MarcacaoAutomatica : Boolean;
  end;

  TVetSequencial = array[1..5,1..2] of string;

var
  vgTipoMarcacao, vExtenso : string;
  vlDuplicarQtd : Integer;
  vgQualificar : TQualificacao;
  vgVetSequencial : TVetSequencial;
  vgQualificacaoOK : Boolean;
  vgQualificacaoErro, vgSqlCondicao : String;
  vgAtivarTravarTexto, vgExcluirMarcacao : Boolean;

  // Vari�veis para Controlar Editores
  vgConfigEditor : TConfigEditor;
  vgMarcacaoSelecionadaTexto : String;
  vgWptEditorMarcacao: TWPRichText; // Trabalhar com inser��o Marca��es]

  function  CarregarWptVirtual(wptParent, vpWptAux : TWPRichText) : TWPRichText;
  procedure DestruirWptVirtual(vpWptAux : string);
  procedure AtalhosStylo(vpWptAux : TWPRichText; var vpKey : Char);
  procedure DefinirPropriedades(vpWptAux, vpWptPrincipal : TWPRichText);

  // Procedimentos para trabalhar com Configuracao da Pagina e outras propriedades do Wptools
  procedure LerQualificacao(vpGrupo : string);
  procedure LerConfigTexto(vpGrupoCab, vpSessaoCab, vpGrupoFicha, vpSessao : string);
  procedure ConfigurarMargemTexto(var vpWptAux : TWPRichText; vpMargemVerticalVerso : Currency = 0; vpAdTopBotoom : integer = 0);
  procedure ConfigurarCabecalhoRodape(var vpWptAux : TWPRichText; vpGrupo, vpSessao, vpTipoCab1, vpTipoCab2,
                                          vpTipoRod1 : String; vpQualificar : Boolean = False; vpRemoverEspacoBranco : Boolean = False;
                                          vpTipoCab3 : String = ''; vpLimparCab : Boolean = False);

  procedure EscolherCabecalho(var vpWptAux: TWPRichText; vpTipoCabP, vpTipoCabPAux, vpTipoRodP, vpTipoCabPag1, vpTipoSec,
         vpTipoCabSecAux, vpTipoRodSec, vpTipoCabPag1Aux,  vpUsarCabSec: String;  vpTipoFinalizacao : Variant;
         vpMargemSecundariaTraslado, vpQualifica : Boolean);

  procedure RedefinirPadraoFonte(var vpTexto : TWPRichText; vpAssinatura : Boolean = False; vpAlterarTamanho : Boolean = True);

  // Procedimento para Marca��es do Wptools
  procedure Marcacao_Excluir(vpWptAux : TWPRichText; vpTipo : string);
  procedure Marcacao_Desfazer(vpWptAux : TWPRichText; vpTipo : string; vpSetarFocus : Boolean = True);
  procedure Marcacao_Adicionar(vpWptAux : TWPRichText; vpTipo : string; vpMarcacaoSimples : Boolean = False);
  Function  Marcacao_AvancarRetornar(vpWptAux : TWPRichText; vpDirecao : TExecuteFunction; vpUsaDialogoPontoInsercao: Boolean = False): string;
  Function  Marcacao_DefinirTipo(vpMarcacao : String; vpTodas : Boolean = True):String;
  Function  Marcacao_TipoDescricao(vpWptAux : TWPRichText):String;
  procedure Marcacao_ApagarMarcacaoVazia(vpWptAux : TWPRichText);
  procedure Marcacao_RetirarProtecao(vpWptAux : TWPRichText; vpTudo : Boolean = False; vpTravar : Boolean = True);
  procedure Marcacao_AjustarMarcacao(var vpWptAux : TWPRichText);
  procedure Marcacao_RetirarDicionarioGramatical(vpWptAux : TWPRichText);
  Function  Marcacao_Mostrardescricao(vpWptAux : TWPRichText):String;
  Function  TravarVariavelProtegida(var vpWptAux : TWPRichText):String;
  Function SubstituirVariavelManual(var vpWptAuxiliar, vpWptTexto: TWPRichText; vpVariavel : String;
           MudarEstilo : Boolean = true; vpRetirarMarcacao : Boolean = False): Boolean;
  Function VerificaExisteVariavelManual(var vpWptTexto : TWPRichText; vpVariavel : String):Boolean;

  // --- Modelo de Campos Fields ---
  procedure LiberarVariaveisManuais(var vpWptAux : TWPRichText; vpAtivarTravarTexto : String; vpAtivar : Boolean = False);
  procedure InserirFieldsEdicao(var vpWptAux : TWPRichText; vpTotal : Boolean);
  procedure SelecionarFieldManual(var vpWptAux : TWPRichText; vpField : String);

  { ----  Procedimentos de Qualifica��o do texto ----}
  {Dicion�rio Gramatical}
  procedure Qualificar_Gramatica(vpWptAux : TWPRichText; vpLocal : Boolean = False; vpSexo2Parte : String = '';
                  vpRetirarMarcacao : Boolean = False);
  Function  Qualificar_AplicarGramatica(vpMarcacao : string):string;
  procedure Qualificar_GetGramatica(vpWptAux : TWPRichText; vpRetirarMarcacao : Boolean = False);

  {Marca��o Autom�tica}
  procedure Qualificar_Iniciar(vpWptAux : TWPRichText; vpTipo : Char; vpRetirarProtecao : Boolean = True; vpTravarMarcacao : Boolean = False);
  Function  Qualificar_SelecionarMarcacao(vptipo : char; vpWptAux : TWPRichText):TStringList;
  procedure Qualificar_TipoConfig(vpTexto : String);
  procedure Qualificar_TipoListaTexto(vpMarcacaoPrincipal : string);
  Function  Qualificar_FormatarMascara(vpMarcacao, vpTipo, vpValor : string):String;
  procedure Qualificar_DefinirMascara(vpQtdMascara : integer; vpValor : string);
  procedure Qualificar_SubstituirMarcacao(vpMarcacao: string; vpTipo : char; vpWptAux : TWPRichText; vpMarcacaoSelecionar : string);
  Function  Qualificar_DefinirSeparador(vpQtdRestante : integer):string;

  {Auxiliares Marca��o}
  function BuscarTextoMarcacao(vpMarcacaoId, vpMarcacaoNova : string):TWPRichText;
  function BuscarTextoMarcacaoAux(vpTexto : TWPRichText; vpMarcacaoNova : string):TWPRichText;
  procedure PrepararQualificarPadrao(var vpWptAuxiliar : TWPRichText; vpMarcacaoNova : string;
                                         vpApagarMarcarcao, vpProtecao, vpSubstituirVazio: Boolean; vpUsarTabelaAuxiliar : Boolean = False;
                                         vpQualificarGramatica : Boolean = True; vpManterFonteMinuta : Boolean = False);
  procedure RetirarPontuacaoNaoUtilizada(var vpWptAux : TWPRichText);
  function AplicarEstiloCaixaAltaBaixa(vpValor : String):String;

  {** Somente Tabelionato **}
  Function Qualificar_QtdRegistroTab(vpTipoVinculo : Char; vpVinculoAuxiliarId : String):string;
  Function Qualificar_VerificarSexoTab(vpTipoVinculo: char; vpVinculoAuxiliarId : String; vpPessoaJuridica : Boolean = False):string;

  // Marca��es Fixas
  procedure Qualificar_FixoTabelionato(vpWptAux : TWPRichText; vpListaFixa : TStringList);
  Function  Qualificar_MarcacaoInicial(vpTipoVinculo : String):String;
  procedure Qualificar_Partes(vpTipoVinculo, vpTipoParte : String;  vpPessoaJuridica : string = ''; vpOrdem : integer = 0);
  procedure Qualificar_Imovel(vpOrdem : integer = 0);
  procedure Qualificar_Zerar_Linha(var vpWptAux : TWPRichText);

  procedure DestruirComponentes;
  {***** Final de Procedimentos de Qualificacao}

  procedure TravarClipboard;
  function TrocaCharPorAsci(Valor : String): String;
  procedure QualificarVariavelManual(var vpWptAux : TWPRichText);

implementation

{$WARN IMPLICIT_STRING_CAST OFF}
{$WARN IMPLICIT_STRING_CAST_LOSS OFF}

uses MarcacaoAutomatica, TipoVinculoGramatical, Controles,
  PalavraGramatical, Windows, Math, Rotinas, MaskUtils, Geral.Controller.PessoaExposta;

procedure TravarClipboard;
var
  viFlag : Boolean;
begin
  viFlag := False;
  Clipboard.Close;

  repeat
    try
      Clipboard.Open;
      Clipboard.Clear;
      viFlag := True;
    except
      Clipboard.Close;
    end;
  until viFlag;
end;

procedure QualificarVariavelManual(var vpWptAux : TWPRichText);
var
  viNovoValor : String;
  i : integer;
begin
  if vgAto.PesqTabela <> 'G_TEXTO_MODELO' then
    exit;

  // Captura as marca��es autom�ticas
  if vgQualificar.StlPrincipal <> nil then
    FreeAndNil(vgQualificar.StlPrincipal);

  vgQualificar.StlPrincipal := Qualificar_SelecionarMarcacao('m', vpWptAux);
  try
    for i := 0 to vgQualificar.StlPrincipal.Count-1 do
    begin
      vpWptAux.BookmarkMoveTo(vgQualificar.StlPrincipal[i], TRUE);
      vpWptAux.BookmarkSelect(vgQualificar.StlPrincipal[i], false);
      viNovoValor := '';
      if not InputQuery('Digite o Valor da Vari�vel', vgQualificar.StlPrincipal[i]+': ',viNovoValor) then
        abort;

      vpWptAux.SelectionAsString := viNovoValor;
    end;
    vpWptAux.HideSelection;
  finally
    FreeAndNil(vgQualificar.StlPrincipal);
  end;
end;

function TrocaCharPorAsci(Valor : String): String;
var
  I: Integer;
  viAtual, viNovo, viOld : String;
  viTrocar : Boolean;
begin

  viOld   := Valor;
  viAtual := '?';
  viNovo  := '�';
  viTrocar := pos('�', vgQualificar.Palavra) > 0;

  if viTrocar then
  begin
    viAtual:= '�';
    viNovo := '?';
  end;

  if Trim(Valor) <> '' then
  begin
    for I := 0 to length(Valor) do
    begin
      if Valor[I] = viAtual then
        Valor[I] := viNovo[1];
    end;
  end
  else
    Valor := '';

  if viTrocar then
  begin
    vgQualificar.Palavra := Valor;
    Result := viOld;
  end
  else Result := Valor;
end;

procedure Qualificar_Zerar_Linha(var vpWptAux : TWPRichText);
var
  viLine, viLimite : Integer;
  viFlag, viFim : Boolean;

  viCaracter1, viCaracter2 : String;
begin
  viCaracter1 := dtmControles.BuscarConfig('MARCACAO','GERAL','CARACTER1_COMPLEMENTO_LINHA','S');
  viCaracter2 := dtmControles.BuscarConfig('MARCACAO','GERAL','CARACTER2_COMPLEMENTO_LINHA','S');

  viLimite := 0;
  repeat
    viFim    :=  False;
    vpWptAux.Finder.ToStart;
    vpWptAux.CPPosition := $0;
    inc(viLimite);
    if vpWptAux.Finder.Next('#�m�') then
    begin
      vpWptAux.Finder.SelectText;
      vpWptAux.ClearSelection(True);
      vpWptAux.ReformatAll(true);
      vpWptAux.UndoClear;
      vpWptAux.CPPosition := vpWptAux.SelStart;

      viLine := vpWptAux.CPLineNr;
      viFlag := False;
      repeat
        vpWptAux.InputString(viCaracter1);
        vpWptAux.ReformatAll(true);
        if vpWptAux.CPLineNr = viLine then
        begin
          vpWptAux.UndoClear;
          vpWptAux.InputString(viCaracter2);
          vpWptAux.ReformatAll(true);

          if vpWptAux.CPLineNr <> viLine then
               viFlag := True
          else vpWptAux.UndoClear;
        end
        else viFlag := True;
      until (viFlag);
      vpWptAux.Undo;
      vpWptAux.ReformatAll(true);
    end
    else viFim := True;
  until (viFim) or (viLimite = 20);
end;

Function VerificaExisteVariavelManual(var vpWptTexto : TWPRichText; vpVariavel : String):Boolean;
begin
  vpWptTexto.Finder.ToStart;
  vpWptTexto.CPPosition := $0;
  if vpWptTexto.Finder.Next(vpVariavel) then
       Result := True
  else Result := False
end;

procedure SelecionarFieldManual(var vpWptAux : TWPRichText; vpField : String);
begin
  if vpWptAux.CurrentEditField=vpField then
    vpWptAux.MoveToNextField(false);

  if vpWptAux.MoveToField(vpField,false) then
    vpWptAux.SelectFieldAtCP(false, true)
  else
    if vpWptAux.MoveToField(vpField,true) then
       vpWptAux.SelectFieldAtCP(false, true);
end;

Function SubstituirVariavelManual(var vpWptAuxiliar, vpWptTexto: TWPRichText; vpVariavel : String;
           MudarEstilo : Boolean = true; vpRetirarMarcacao : Boolean = False): Boolean;
var
  viSize : Integer;
  Stylo : WrtStyle;
  viFonte : String;
begin
  vpWptTexto.Finder.ToStart;
  vpWptTexto.CPPosition := $0;
  if vpWptTexto.Finder.Next(vpVariavel) then
  begin
    vpWptTexto.Finder.SelectText;
    viSize  := vpWptTexto.CPAttr.Size;
    viFonte := vpWptTexto.CurrAttr.FontName;
    Marcacao_RetirarProtecao(vpWptTexto, False);

    if vpRetirarMarcacao then
    begin
      Stylo := vpWptTexto.CurrAttr.Style;
      Marcacao_Excluir(vpWptTexto, 'B');
      vpWptTexto.CurrAttr.Style := Stylo;
    end;

    vpWptAuxiliar.SelectAll;
    if vgQualificar.ManterFonteMinuta then
      vpWptAuxiliar.CurrAttr.FontName := viFonte;

    vpWptAuxiliar.CurrAttr.Size := viSize;
    if MudarEstilo then
      vpWptAuxiliar.CurrAttr.Style := vpWptTexto.CurrAttr.Style;
    vpWptAuxiliar.DeleteTrailingSpace(true);
    vpWptTexto.SelectionAsString := vpWptAuxiliar.AsString;
    Result := True;
  end
  else Result := False;
end;

procedure InserirFieldsEdicao(var vpWptAux : TWPRichText; vpTotal : Boolean);
var
  i : Integer;
begin
  if vpTotal then
  begin
    vpWptAux.CopyToClipboard(True);
    vpWptAux.Clear;
    vpWptAux.InputEditField('GERAL', '<GERAL>', True);
    vpWptAux.Finder.ToStart;
    vpWptAux.CPPosition := $0;
    vpWptAux.Finder.Next('<GERAL>');
    vpWptAux.Finder.SelectText;
    vpWptAux.PasteFromClipboard;
    SelecionarFieldManual(vpWptAux, 'GERAL');
    vpWptAux.CurrAttr.Alignment := paralBlock;
    vpWptAux.HideSelection;
  end
  else
  begin
    if vgQualificar.StlPrincipal <> nil then
      FreeAndNil(vgQualificar.StlPrincipal);

    vgQualificar.StlPrincipal := Qualificar_SelecionarMarcacao('m',vpWptAux);

    for i := 0 to vgQualificar.StlPrincipal.Count - 1 do
    begin
      vpWptAux.BookmarkMoveTo(vgQualificar.StlPrincipal[i], TRUE);
      vpWptAux.BookmarkSelect(vgQualificar.StlPrincipal[i], FALSE);
      vpWptAux.BookmarkDelete(vgQualificar.StlPrincipal[i], True, True);
      vpWptAux.InputEditField(vgQualificar.StlPrincipal[i], vgQualificar.StlPrincipal[i]);
      SelecionarFieldManual(vpWptAux, vgQualificar.StlPrincipal[i]);
      Marcacao_Adicionar(vpWptAux,'MANUAL');
    end;
  end;
end;

function AplicarEstiloCaixaAltaBaixa(vpValor : String):String;
begin
  if vgQualificar.CaixaAlta = '�' then
    Result := AnsiUpperCase(vpValor)
  else
    if vgQualificar.CaixaAltaBaixa = '�' then
      Result := MaiusculoMinusculo(vpValor)
  else
    if vgQualificar.CaixaBaixa = '�' then
      Result := AnsiLowerCase(vpValor)
  else Result := vpValor;
end;

procedure LiberarVariaveisManuais(var vpWptAux : TWPRichText; vpAtivarTravarTexto : String; vpAtivar : Boolean = False);
begin
  if vpAtivarTravarTexto <> '' then
       vgAtivarTravarTexto := vpAtivarTravarTexto = 'S'
  else vgAtivarTravarTexto := vpAtivar;

  if vgAtivarTravarTexto then
  begin
    vpWptAux.ProtectedProp := [ppParProtected,ppAllExceptForEditFields,ppProtected,ppProtectSelectedTextToo];
    vpWptAux.EditOptionsEx := [wpDisableEditOfNonBodyDataBlocks, wpTABMovesToNextEditField, wpRepaintOnFieldMove];
    // To highlight the current field
    vpWptAux.InsertPointAttr.CodeOpeningText := '[';
    vpWptAux.InsertPointAttr.CodeClosingText := ']';
    vpWptAux.InsertPointAttr.CodeTextColor := clYellow;
    vpWptAux.InsertPointAttr.BackgroundColor := clNavy;
  end
  else
  begin
    vpWptAux.EditOptionsEx := [wpDisableEditOfNonBodyDataBlocks];
    vpWptAux.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  end;
end;

Function CarregarWptVirtual(wptParent, vpWptAux : TWPRichText) : TWPRichText;
begin
  if wptParent <> nil then
  begin
    wptParent := nil;
    wptParent.Free;
  end;
  Result := TWPRichText.Create(nil);
  Result.Parent  := vpWptAux;
  Result.Visible := false;
  Result.Clear;
end;

procedure DestruirWptVirtual(vpWptAux : string);
begin
  if vpWptAux = 'vgWptEditorMarcacao' then
  begin
    vgWptEditorMarcacao.Free;
    vgWptEditorMarcacao := nil;
  end
  else
    if vpWptAux = 'vgWptAuxiliar' then
    begin
      vgQualificar.WptAuxiliar.Free;
      vgQualificar.WptAuxiliar := nil;
    end
  else
    if vpWptAux = 'vgWptTextoMarcacao' then
    begin
      vgQualificar.WptTextoMarcacao.Free;
      vgQualificar.WptTextoMarcacao := nil;
    end
  else
    if vpWptAux = 'vgWptPrincipal' then
    begin
      vgQualificar.WptPrincipal.Free;
      vgQualificar.WptPrincipal := nil;
    end;
end;

procedure DefinirPropriedades(vpWptAux, vpWptPrincipal : TWPRichText);
begin
  vpWptPrincipal.CurrAttr.FontName := vpWptAux.CurrAttr.FontName;
  vpWptPrincipal.CurrAttr.Color    := vpWptAux.CurrAttr.Color;
  vpWptPrincipal.CurrAttr.Style    := vpWptAux.CurrAttr.Style;
  vpWptPrincipal.CurrAttr.Size     := vpWptAux.CurrAttr.Size;
end;

Function Marcacao_DefinirTipo(vpMarcacao : String; vpTodas : Boolean = True):String;
var
  viConferencia, viResultado, viTipo : String;

begin
  { *** Tipos de marca��o
  �m�   --> Marca��o Manual (Somente no Display, internamente n�o possui)
  �a�   --> Marca��o Autom�tica
  �t�   --> Marca��o Tabela
  �l�   --> Marca��o de Lista
  �s�   --> Marca��o do Tipo Mascara
  �g�   --> Grupo de Mascara
  �r�   --> Marca��o de Somat�rio
  �p�   --> Marca��o de Duplica��o
  �q�   --> Marca��o de Valores Sequenciais
  �d?�  --> Marca��o Gramatical (? --> Pode ser 0,1,2,3 e 4, que s�o, Outorgante/Reciprocamente Outorgado, Outorgante, Outorgado, Imovel e Assinaturas respectivamente);
   �    --> For�a Caixa Alta
   �    --> For�a Mai�sculo/Min�sculo
   �    --> For�a Min�sculo
   �    --> Sem op��o de Conferencia }

  if vpMarcacao <> '' then
  begin
    vpMarcacao := ansistring(vpMarcacao);

    viTipo := copy(vpMarcacao,pos('�',vpMarcacao),150);
    if viTipo = vpMarcacao then
         vgQualificar.Tipo := 'm'
    else vgQualificar.Tipo := copy(vpMarcacao,pos('�',vpMarcacao)+1,1)[1];

    if vpTodas then
    begin
      vgQualificar.CaixaAlta      := copy(vpMarcacao,pos('�',vpMarcacao),1);
      viConferencia               := copy(vpMarcacao,pos('�',vpMarcacao),1);
      vgQualificar.CaixaAltaBaixa := copy(vpMarcacao,pos('�',vpMarcacao),1);
      vgQualificar.CaixaBaixa     := copy(vpMarcacao,pos('�',vpMarcacao),1);
      vgQualificar.MarcacaoAutomatica := False;
    end;

    // Define o Tipo
    case vgQualificar.Tipo of
     'm' : viResultado := 'Marca��o Manual';
     'a' : begin
             viResultado := 'Marca��o Autom�tica';
             vgQualificar.MarcacaoAutomatica := True;
           end;
     't' : viResultado := 'Marca��o Valor de Tabela';
     'l' : viResultado := 'Marca��o Valor de Lista Pr�-Definida';
     's' : viResultado := 'Marca��o do Tipo Mascara';
     'r' : viResultado := 'Marca��o Valor de Tabela com Somat�rio';
     'p' : viResultado := 'Marca��o Valor de Duplica��o';
     'q' : viResultado := 'Marca��o de Valor Sequencial';
     'g' : viResultado := 'Grupo de Mascaras';
     'd' : begin
             if viTipo[2] = 'd' then
             begin
               ExecutaSqlAuxiliar(' SELECT C.DESCRICAO FROM G_CONFIG C '+
                                  '  LEFT OUTER JOIN G_CONFIG_GRUPO G '+
                                  '   ON C.CONFIG_GRUPO_ID = G.CONFIG_GRUPO_ID '+
                                  ' WHERE C.SECAO = '+ QuotedStr('VINCULO_GRAMATICAL')+
                                  '   AND G.DESCRICAO = '+ QuotedStr('MARCACAO')+
                                  '   AND G.SISTEMA_ID = '+ IntToStr(vgId) +
                                  '   AND C.VALOR = '+QuotedStr(viTipo[3])+
                                  ' ORDER BY C.CONFIG_ID ',0);
               viResultado := 'Dic.Gramatical ('+AnsiUpperCase(dtmControles.sqlAuxiliar.FieldByname('DESCRICAO').AsString)+')';
               dtmControles.sqlAuxiliar.Close;
             end;
           end;
    end;

    vgQualificar.Palavra := copy(vpMarcacao,1,pos('�',vpMarcacao)-1);

    // Verifica Caixa Alta
    if vgQualificar.CaixaAlta = '�' then
    begin
      viResultado := viResultado + ' *Caixa Alta';
      delete(vgQualificar.Palavra, pos('�', vgQualificar.Palavra),1);
    end
    else
      if vgQualificar.CaixaAltaBaixa = '�' then
      begin
        viResultado := viResultado + ' *Caixa Alta&Baixa';
        delete(vgQualificar.Palavra, pos('�', vgQualificar.Palavra),1);
      end
    else
      if vgQualificar.CaixaBaixa = '�' then
      begin
        viResultado := viResultado + ' *Caixa Baixa';
        delete(vgQualificar.Palavra, pos('�', vgQualificar.Palavra),1);
      end;


    // Verifica Conferencia
    if viConferencia = '�' then
    begin
      viResultado := viResultado + ' *S/Conf.';
      delete(vgQualificar.Palavra, pos('�', vgQualificar.Palavra),1);
    end;

    Result := viResultado;
  end
  else viResultado := '';
end;

Function Marcacao_AvancarRetornar(vpWptAux : TWPRichText; vpDirecao : TExecuteFunction; vpUsaDialogoPontoInsercao: Boolean = False): string;
{$REGION 'Vari�veis'}
var
  viOk        : Boolean;
  viTempList  : TWPTextObjList;
  viValorAnt  : string;
  viObj       : TWPTextObj;
  viFlag      : Boolean;
  viLimitador : Integer;
{$ENDREGION}

  procedure ProcuraSubstitui(vpTextoProcurar, vpTextoSubstituir : String; vpExcluir : Boolean);
  begin
    viFlag := False;
    repeat
      vpWptAux.Finder.ToStart;
      vpWptAux.Finder.FoundPosition := 0;
      if vpWptAux.Finder.Next(vpTextoProcurar) then
      begin
        if vpExcluir then
        begin
          vpWptAux.Finder.SelectText;
          vpWptAux.ClearSelection(True);
        end
        else
        begin
          vpWptAux.Finder.SelectText;
          vpWptAux.ClearSelection(True);
          vpWptAux.SelectionAsString := vpTextoSubstituir;
        end;
      end
      else viFlag := True;
    until viFlag;
  end;

  function CapturaNovoValor(vpValorAntigo: string): string;
  {$REGION 'Vari�veis'}
  var
    viNovoValor: string;
  {$ENDREGION}
  begin
    viNovoValor := '';

    InputQuery('Ponto de Inser��o', 'Novo Valor: ', viNovoValor);

    if viNovoValor.IsEmpty then
      Result := AnsiLowerCase(vpValorAntigo)
    else
      Result := viNovoValor;
  end;

begin
  vpWptAux.HideSelection;
  viOk   := False;
  viFlag := True;

  // Avan�a para a pr�xima marca��o
  vpDirecao;
  viTempList := TWPTextObjList.Create;

  try

    viLimitador := 0;
    repeat
      viTempList.Clear;
      vpWptAux.OpenCodesAtCP(viTempList,wpobjBookmark);
      vpDirecao;
      inc(viLimitador);
      if viLimitador > 1000 then
        break;
    until (vpWptAux.CPPosition <= 2) or (viTempList.Count = 0);

    repeat
      viTempList.Clear;
      vpWptAux.OpenCodesAtCP(viTempList,wpobjBookmark);
      viObj := vpWptAux.BookmarkAtCP;
      try
        While (viTempList.Count > 0) and (Pos('�', viObj.Name) = 0) do
        begin
          // ** Altera o Valor da Marca��o para poder seleciona-la
          viValorAnt := viTempList[0].Name;

          viObj := vpWptAux.BookmarkAtCP;
          viObj.Name := 'SELECIONAR%';
          viOk := true;
          Break;
        end;
      except

      end;

      if viOk then
      begin
        vpWptAux.CPPosition := vpWptAux.CPPosition - 1;
        vpWptAux.BookmarkSelect('SELECIONAR%',True);

        // ** Retorna o Valor da Marca��o original, depois de seleciona-la.
        if (vpUsaDialogoPontoInsercao) and (Pos('�m�', viValorAnt) > 0) then
          ProcuraSubstitui(viValorAnt, CapturaNovoValor(viValorAnt), False)
        else
          viObj.Name := viValorAnt;

        vpWptAux.SetFocus;
        vgTipoMarcacao := 'B';
        viFlag := False;
        vgMarcacaoSelecionadaTexto := viObj.Name;
      end
      else vpDirecao;
    until (viOk or (not(vpDirecao)));
  finally
    FreeAndNil(viTempList);
  end;

  if viFlag then
  begin
    vgMarcacaoSelecionadaTexto := '';
    Application.MessageBox('Final de Marca��o!!!', 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
  end;

  vpWptAux.CurrAttr.DeleteStyle([afsProtected]);
  Result := Marcacao_DefinirTipo(viValorAnt);
end;

procedure Marcacao_Desfazer(vpWptAux : TWPRichText; vpTipo : string; vpSetarFocus : Boolean = True);
var
  viObj: TWPTextObj;
begin
  vpWptAux.EditOptions   := [wpTableResizing,wpTableColumnResizing,wpObjectMoving,wpObjectResizingWidth,wpObjectResizingHeight,wpObjectResizingKeepRatio,wpObjectSelecting,wpObjectDeletion,wpSpreadsheetCursorMovement, wpActivateUndoHotkey,wpMoveCPOnPageUpDown];
  vpWptAux.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  if vpTipo = 'B' then
       viObj := vpWptAux.BookmarkAtCP
  else viObj := vpWptAux.HyperlinkAtCP;

  try
    if Pos('�', viObj.Name) > 0 then
    begin
      Application.MessageBox('Op��o n�o dispon�vel para est� marca��o!!!', 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
      exit;
    end;

    if vpTipo = 'B' then
    begin
      viObj.Name := 'EXCLUIR%';
      vpWptAux.BookmarkSelect('EXCLUIR%', FALSE);
    end
    else
    begin
      viObj.Source := 'EXCLUIR%';
      vpWptAux.HyperlinkSelect('EXCLUIR%', FALSE);
    end;

    vpWptAux.CurrAttr.DeleteStyle([ afsProtected ]);
    // Retira as marca��es externas, deixando somente o texto original.
    if Pos('�',vpWptAux.SelText) > 0 then
         vpWptAux.SelectionAsString := copy(vpWptAux.SelText, 1, Pos('�',vpWptAux.SelText)-1)
    else vpWptAux.SelectionAsString := vpWptAux.SelText;

    if vpTipo = 'B' then
         vpWptAux.BookmarkDeleteMarkers('EXCLUIR%')
    else vpWptAux.DeleteHyperlink(False);

    if vpSetarFocus then
      vpWptAux.SetFocus;
    vpWptAux.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
    vpWptAux.EditOptions   := [wpTableResizing,wpTableColumnResizing,wpObjectMoving,wpObjectResizingWidth,wpObjectResizingHeight,wpObjectResizingKeepRatio,wpObjectSelecting,wpObjectDeletion,wpSpreadsheetCursorMovement,wpActivateUndo,wpActivateUndoHotkey,wpMoveCPOnPageUpDown];
  except
    vpWptAux.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
    vpWptAux.EditOptions   := [wpTableResizing,wpTableColumnResizing,wpObjectMoving,wpObjectResizingWidth,wpObjectResizingHeight,wpObjectResizingKeepRatio,wpObjectSelecting,wpObjectDeletion,wpSpreadsheetCursorMovement,wpActivateUndo,wpActivateUndoHotkey,wpMoveCPOnPageUpDown];
    Application.MessageBox('Marca��o Inv�lida!!! Selecione apenas uma Marca��o.', 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
  end;
end;

procedure Marcacao_Excluir(vpWptAux : TWPRichText; vpTipo : string);
var
  viObj: TWPTextObj;

  procedure ExcluirMarcacaoDiversas;
  begin
    vpWptAux.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
    vpWptAux.CurrAttr.DeleteStyle([ afsProtected ]);
    vpWptAux.ClearSelection;
    vpWptAux.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  end;

begin
  viObj := nil;

  vpWptAux.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  vpWptAux.EditOptions   := [wpTableResizing,wpTableColumnResizing,wpObjectMoving,wpObjectResizingWidth,wpObjectResizingHeight,wpObjectResizingKeepRatio,wpObjectSelecting,wpObjectDeletion,wpSpreadsheetCursorMovement, wpActivateUndoHotkey,wpMoveCPOnPageUpDown];
  vpWptAux.CurrAttr.DeleteStyle([ afsProtected ]);

  if vpTipo <> '' then
    if vpTipo = 'B' then
         viObj := vpWptAux.BookmarkAtCP
    else viObj := vpWptAux.HyperlinkAtCP;

  try
    // Somente para uma marca��o
    if vpTipo = 'B' then
    begin
      viObj.Name := 'EXCLUIR%';
      vpWptAux.BookmarkSelect('EXCLUIR%', FALSE);
      vpWptAux.ClearSelection;
      vpWptAux.BookmarkDeleteMarkers('EXCLUIR%');
    end
    else
      if vpTipo = 'H' then
      begin
        viObj.Source := 'EXCLUIR%';
        vpWptAux.HyperlinkSelect('EXCLUIR%', FALSE);
        vpWptAux.DeleteHyperlink(True);
        vpWptAux.CurrAttr.DeleteStyle([afsProtected]);
        vpWptAux.ClearSelection;
      end
      else ExcluirMarcacaoDiversas;

//    if vpWptAux.Visible then
//      vpWptAux.SetFocus;
    vpWptAux.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
    vpWptAux.EditOptions   := [wpTableResizing,wpTableColumnResizing,wpObjectMoving,wpObjectResizingWidth,wpObjectResizingHeight,wpObjectResizingKeepRatio,wpObjectSelecting,wpObjectDeletion,wpSpreadsheetCursorMovement,wpActivateUndo,wpActivateUndoHotkey,wpMoveCPOnPageUpDown];
  except
    ExcluirMarcacaoDiversas;
  end;
end;

procedure Marcacao_Adicionar(vpWptAux : TWPRichText; vpTipo : string; vpMarcacaoSimples : Boolean = False);
var
  viMarcacao : string;

  procedure EscolherVinculo;
  begin
    Application.CreateForm(TfrmTipoVinculoGramatical, frmTipoVinculoGramatical);
    frmTipoVinculoGramatical.ShowModal;
    if frmTipoVinculoGramatical.ModalResult <> mrOK then
    begin
      frmTipoVinculoGramatical := nil;
      frmPalavraGramatical     := nil;
      vpWptAux.HideSelection;
      vpWptAux.SetFocus;
      Abort;
    end;
    with frmTipoVinculoGramatical do
      case vgTipoGramatical of
        0 : viMarcacao := viMarcacao + '�d1�';
        1 : viMarcacao := viMarcacao + '�d2�';
        2 : viMarcacao := viMarcacao + '�d3�';
        3 : viMarcacao := viMarcacao + '�d4�';
      end;
    frmTipoVinculoGramatical := nil;
  end;

  procedure PrepararMarcacaoAutomatica;
  begin
    Application.CreateForm(TfrmMarcacaoAutomatica, frmMarcacaoAutomatica);
    frmMarcacaoAutomatica.vgTipoMarcacao := 'GLOBAL';
    frmMarcacaoAutomatica.ShowModal;
    vgWptEditorMarcacao.InputString(PChar(viMarcacao));

    if frmMarcacaoAutomatica.ModalResult <> mrOK then
    begin
      frmMarcacaoAutomatica := nil;
      vpWptAux.HideSelection;
      vpWptAux.SetFocus;
      DestruirWptVirtual('vgWptEditorMarcacao');
      Abort;
    end
    else
    begin
      frmMarcacaoAutomatica.vgMarcacaoDisplay := frmMarcacaoAutomatica.vgMarcacaoDisplay+'�a�';
      vgWptEditorMarcacao.InputString(PChar(frmMarcacaoAutomatica.vgMarcacaoDisplay));
      vgWptEditorMarcacao.DeleteTrailingSpace(True);
      vgWptEditorMarcacao.DeleteLeadingSpace(True);
      vgWptEditorMarcacao.SelectAll;
      RedefinirPadraoFonte(vgWptEditorMarcacao, False, True);
      vgWptEditorMarcacao.BookmarkInput(frmMarcacaoAutomatica.vgMarcacaoInterna+'�a�');
      vgWptEditorMarcacao.HideSelection;
      vgWptEditorMarcacao.InputString(' ');
      frmMarcacaoAutomatica.Free;
      frmMarcacaoAutomatica := nil;
    end;
  end;

  procedure PrepararPalavraGramatical;
  begin
    if not vpMarcacaoSimples then
    begin
      // Procura a existencia da Palavra
      viMarcacao := vpWptAux.SelText;
      ExecutaSqlAuxiliar(' SELECT PALAVRA '+
                         ' FROM G_GRAMATICA '+
                         ' WHERE PALAVRA = '+ QuotedStr(AnsiUpperCase(viMarcacao)),0);

      if not dtmControles.sqlAuxiliar.IsEmpty then
        EscolherVinculo
      else
      begin
        // Cadastrar a Palavra
        Application.CreateForm(TfrmPalavraGramatical, frmPalavraGramatical);
        frmPalavraGramatical.sqlGramaticaPALAVRA.AsString := viMarcacao;
        frmPalavraGramatical.ShowModal;

        if frmPalavraGramatical.ModalResult = mrOK then
          EscolherVinculo
        else
        begin
          dtmControles.sqlAuxiliar.Close;
          frmPalavraGramatical := nil;
          vpWptAux.HideSelection;
          DestruirWptVirtual('vgWptEditorMarcacao');
          vpWptAux.SetFocus;
          Abort;
        end;
      end;
      frmPalavraGramatical := nil;
      DefinirPropriedades(vpWptAux, vgWptEditorMarcacao);
      dtmControles.sqlAuxiliar.Close;
    end;

    vgWptEditorMarcacao.InputHyperlink(viMarcacao,viMarcacao);
    vgWptEditorMarcacao.SelectAll;
  end;

begin
  viMarcacao := vpWptAux.SelText;

  // Verifica se tem algum texto selelcionado ou focado.
  if viMarcacao = '' then
  begin
    if vpTipo <> 'AUTOMATICA' then
      vpWptAux.SelectWord;

    viMarcacao := vpWptAux.SelText;
    if (viMarcacao = '') and (vpTipo <> 'AUTOMATICA') then
      exit
    else
      if (viMarcacao <> '') and (vpTipo = 'AUTOMATICA') then
      begin
        vpWptAux.HideSelection;
        Application.MessageBox('Esta marca��o deve ser inserida entre espa�os vazios!!!', 'Aviso', MB_OK + MB_DEFBUTTON1 + MB_ICONINFORMATION);
        vpWptAux.SetFocus;
        Abort;
      end;
  end;

  // Cria Wptools Auxiliar na Memoria
  vgWptEditorMarcacao := CarregarWptVirtual(vgWptEditorMarcacao, vpWptAux);

  if vpTipo = 'MANUAL' then
  begin
    viMarcacao := viMarcacao+'�m�';
    DefinirPropriedades(vpWptAux, vgWptEditorMarcacao);
    vgWptEditorMarcacao.InputString(PChar(viMarcacao));
    vgWptEditorMarcacao.SelectAll;
    vgWptEditorMarcacao.BookmarkInput(vpWptAux.SelText);
  end
  else
    if vpTipo = 'AUTOMATICA' then
      PrepararMarcacaoAutomatica
  else
    if vpTipo = 'GRAMATICAL' then
      PrepararPalavraGramatical
  else exit;

  // Insere a prote��o
  vgWptEditorMarcacao.CurrAttr.AddStyle ([afsProtected]);
  vgWptEditorMarcacao.HideSelection;

  // Grava a Marca��o pronta no Texto
  vgWptEditorMarcacao.SelectAll;

//*  TravarClipboard;
//*  vgWptEditorMarcacao.CopyToClipboard;
//*  Clipboard.Close;
  vpWptAux.SelectionAsString := vgWptEditorMarcacao.AsString;
  vpWptAux.SetFocus;

  // Destroi o Wptools Auxiliar da Memoria
  DestruirWptVirtual('vgWptEditorMarcacao');
//  Clipboard.Clear;
end;

Function Marcacao_TipoDescricao(vpWptAux : TWPRichText):String;
var
  TempList : TWPTextObjList;
  i        : Integer;
  viMarcaocaInterna : string;
begin
  vgTipoMarcacao := '';
  TempList := TWPTextObjList.Create;

  try
    // Pega o tipo de marca��o de Bookmark
    vpWptAux.OpenCodesAtCP(TempList,wpobjBookmark); // was: wpcoBookMark

    for i:=TempList.Count-1 downto 0 do
    begin
      if viMarcaocaInterna <> '' then
        viMarcaocaInterna := viMarcaocaInterna + ' - ';
      viMarcaocaInterna   := TempList[i].Name;
      vgTipoMarcacao      := 'B';
      break;
    end;

    if vgTipoMarcacao = '' then
    begin
      // Pega o tipo da marca��o de Hyperlink
      TempList.Clear;
      vpWptAux.OpenCodesAtCP(TempList,wpobjHyperlink);
      for i:=TempList.Count-1 downto 0 do
      begin
        if viMarcaocaInterna <> '' then
          viMarcaocaInterna := viMarcaocaInterna + ' - ';
        viMarcaocaInterna := viMarcaocaInterna + TempList[i].Source;
        vgTipoMarcacao    := 'H';
      end;
    end;
  finally
    FreeAndNil(TempList);
  end;

  vgQualificar.MarcacaoIdentificada := viMarcaocaInterna;
  Result := Marcacao_DefinirTipo(viMarcaocaInterna);
end;

procedure Marcacao_ApagarMarcacaoVazia(vpWptAux : TWPRichText);
var
  i : integer;
begin
  // Captura as marca��es autom�ticas
  if vgQualificar.StlPrincipal <> nil then
    FreeAndNil(vgQualificar.StlPrincipal);

  vgQualificar.StlPrincipal := Qualificar_SelecionarMarcacao('a', vpWptAux);

  try
    for i := 0 to vgQualificar.StlPrincipal.Count-1 do
    begin
      vpWptAux.BookmarkMoveTo(vgQualificar.StlPrincipal[i], TRUE);
      vpWptAux.BookmarkSelect(vgQualificar.StlPrincipal[i], false);

      // Verifica se esta vazia
      if vpWptAux.SelText = #2#3 then
        vpWptAux.clearSelection(true);
    end;
    vpWptAux.HideSelection;
  finally
    FreeAndNil(vgQualificar.StlPrincipal);
  end;

end;

procedure AtalhosStylo(vpWptAux : TWPRichText; var vpKey : Char);
var
  r : Char;
begin
  if not vgAtivarTravarTexto then
    vpWptAux.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];

  with vpWptAux, CurrAttr do
  begin
   r := #0;
   case vpKey of
       #9: if afsItalic in Style then DeleteStyle([afsItalic])
    	   else AddStyle([afsItalic]);
       #14: if afsBold in Style then DeleteStyle([afsBold])
    	   else AddStyle([afsBold]);
       #19: if afsUnderline in Style then DeleteStyle([afsUnderline])
	       else AddStyle([afsUnderline])
    { ... }
      else r := vpKey;
    end;
    vpkey	:= r;
  end;

  if not vgAtivarTravarTexto then
    vpWptAux.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
end;

procedure LerQualificacao(vpGrupo : string);
begin
  vgQualificar.AuxAtoAposParte     := dtmControles.BuscarConfig(vpGrupo,'QUALIFICACAO','AUXILIAR_ATO_APOS_PARTE','S');
  vgQualificar.AuxAtoAposOutorgado := dtmControles.BuscarConfig(vpGrupo,'QUALIFICACAO','AUXILIAR_ATO_APOS_OUTORGADO','S') = 'S';
end;

procedure LerConfigTexto(vpGrupoCab, vpSessaoCab, vpGrupoFicha, vpSessao : string);
begin
    // Margens
    vgConfigEditor.MargemDireita        := dtmControles.BuscarConfig(vpGrupoFicha, vpSessao, 'MARGEM_DIREITA','I');
    vgConfigEditor.MargemEsquerda       := dtmControles.BuscarConfig(vpGrupoFicha, vpSessao, 'MARGEM_ESQUERDA','I');
    vgConfigEditor.MargemInferior       := dtmControles.BuscarConfig(vpGrupoFicha, vpSessao, 'MARGEM_INFERIOR','I');
    vgConfigEditor.MargemSuperior       := dtmControles.BuscarConfig(vpGrupoFicha, vpSessao, 'MARGEM_SUPERIOR','I');
    vgConfigEditor.MargemRodape         := dtmControles.BuscarConfig(vpGrupoFicha, vpSessao, 'MARGEM_RODAPE','I');
    vgConfigEditor.MargemCabecalho      := dtmControles.BuscarConfig(vpGrupoFicha, vpSessao, 'MARGEM_CABECALHO','I');
    vgConfigEditor.PaginaAltura         := dtmControles.BuscarConfig(vpGrupoFicha, vpSessao, 'PAGINA_ALTURA','I');
    vgConfigEditor.PaginaLargura        := dtmControles.BuscarConfig(vpGrupoFicha, vpSessao, 'PAGINA_LARGURA','I');
    vgConfigEditor.MargemVerticalVerso  := dtmControles.BuscarConfig(vpGrupoFicha, vpSessao, 'MARGEM_VERTICAL_VERSO','D');

    // Propriedades da P�gina
    vgConfigEditor.PaginaEspelho    := dtmControles.BuscarConfig(vpGrupoFicha, vpSessao, 'PAGINA_ESPELHO','S');
    vgConfigEditor.Orientacao       := dtmControles.BuscarConfig(vpGrupoFicha, vpSessao, 'ORIENTACAO','S');

    // Propriedades do Cabecalhoe Rodape (Pega o Tipo do Grupo, pois pode ser de grupos diferentes)
    vgConfigEditor.CabecalhoDiferente := dtmControles.BuscarConfig(vpGrupoCab, vpSessaoCab, 'CABECALHO_DIFERENTE','I');
    vgConfigEditor.CabecalhoTipo      := dtmControles.BuscarConfig(vpGrupoCab, vpSessaoCab, 'CABECALHO_TIPO','I');
    vgConfigEditor.RodapeDiferente    := dtmControles.BuscarConfig(vpGrupoCab, vpSessaoCab, 'RODAPE_DIFERENTE','I');
    vgConfigEditor.RodapeTipo         := dtmControles.BuscarConfig(vpGrupoCab, vpSessaoCab, 'RODAPE_TIPO','I');

  vgConfigEditor.FonteTipo        := dtmControles.BuscarConfig('EDITOR','PROPRIEDADE','FONTE_TIPO','S');
  vgConfigEditor.FonteTamanho     := dtmControles.BuscarConfig('EDITOR','PROPRIEDADE','FONTE_TAMANHO','I');
  vgConfigEditor.ZoomPadrao       := dtmControles.BuscarConfig('EDITOR','PROPRIEDADE','ZOOM_PADRAO','I');
  vgConfigEditor.AtivarZoom       := dtmControles.BuscarConfig('EDITOR','PROPRIEDADE','ATIVAR_ZOOM','S');


  if vgId = 2 then
    vgConfigEditor.FonteTamAssinatura := dtmControles.BuscarConfig('ATO','GERAL','TAMANHO_FONTE_ASSINATURA','I');

end;

procedure ConfigurarMargemTexto(var vpWptAux : TWPRichText; vpMargemVerticalVerso : Currency = 0; vpAdTopBotoom : integer = 0);
begin
  vpWptAux.Header.PageHeight    := vgConfigEditor.PaginaAltura;
  vpWptAux.Header.PageWidth     := vgConfigEditor.PaginaLargura;
  vpWptAux.Header.LeftMargin    := vgConfigEditor.MargemEsquerda + round(vpMargemVerticalVerso * 56.70);
  vpWptAux.Header.RightMargin   := vgConfigEditor.MargemDireita - round(vpMargemVerticalVerso * 56.70);
  vpWptAux.Header.BottomMargin  := vgConfigEditor.MargemInferior + vpAdTopBotoom;
  vpWptAux.Header.TopMargin     := vgConfigEditor.MargemSuperior + vpAdTopBotoom;
  vpWptAux.Header.MarginHeader  := vgConfigEditor.MargemCabecalho;
  vpWptAux.Header.MarginFooter  := vgConfigEditor.MargemRodape;
end;

procedure ConfigurarCabecalhoRodape(var vpWptAux : TWPRichText; vpGrupo, vpSessao, vpTipoCab1, vpTipoCab2,
                                        vpTipoRod1 : String; vpQualificar : Boolean = False; vpRemoverEspacoBranco : Boolean = False;
                                        vpTipoCab3 : String = ''; vpLimparCab : Boolean = False);
var
  viPaginaTipo, viPaginaDiferente, i, pos : integer;
  viCabRod : array[1..3] of string;
  viWptTexto : TWPRichText;

  procedure DefinirCabecalho(vpPagina: TWPPagePropertyRange; vpNulo : Boolean; vpCab : string);
  begin
    viWptTexto         := TWPRichText.Create(nil);
    viWptTexto.Visible := false;
    try
      if i = 1 then
      begin
        if (vpNulo) or (vpCab = '0') then
          vpWptAux.HeaderFooter.Get(wpIsHeader, vpPagina,'').RTFText.AsString := ''
        else
        begin
          viWptTexto.AsString := dtmControles.BuscarConfig(vpGrupo, vpSessao, 'CABECALHO_MODELO'+vpCab,'T');

          if vpRemoverEspacoBranco then
            viWptTexto.DeleteTrailingSpace(True);

          if vpQualificar then
            PrepararQualificarPadrao(viWptTexto, '', True, False, True);

          if vpLimparCab then
          begin
            viWptTexto.ReformatAll(true);
            viWptTexto.CPPosition := $FFFF;
            pos := viWptTexto.CPYPos;
            viWptTexto.Clear;
            viWptTexto.CPPosition := $0;
            repeat
              viWptTexto.InputString(#13);
              viWptTexto.ReformatAll(true);
            until viWptTexto.CPYPos >= pos;
          end;
          vpWptAux.HeaderFooter.Get(wpIsHeader, vpPagina,'').RTFText.AsString := viWptTexto.AsString;
        end;
      end
      else
      begin
        if (vpNulo) or (vpCab = '0') then
          vpWptAux.HeaderFooter.Get(wpIsFooter, vpPagina,'').RTFText.AsString := ''
        else
        begin
          viWptTexto.AsString := dtmControles.BuscarConfig(vpGrupo, vpSessao, 'RODAPE_MODELO'+vpCab,'T');
          if vpQualificar then
            PrepararQualificarPadrao(viWptTexto, '', True, False, True);
          vpWptAux.HeaderFooter.Get(wpIsFooter, vpPagina,'').RTFText.AsString := viWptTexto.AsString;
        end;
      end;
    finally
      FreeAndNil(viWptTexto);
    end;
  end;

  procedure ConfigurarTodasPaginas;
  begin

    if (viCabRod[3] = '') then
      DefinirCabecalho(wpraOnFirstPage, False, viCabRod[1])
    else
    begin
      if (i = 1) then
           DefinirCabecalho(wpraOnFirstPage, False, viCabRod[3])
      else DefinirCabecalho(wpraOnFirstPage, False, viCabRod[1]);
    end;

    if viPaginaDiferente in [1,2] then  // Cabecalho/Rodape Principal (Primeira Pagina sempre � Principal)
         DefinirCabecalho(wpraOnEvenPages, False, viCabRod[2])
    else DefinirCabecalho(wpraOnEvenPages, False, viCabRod[1]);

    case viPaginaDiferente of
      0 : DefinirCabecalho(wpraOnOddPages, False, viCabRod[1]); // Igual para todas as p�ginas
      1 : DefinirCabecalho(wpraOnOddPages, False, viCabRod[2]); // Segunda em Diante (Impares � Cab. Auxiliar)
      2 : DefinirCabecalho(wpraOnOddPages, False, viCabRod[1]); // Verso (Impares � Principal)
    end
  end;
begin

  viPaginaTipo      := vgConfigEditor.CabecalhoTipo;
  viPaginaDiferente := vgConfigEditor.CabecalhoDiferente;
  viCabRod[1]       := vpTipoCab1;
  viCabRod[2]       := vpTipoCab2;
  viCabRod[3]       := vpTipoCab3;
  for i := 1 to 2 do
  begin
    case viPaginaTipo of
     1 : ConfigurarTodasPaginas;
     2 : begin // Paginas Pares
           DefinirCabecalho(wpraOnFirstPage, True, '');
           DefinirCabecalho(wpraOnEvenPages, False, viCabRod[1]);
           DefinirCabecalho(wpraOnOddPages, True, '');
         end;
     3 : begin // Paginas Impares
           DefinirCabecalho(wpraOnFirstPage, False, viCabRod[1]);
           DefinirCabecalho(wpraOnOddPages, False, viCabRod[1]);
           DefinirCabecalho(wpraOnEvenPages, True, '');
         end;
     4 : begin // Primeira Pagina
           DefinirCabecalho(wpraOnFirstPage, False, viCabRod[1]);
           DefinirCabecalho(wpraOnOddPages,  True, '');
           DefinirCabecalho(wpraOnEvenPages, True, '');
         end;
    end;
    viPaginaTipo      := vgConfigEditor.RodapeTipo;
    viPaginaDiferente := vgConfigEditor.RodapeDiferente;
    viCabRod[1]       := vpTipoRod1;
    if viCabRod[1] = '0' then
         viCabRod[2] := '0'
    else viCabRod[2] := '2';
  end;
end;

procedure EscolherCabecalho(var vpWptAux: TWPRichText; vpTipoCabP, vpTipoCabPAux, vpTipoRodP, vpTipoCabPag1, vpTipoSec,
         vpTipoCabSecAux, vpTipoRodSec, vpTipoCabPag1Aux,  vpUsarCabSec: String;  vpTipoFinalizacao : Variant;
         vpMargemSecundariaTraslado, vpQualifica : Boolean);

  procedure PegarCabecalho(vpTipo: String);
  begin
    if vpTipo = 'L' then
      ConfigurarCabecalhoRodape(vpWptAux, 'EDITOR', 'CABECALHO',
        vpTipoCabP, vpTipoCabPAux,
        vpTipoRodP, vpQualifica, False,
        vpTipoCabPag1)
    else
      ConfigurarCabecalhoRodape(vpWptAux, 'EDITOR', 'CABECALHO',
        vpTipoSec,
        vpTipoCabSecAux,
        vpTipoRodSec, vpQualifica, False,
        vpTipoCabPag1Aux);
  end;

begin
  if (vpUsarCabSec <> '') and (CharInSet(vpUsarCabSec[1],['1', '2'])) then
  begin
    if vpUsarCabSec = '1' then
         LerConfigTexto('ATO', 'IMPRESSAO', 'EDITOR', 'MARGEM') // Livro e Traslado - Cabe�alho Diferente e Margem Principal
    else LerConfigTexto('ATO', 'IMPRESSAO', 'EDITOR', 'MARGEM_SECUNDARIA'); // Livro e Traslado - Cabe�alho Diferente e Margem Secund�ria

    ConfigurarMargemTexto(vpWptAux);
    if vpTipoFinalizacao = null then
         PegarCabecalho('F')
    else PegarCabecalho(vpTipoFinalizacao);
  end
  else
  begin
    if (not vpMargemSecundariaTraslado) or
      (vpMargemSecundariaTraslado and (vpTipoFinalizacao = 'L')) then
    begin
      // Op��o de Cabe�alhos para "livro e traslado principais" ou somente para "livro secund�rio"
      LerConfigTexto(  'ATO', 'IMPRESSAO', 'EDITOR', 'MARGEM');
      ConfigurarMargemTexto(vpWptAux);

      ConfigurarCabecalhoRodape(vpWptAux, 'EDITOR', 'CABECALHO', vpTipoCabP, vpTipoCabPAux,
                                vpTipoRodP, vpQualifica, False, vpTipoCabPag1)
    end
    else
    begin
      // Op��o "traslado secund�rio"
      LerConfigTexto('ATO', 'IMPRESSAO', 'EDITOR', 'MARGEM_SECUNDARIA');
      ConfigurarMargemTexto(vpWptAux);

      ConfigurarCabecalhoRodape(vpWptAux, 'EDITOR', 'CABECALHO', vpTipoSec, vpTipoCabSecAux,
                               vpTipoRodSec, vpQualifica, False, vpTipoCabPag1Aux)
    end;
  end;
end;

procedure Qualificar_Iniciar(vpWptAux : TWPRichText; vpTipo : Char; vpRetirarProtecao : Boolean = True; vpTravarMarcacao : Boolean = False);
var
  i : integer;
  viTipoValor : char;

  procedure VerificarTrocarParte;
  var
    viPESSOA_CONJUGE_ID: string;
    viSQL_SELECT: string;
    viPESSOA_ID: Currency;
  begin
    if vgId = 2 then // Tabelionato de Notas
    begin
      if vgQualificar.StlCampos.Values['PESSOA_CONJUGE_ID'] <> '' then
      begin
        // Procura Dados da Outra Parte (Conjuge)
        ExecutaSqlAuxiliar(' SELECT SEXO, P.PESSOA_ID, TB_DOCUMENTOTIPO_ID, TB_ESTADOCIVIL_ID, '+
                           '        TB_PROFISSAO_ID, TB_REGIMECOMUNHAO_ID, PESSOA_CONJUGE_ID, SEG_DOCUMENTOTIPO_ID  '+
                           ' FROM T_PESSOA P'+
                           ' WHERE PESSOA_ID ='+ vgQualificar.StlCampos.Values['PESSOA_CONJUGE_ID'],0);
        // Armazena os Dados
        if not dtmControles.sqlAuxiliar.IsEmpty then
        begin
          vgQualificar.StlCampos.Values['PESSOA_ID']            := dtmControles.sqlAuxiliar.FieldByName('PESSOA_ID').AsString;
          vgQualificar.StlCampos.Values['PESSOA_CONJUGE_ID']    := dtmControles.sqlAuxiliar.FieldByName('PESSOA_CONJUGE_ID').AsString;
          vgQualificar.StlCampos.Values['TB_DOCUMENTOTIPO_ID']  := dtmControles.sqlAuxiliar.FieldByName('TB_DOCUMENTOTIPO_ID').AsString;
          vgQualificar.StlCampos.Values['TB_ESTADOCIVIL_ID']    := dtmControles.sqlAuxiliar.FieldByName('TB_ESTADOCIVIL_ID').AsString;
          vgQualificar.StlCampos.Values['TB_PROFISSAO_ID']      := dtmControles.sqlAuxiliar.FieldByName('TB_PROFISSAO_ID').AsString;
          vgQualificar.StlCampos.Values['TB_REGIMECOMUNHAO_ID'] := dtmControles.sqlAuxiliar.FieldByName('TB_REGIMECOMUNHAO_ID').AsString;

          if dtmControles.sqlAuxiliar.FieldByName('SEG_DOCUMENTOTIPO_ID').AsString = '' then
               vgQualificar.StlCampos.Values['SEG_DOCUMENTOTIPO_ID']  := '0'
          else vgQualificar.StlCampos.Values['SEG_DOCUMENTOTIPO_ID']  := dtmControles.sqlAuxiliar.FieldByName('SEG_DOCUMENTOTIPO_ID').AsString;

          vgQualificar.Sexo := dtmControles.sqlAuxiliar.FieldByName('SEXO').AsString;
          vgQualificar.VincQtdSexo[1,2] := vgQualificar.Sexo;
        end;
        dtmControles.sqlAuxiliar.Close;
      end;
    end
    else
      if vgId = 12 then // Registro Civil
      begin
        if vgQualificar.StlCampos.Values['PESSOA_CONJUGE_ID'] <> '' then
        begin
          // Procura Dados da Outra Parte (Conjuge)
          ExecutaSqlAuxiliar(' SELECT SEXO, P.PESSOA_ID, TB_DOCUMENTOTIPO_ID, TB_ESTADOCIVIL_ID, TB_PROFISSAO_ID, CIDADE_ID, NATURALIDADE_ID, NATURALIDADE_UF '+
                             ' FROM V_PESSOA P'+
                             ' WHERE PESSOA_ID ='+ vgQualificar.StlCampos.Values['PESSOA_CONJUGE_ID'],0);
          // Armazena os Dados
          if not dtmControles.sqlAuxiliar.IsEmpty then
          begin
            vgQualificar.StlCampos.Values['PESSOA_CONJUGE_ID']    := vgQualificar.StlCampos.Values['PESSOA_ID'];
            vgQualificar.StlCampos.Values['PESSOA_ID']            := dtmControles.sqlAuxiliar.FieldByName('PESSOA_ID').AsString;
            vgQualificar.StlCampos.Values['TB_DOCUMENTOTIPO_ID']  := dtmControles.sqlAuxiliar.FieldByName('TB_DOCUMENTOTIPO_ID').AsString;
            vgQualificar.StlCampos.Values['TB_ESTADOCIVIL_ID']    := dtmControles.sqlAuxiliar.FieldByName('TB_ESTADOCIVIL_ID').AsString;
            vgQualificar.StlCampos.Values['TB_PROFISSAO_ID']      := dtmControles.sqlAuxiliar.FieldByName('TB_PROFISSAO_ID').AsString;
            vgQualificar.Sexo := dtmControles.sqlAuxiliar.FieldByName('SEXO').AsString;
            vgQualificar.VincQtdSexo[1,2] := vgQualificar.Sexo;

            if vgQualificar.StlLista <> nil then
              FreeAndNil(vgQualificar.StlLista);
            vgQualificar.StlLista := TStringList.Create;

            if dtmControles.sqlAuxiliar.FieldByName('NATURALIDADE_ID').AsString <> '' then
              vgQualificar.StlLista.Add('NATURALIDADE_PESSOA='+
                MaiusculoMinusculo(dtmControles.GetStr(
                  ' SELECT MUNICIPIO FROM G_MUNICIPIO ' +
                  ' WHERE MUNICIPIO_ID = ' + dtmControles.sqlAuxiliar.FieldByName('NATURALIDADE_ID').AsString))+'-'+
                                                                                   AnsiUpperCase(dtmControles.sqlAuxiliar.FieldByName('NATURALIDADE_UF').AsString));
          end;
          dtmControles.sqlAuxiliar.Close;
        end;
      end
      else
        if vgId = 1 then // Registro de Im�veis
        begin
          viPESSOA_CONJUGE_ID := vgQualificar.StlCampos.Values[
            'PESSOA_CONJUGE_ID'];

          if not SameText(viPESSOA_CONJUGE_ID, EmptyStr) then
          begin
            // Procura Dados da Outra Parte (C�njuge)
            viSQL_SELECT := 'SELECT ' +
              'PESSOA_ID, ' +
              'TB_PROFISSAO_ID, ' +
              'TB_DOCUMENTOTIPO_ID ' +
              'FROM ' +
              'R_PESSOA ' +
              'WHERE ' +
              'PESSOA_ID = :VI_PESSOA_ID;';

            ExecutaSqlAuxiliar(viSQL_SELECT, 2);
            viPESSOA_ID := StrToCurr(viPESSOA_CONJUGE_ID);

            with dtmControles.sqlAuxiliar do
            begin
              Params[0].AsCurrency := viPESSOA_ID;
              Open;

              // Armazena os Dados
              if not IsEmpty then
                with vgQualificar.StlCampos do
                begin
                  Values['PESSOA_ID'] := Fields[0].AsString;
                  Values['TB_PROFISSAO_ID'] := Fields[1].AsString;
                  Values['TB_DOCUMENTOTIPO_ID'] := Fields[2].AsString;
                end;

              Close;
            end;
          end;
        end;

    vpWptAux.SelectionAsString := '';
  end;

begin
  viTipoValor := #0;

  if vgQualificar.StlBookMark <> nil then
     FreeAndNil(vgQualificar.StlBookMark);

  if vgQualificar.stlMarcacaoFixaA <> nil then
     FreeAndNil(vgQualificar.stlMarcacaoFixaA);

  vgQualificar.StlBookMark      := TStringList.Create;
  vgQualificar.stlMarcacaoFixaA := TStringList.Create;

  if vgQualificar.WptAuxiliar = nil then
  begin
    vgQualificar.WptTextoMarcacao         := TWPRichText.Create(nil);
    vgQualificar.WptTextoMarcacao.Visible := false;

    vgQualificar.WptAuxiliar         := TWPRichText.Create(nil);
    vgQualificar.WptAuxiliar.Visible := false;
  end;

  if vpTipo = 'L' then
  begin
    vpWptAux.CPPosition := $0;
    vpWptAux.InputString('');
    for i := 0 to vgQualificar.StlPrincipal.Count - 1 do
    begin
      vpWptAux.BookmarkMoveTo(vgQualificar.StlPrincipal[i], TRUE);
      vpWptAux.BookmarkSelect(vpWptAux.CPObj.Name, False);
      vpWptAux.CPMoveNext;
      vgQualificar.VincStylo[i] := vpWptAux.CurrAttr.Style;
    end;
    vpWptAux.SelectAll;
    vpWptAux.CurrAttr.Style := [];
  end;

  if vgQualificar.stlListaSequencial <> nil then
     FreeAndNil(vgQualificar.stlListaSequencial);
  vgQualificar.stlListaSequencial := TStringList.Create;

  try
    for i := 0 to vgQualificar.StlPrincipal.Count - 1 do
    begin
      try
        Marcacao_DefinirTipo(vgQualificar.StlPrincipal[i]);

        // Procura pelo Tipo de valor da marca��o
        ExecutaSimpleDSAux(' SELECT TIPO_VALOR, TEXTO, CONDICAO_SQL, SEPARADOR_1, SEPARADOR_2, SEPARADOR_3, ATIVAR_SEPARADOR  '+
                           ' FROM G_MARCACAO_TIPO '+
                           ' WHERE NOME = '+QuotedStr(TrocaCharPorAsci(vgQualificar.Palavra))+
                           '   AND SISTEMA_ID = '+ IntToStr(vgId),0);

        vgQualificar.WptTextoMarcacao.AsString := DeCompressString(dtmControles.SimpleAuxiliar.FieldByName('TEXTO').AsString);
        vgQualificar.CondicaoSql               := dtmControles.SimpleAuxiliar.FieldByName('CONDICAO_SQL').AsString;
        vgQualificar.VincSeparador[1]          := dtmControles.SimpleAuxiliar.FieldByName('SEPARADOR_1').AsString;
        vgQualificar.VincSeparador[2]          := dtmControles.SimpleAuxiliar.FieldByName('SEPARADOR_2').AsString;
        vgQualificar.VincSeparador[3]          := dtmControles.SimpleAuxiliar.FieldByName('SEPARADOR_3').AsString;
        vgQualificar.AtivarSeparador           := dtmControles.SimpleAuxiliar.FieldByName('ATIVAR_SEPARADOR').AsString = 'S';

        {Seta a Marca��o}
        if not vpWptAux.BookmarkMoveTo(vgQualificar.StlPrincipal[i], True) then
          continue;

        {Troca o Nome da marca��o}
        vpWptAux.CPObj.Name := 'SELECIONAR'+IntToStr(i);
        vgQualificar.Fonte := vpWptAux.CurrAttr.FontName;

        {Seleciona a marca��o para guardar o stylo}
        if vpWptAux.BookmarkSelect(vpWptAux.CPObj.Name, False) then
          vgQualificar.Stylo := vpWptAux.CurrAttr.Style;

        {Armazena o Nome do bookmark na Lista, para retornar posteriormente}
        vgQualificar.StlBookMark.Add(vpWptAux.CPObj.Name+'='+vgQualificar.StlPrincipal[i]);

        {Verifica se � marca��o de troca de Parte}
        if vgQualificar.Palavra = '&' then
           VerificarTrocarParte
        else
        begin
          // Se n�o encontrou o tipo de marca��o, ent�o apaga a mesma
          if dtmControles.SimpleAuxiliar.FieldByName('TIPO_VALOR').AsString = '' then
            vgQualificar.WptAuxiliar.AsString := ''
          else
          begin
            viTipoValor := dtmControles.SimpleAuxiliar.FieldByName('TIPO_VALOR').AsString[1];
            case viTipoValor of
              'C'         : Qualificar_TipoConfig(vgQualificar.WptTextoMarcacao.Text);
              'T','L','Q' : Qualificar_TipoListaTexto(vgQualificar.StlPrincipal[i]);
              'R', 'P'    : Qualificar_TipoListaTexto(vgQualificar.StlPrincipal[i]);
              'F'         : vgQualificar.stlMarcacaoFixaA.Add(vgQualificar.StlPrincipal[i]);
            end;
          end;

          vgQualificar.viStyliId := i;

          if viTipoValor <> 'F' then
            Qualificar_SubstituirMarcacao(vgQualificar.StlPrincipal[i], vpTipo, vpWptAux, 'SELECIONAR'+IntToStr(i));
        end;
      except
        if vgQualificar.StlErros = nil then
        begin
          vgQualificar.StlErros := TStringList.Create;
          vgQualificar.StlErros.Add('Marca��es com erro de atualiza��o!!!');
        end;
        vgQualificar.StlErros.Add('');
        vgQualificar.StlErros.Add('--> '+ vgQualificar.StlPrincipal[i]);
      end;
    end;

    // Retorna os valores do Bookmark Padr�o
    for i := 0 to vgQualificar.StlPrincipal.Count - 1 do
    begin
      if not vpWptAux.BookmarkMoveTo('SELECIONAR'+IntToStr(i), True) then
        continue;

      vpWptAux.CPObj.Name := vgQualificar.StlBookMark.Values['SELECIONAR'+IntToStr(i)];
      if vpTravarMarcacao then
      begin
        vpWptAux.BookmarkSelect(vpWptAux.CPObj.Name, true);
        vpWptAux.CurrAttr.AddStyle([ afsProtected ]);
        vpWptAux.HideSelection;
      end;
    end;

    // Retira a prote��o
    if vpRetirarProtecao then
    begin
      vpWptAux.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
      vpWptAux.SelectAll;
      vpWptAux.CurrAttr.DeleteStyle([ afsProtected ]);
      vpWptAux.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
      vpWptAux.HideSelection;
    end;

    vpWptAux.CPPosition := $0;

  finally
    FreeAndNil(vgQualificar.stlListaSequencial);
    dtmControles.SimpleAuxiliar.close;
  end;

  // Marca��es Fixas
  if vgQualificar.stlMarcacaoFixaA.Count > 0 then
    Qualificar_FixoTabelionato(vpWptAux, vgQualificar.stlMarcacaoFixaA)
  else
    if vpTipo = 'G' then
    begin
       DestruirWptVirtual('vgWptAuxiliar');
       DestruirWptVirtual('vgWptTextoMarcacao');
    end
    else vgQualificar.WptAuxiliar.AsString := vpWptAux.AsString;

{  FreeAndNil(vgQualificar.StlBookMark);
  FreeAndNil(vgQualificar.stlMarcacaoFixaA);
  FreeAndNil(vgQualificar.WptAuxiliar);
  FreeAndNil(vgQualificar.WptTextoMarcacao);}
end;

Function Qualificar_AplicarGramatica(vpMarcacao : string):string;
var
  viPalavraOrigem, viPalavraFinal, viPalavra, vpTipoFormatacao : string;
  viPos : Integer;
  viPalavraSeparada : Boolean;
begin
  viPos := 0;

  viPalavraOrigem   := copy(vpMarcacao,1,pos('�',vpMarcacao)-1);
  viPalavraOrigem   := Trim(viPalavraOrigem);
  vpTipoFormatacao  := copy(vpMarcacao,1,pos('�',vpMarcacao)-1);

  if length(vpTipoFormatacao) = 1 then
    vpTipoFormatacao := vpTipoFormatacao + 's';

  ExecutaSqlAuxiliar('SELECT * FROM G_GRAMATICA WHERE PALAVRA ='+ QuotedStr(viPalavraOrigem),0);
  if not dtmControles.sqlAuxiliar.IsEmpty then
       viPalavraSeparada := True
  else viPalavraSeparada := False;

  repeat
    if not viPalavraSeparada then
    begin
      viPos :=  Pos(' ',viPalavraOrigem);
      if viPos > 0 then
      begin
        viPalavra := copy(viPalavraOrigem, 1, viPos-1);
        Delete(viPalavraOrigem,1,viPos);
      end
      else viPalavra := viPalavraOrigem;

      if length(viPalavra) > 1 then
           ExecutaSqlAuxiliar('SELECT * FROM G_GRAMATICA WHERE PALAVRA ='+ QuotedStr(viPalavra),0)
      else ExecutaSqlAuxiliar('SELECT * FROM G_GRAMATICA WHERE PALAVRA ='+ QuotedStr('xxx'),0);
    end;

    if not dtmControles.sqlAuxiliar.IsEmpty then
    begin
      if vgQualificar.Qtd = '1' then
        if vgQualificar.Sexo = 'M' then
             viPalavra := dtmControles.sqlAuxiliar.FieldByName('PREFIXO').Asstring + dtmControles.sqlAuxiliar.FieldByName('SUFIXO_MS').Asstring
        else viPalavra := dtmControles.sqlAuxiliar.FieldByName('PREFIXO').Asstring + dtmControles.sqlAuxiliar.FieldByName('SUFIXO_FS').Asstring
      else
        if vgQualificar.Sexo = 'M' then
             viPalavra := dtmControles.sqlAuxiliar.FieldByName('PREFIXO').Asstring + dtmControles.sqlAuxiliar.FieldByName('SUFIXO_MP').Asstring
        else viPalavra := dtmControles.sqlAuxiliar.FieldByName('PREFIXO').Asstring + dtmControles.sqlAuxiliar.FieldByName('SUFIXO_FP').Asstring;
    end;

    if vpTipoFormatacao = AnsiUpperCase(vpTipoFormatacao) then
       viPalavraFinal := viPalavraFinal +' '+AnsiUpperCase(viPalavra)
    else
      if vpTipoFormatacao = AnsiLowerCase(vpTipoFormatacao) then
           viPalavraFinal := viPalavraFinal +' '+ AnsiLowerCase(viPalavra)
      else viPalavraFinal := viPalavraFinal +' '+ MaiusculoMinusculo(viPalavra);
  until (viPos = 0) or viPalavraSeparada;

  dtmControles.sqlAuxiliar.Close;
  Result := trim(viPalavraFinal);
end;

Function Qualificar_SelecionarMarcacao(vptipo : char; vpWptAux : TWPRichText):TStringList;
var
  i : integer;
  viMarcacao   : string;
  viStlInterno : TStringList;
//  viStlInterno : TWPTextObjList;
begin
  Result := TStringList.Create;
  viStlInterno := TStringList.Create;

  try
    // Carrega a Lista
  //  viStlInterno := vpWptAux.CodeListTags(wpobjBookmark,'*ALL*',true);
    vpWptAux.BookmarkGetList(viStlInterno);

    // Filtra pelo tipo desejado
    for i := 0 to viStlInterno.Count - 1 do
    begin
      viMarcacao := viStlInterno[i];
  //    viMarcacao := AnsiToUtf8(viStlInterno[i].Name);

      if pos('�',viMarcacao) > 0 then
      begin
        case vptipo of
          'a' : if copy(viMarcacao,pos('�',viMarcacao)+1,1) = 'a' then
                   Result.Insert(Result.Count, viMarcacao);
          't' : if CharInSet(copy(viMarcacao,pos('�',viMarcacao)+1,1)[1],['g','t','l','r','p','q']) then
                  Result.Insert(Result.Count, viMarcacao);
          's' : if CharInSet(copy(viMarcacao,pos('�',viMarcacao)+1,1)[1],['s']) then
                  Result.Insert(Result.Count, viMarcacao);
        end
      end
      else
        if vptipo = 'm' then
           Result.Insert(Result.Count, viMarcacao);
    end;
  finally
    FreeAndNil(viStlInterno);
  end;
end;

Function Qualificar_VerificarSexoTab(vpTipoVinculo: char; vpVinculoAuxiliarId : String; vpPessoaJuridica : Boolean = False):string;
var
  viSql : String;

  procedure VerificarSexoAuxiliar;
  begin
    if  vpPessoaJuridica then
      ExecutaSqlAuxiliar(' SELECT P.SEXO '+
                         ' FROM T_PESSOA_REPRESENTANTE PR '+
                         '   LEFT OUTER JOIN T_PESSOA P '+
                         '   ON PR.REPRESENTANTE_ID = P.PESSOA_ID '+
                         ' WHERE PR.PESSOA_ID = '+ vpVinculoAuxiliarId +
                         ' ORDER BY P.SEXO DESC ',0)
    else
      ExecutaSqlAuxiliar(' SELECT P.SEXO '+
                         ' FROM T_ATO_VINCULOPARTE AV LEFT OUTER JOIN T_PESSOA P '+
                         '   ON AV.AUXILIAR_ID = P.PESSOA_ID'+
                         ' WHERE AV.AUXILIAR_ID = '+ vpVinculoAuxiliarId +
                         ' ORDER BY P.SEXO DESC ',0);
    if dtmControles.sqlAuxiliar.IsEmpty then
         Qualificar_VerificarSexoTab := 'M'
    else Qualificar_VerificarSexoTab := dtmControles.sqlAuxiliar.FieldByName('SEXO').AsString;
    dtmControles.sqlAuxiliar.Close;
  end;

begin
 {Tipo de Vinculo Gramatical Tabelionato
  0  =  Outorgante Reciprocamente Outorgado;  1  = Outorgante;  2  = Outorgado;  3  = Im�vel;  4  = Por N�mero de Assinaturas}

  if CharInSet(vpTipoVinculo,['0','1','2','4']) then
  begin
    // Verifica se alguma das partes desejadas possui sexo masculino
    viSql := ' SELECT P.SEXO '+
             ' FROM T_PESSOA P '+
             '   INNER JOIN T_ATO_VINCULOPARTE VP '+
             '   ON P.PESSOA_ID = VP.PESSOA_ID '+
             '   AND VP.ATO_ID  = '+ IntToStr(vgQualificar.ChaveId) +
             ' WHERE P.SEXO     = '+ QuotedStr('M');

    if vpTipoVinculo = '4' then
         viSql := viSql + ' AND VP.ASSINATURA_TIPO BETWEEN '+ QuotedStr('1') + ' AND '+ QuotedStr('2')
    else
      if vpTipoVinculo <> '3' then
            viSql := viSql + ' AND VP.ASSINATURA_TIPO <> ' + QuotedStr('4')+
                             ' AND (VP.TIPO_VINCULO = '+ QuotedStr(vpTipoVinculo) +' OR TIPO_VINCULO = '+ QuotedStr('0')+')'
      else  viSql := viSql + ' AND VP.ASSINATURA_TIPO <> ' + QuotedStr('4')+
                             ' AND VP.TIPO_VINCULO = '+ QuotedStr(vpTipoVinculo);

    // Se for verifica��o para auxiliares
    if vpVinculoAuxiliarId <> '' then
      viSql := viSql + ' AND VP.AUXILIAR_ID = '+ vpVinculoAuxiliarId;
    viSql := viSql + ' GROUP BY P.SEXO ';

    ExecutaSqlAuxiliar(viSql,0);

    if dtmControles.sqlAuxiliar.IsEmpty then
    begin
      if vpVinculoAuxiliarId <> '' then
           VerificarSexoAuxiliar
      else Qualificar_VerificarSexoTab := 'F';
    end
    else Qualificar_VerificarSexoTab := 'M';
  end
  else Qualificar_VerificarSexoTab := 'M'; {tipo do v�nculo do im�vel � sempre masculino}
  dtmControles.sqlAuxiliar.Close;
end;

Function Qualificar_QtdRegistroTab(vpTipoVinculo : char; vpVinculoAuxiliarId : String):string;
var
  viSql : string;
begin
  {0  = Outorgante/Reciprocamente Outorgado; 1  = Outorgante;  2  = Outorgado;  3  = Im�vel;  4  = Por N�mero de Assinaturas}

  if CharInSet(vpTipoVinculo,['0','1','2','4']) then
  begin
    viSql := ' SELECT COUNT(ATO_VINCULOPARTE_ID) AS QTD'+
             ' FROM T_ATO_VINCULOPARTE  '+
             ' WHERE ATO_ID = '+ IntToStr(vgQualificar.ChaveId);

    if vpTipoVinculo = '4' then
       viSql := viSql + ' AND ASSINATURA_TIPO BETWEEN '+ QuotedStr('1') + ' AND '+ QuotedStr('2')
    else
      if vpTipoVinculo <> '3' then
           viSql := viSql + ' AND (ASSINATURA_TIPO IN (''1'',''2'',''3''))'+
                            ' AND (TIPO_VINCULO = '+ QuotedStr(vpTipoVinculo) +' OR TIPO_VINCULO = '+ QuotedStr('0')+')'
      else viSql := viSql + ' AND (ASSINATURA_TIPO IN (''1'',''2'',''3''))'+
                            ' AND TIPO_VINCULO = '+ QuotedStr(vpTipoVinculo);

    // Se for verifica��o para auxiliares
    if vpVinculoAuxiliarId <> '' then
      viSql := viSql + ' AND AUXILIAR_ID = '+ vpVinculoAuxiliarId;

    ExecutaSqlAuxiliar(viSql,0);
  end
  else
  begin
    // Quantidade de Im�vel
    ExecutaSqlAuxiliar(' SELECT COUNT(ATO_VINCULOIMOVEL_ID) AS QTD'+
                       ' FROM T_ATO_VINCULOIMOVEL '+
                       ' WHERE ATO_ID = '+IntToStr(vgQualificar.ChaveId),0);
  end;
  Qualificar_QtdRegistroTab := CurrToStr(dtmControles.sqlAuxiliar.FieldByName('QTD').AsCurrency);
  dtmControles.sqlAuxiliar.Close;
end;

procedure Qualificar_Gramatica(vpWptAux : TWPRichText; vpLocal : Boolean = False; vpSexo2Parte : String = '';
                    vpRetirarMarcacao : Boolean = False);
var
  viVinculoGramatical : char;
  i : integer;

  procedure ArmazenarVinculoSexoQtdTab;
  var
    viQtdImovel : Integer;
  begin
    viQtdImovel := 0;

    if vpLocal then
    begin
       vgQualificar.VincQtdSexo[StrToInt(viVinculoGramatical),1] := vgQualificar.Qtd;
       if viVinculoGramatical = '3' then
         vgQualificar.VincQtdSexo[StrToInt(viVinculoGramatical),2] := 'M'
       else
         if (viVinculoGramatical = '2') and (vpSexo2Parte <> '') then
              vgQualificar.VincQtdSexo[StrToInt(viVinculoGramatical),2] := vpSexo2Parte
         else vgQualificar.VincQtdSexo[StrToInt(viVinculoGramatical),2] := vgQualificar.Sexo;
    end
    else
    begin
      if viVinculoGramatical = '3' then
        viQtdImovel := dtmControles.GetInt ('SELECT QTD_IMOVEL FROM T_ATO WHERE ATO_ID = '+ IntToStr(vgQualificar.ChaveId));

      // Verifica se � Qualifica��o de Imoveis
      if (viVinculoGramatical = '3') and (viQtdImovel > 0) then
      begin
        vgQualificar.VincQtdSexo[StrToInt(viVinculoGramatical),1] := IntToStr(viQtdImovel);
        vgQualificar.VincQtdSexo[StrToInt(viVinculoGramatical),2] := 'M';
      end
      else
      begin
        // Verificar a quantidade de pessoas/imoveis a serem qualificadas do mesmo tipo - Somente Qualifica��o do Ato Geral
        vgQualificar.VincQtdSexo[StrToInt(viVinculoGramatical),1] := Qualificar_QtdRegistroTab(viVinculoGramatical, '');
        vgQualificar.VincQtdSexo[StrToInt(viVinculoGramatical),2] := Qualificar_VerificarSexoTab(viVinculoGramatical,'');
      end
    end;
  end;

begin
  // Pega os Tipos de Vinculos do Sistema
  ExecutaSimpleDSAux(' SELECT C.VALOR FROM G_CONFIG C '+
                     '  LEFT OUTER JOIN G_CONFIG_GRUPO G '+
                     '   ON C.CONFIG_GRUPO_ID = G.CONFIG_GRUPO_ID '+
                     ' WHERE C.SECAO = '+ QuotedStr('VINCULO_GRAMATICAL')+
                     '   AND G.DESCRICAO = '+ QuotedStr('MARCACAO')+
                     '   AND G.SISTEMA_ID = '+ IntToStr(vgId) +
                     ' ORDER BY C.CONFIG_ID ',0);

  for i := 1 to dtmControles.SimpleAuxiliar.RecordCount do
  begin
    viVinculoGramatical := dtmControles.SimpleAuxiliar.FieldByName('VALOR').asstring[1];
    if vgId = 2 then {** DEFINIDO POR SISTEMA}
       ArmazenarVinculoSexoQtdTab;
    dtmControles.SimpleAuxiliar.Next;
  end;
  Qualificar_GetGramatica(vpWptAux, vpRetirarMarcacao);
  vpWptAux.CPPosition := $0;
end;

procedure Qualificar_GetGramatica(vpWptAux : TWPRichText; vpRetirarMarcacao : Boolean = False);
var
  viOk : boolean;
  viTempList : TWPTextObjList;
  viObj      : TWPTextObj;
  viPalavra, viVinculoGramatical, viLinkAnterior : string;

  procedure IniciarBusca;
  var
    viContador : Integer;
  begin
    vpWptAux.HideSelection;
    viOk := False;

    // Avan�a para a pr�xima marca��o
    if vpWptAux.CPPosition > 0 then
      vpWptAux.CPMoveNext;

    viContador := 0;
    repeat

      viTempList.Clear;
      vpWptAux.OpenCodesAtCP(viTempList,wpobjHyperlink);
      vpWptAux.CPMoveNext;

      if (viContador = viTempList.Count) then
        Break;

      if (viContador =  0) then
        viContador := viTempList.Count;

    until (viTempList.Count = 0) or (viContador = 0);
  end;

begin
  vpWptAux.CPPosition := $0;
  viTempList := TWPTextObjList.Create;

  try
    IniciarBusca;

    repeat
      repeat
        viTempList.Clear;
        vpWptAux.OpenCodesAtCP(viTempList,wpobjHyperlink);
        viObj      := vpWptAux.HyperlinkAtCP;

        // Procura a Marca��o e seta o objeto da mesma
        While ((viTempList.Count > 0) and (Pos('�', viObj.Name) = 0)) do
        begin
          viObj := vpWptAux.HyperlinkAtCP;
          viOk  := true;
          Break;
        end;

        if (viOk) and ((copy(viObj.Source,pos('�',viObj.Source)+2,1)) <> '') then
        begin
          // Pega o Sexo e a quantidade do tipo ja armazenados
          viVinculoGramatical := copy(viObj.Source,pos('�',viObj.Source)+2,1);

          try
            if vgQualificar.VincQtdSexo[strtoint(viVinculoGramatical),1] = '' then
                 vgQualificar.Qtd := '1'
            else vgQualificar.Qtd := vgQualificar.VincQtdSexo[strtoint(viVinculoGramatical),1];
            vgQualificar.Sexo   := vgQualificar.VincQtdSexo[strtoint(viVinculoGramatical),2];
          except
            vgQualificar.Qtd  := '1';
            vgQualificar.Sexo := 'M';
          end;

          if StrToInt(vgQualificar.Qtd) > 0 then
          begin
            // Realizar a formata��o gramatical
            viPalavra := Qualificar_AplicarGramatica(viObj.Source);

            if viPalavra <> '' then
            begin
              // Seleciona a Palavra
              vpWptAux.CPPosition := vpWptAux.CPPosition - 1;
              viLinkAnterior      := viObj.Source;
              viObj.Source        := '%SELECIONAR';
              vpWptAux.HyperlinkSelect('%SELECIONAR', True);
              vpWptAux.InputString(viPalavra);
              viObj.Source        := viLinkAnterior;
            end;

            if vpRetirarMarcacao then // Retira a Marca��o do hyperlink, se verdadeiro.
               vpWptAux.DeleteHyperlink(False);
          end;
        end
        else vpWptAux.CPMoveNext;
      until (viOk or (not(vpWptAux.CPMoveNext)));
      IniciarBusca;
    until not(vpWptAux.CPMoveNext);

  finally
    FreeAndNil(viTempList);
  end;

  try
    viObj.Free;
  except

  end;
end;

procedure RedefinirPadraoFonte(var vpTexto : TWPRichText;
      vpAssinatura : Boolean = False; vpAlterarTamanho : Boolean = True);
begin
  if vgConfigEditor.FonteTipo = '' then
  begin
    vgConfigEditor.FonteTipo    := dtmControles.BuscarConfig('EDITOR', 'PROPRIEDADE', 'FONTE_TIPO', 'S');
    vgConfigEditor.FonteTamanho := dtmControles.BuscarConfig('EDITOR', 'PROPRIEDADE', 'FONTE_TAMANHO','I');
  end;

  vpTexto.ProtectedProp        := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  vpTexto.CurrAttr.FontName    := vgConfigEditor.FonteTipo;
  if vpAlterarTamanho then
    if vpAssinatura then
         vpTexto.CurrAttr.Size := vgConfigEditor.FonteTamAssinatura
    else vpTexto.CurrAttr.Size := vgConfigEditor.FonteTamanho;
  vpTexto.ProtectedProp        := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
end;

procedure Qualificar_TipoConfig(vpTexto : String);
var
  viGrupo, viSecao, viNome : String;
begin
  {Pegar o grupo}
  viGrupo := copy(vpTexto, 1, Pos(';',vpTexto)-1);
  Delete(vpTexto,1,Pos(';',vpTexto));

  {Pegar a Se��o}
  viSecao := copy(vpTexto, 1, Pos(';',vpTexto)-1);
  Delete(vpTexto,1,Pos(';',vpTexto));

  {Pegar o Nome do Campo}
  viNome := copy(vpTexto, 1, Pos(';',vpTexto)-1);

  vgQualificar.WptAuxiliar.AsString := dtmControles.BuscarConfig(viGrupo, viSecao, viNome, 'S');
  vgQualificar.WptAuxiliar.DeleteTrailingSpace(False);
end;

procedure Qualificar_DefinirMascara(vpQtdMascara : integer; vpValor : string);
var
  WptTextoMascara : TWPRichText;
  stlMascara : TStringList;
  i : integer;

  procedure FormatarQRCODE;
  var
    viTexto, viNovoValor : String;
  begin
    viNovoValor := '';
    vgQualificar.WptTextoMarcacao.Clear;
    if pos('>', vgQualificar.Palavra) > 0 then
    begin
      viTexto := Copy(vgQualificar.Palavra, 10, pos('>', vgQualificar.Palavra)-10);
      if viTexto <> '' then
        viNovoValor := viTexto;

      viNovoValor := viNovoValor + vpValor;

      viTexto := Copy(vgQualificar.Palavra, pos('>', vgQualificar.Palavra)+1, LENGTH(vgQualificar.Palavra));
      if viTexto <> '' then
        viNovoValor := viNovoValor + vpValor;
    end
    else viNovoValor := vpValor;

    vgQualificar.WptTextoMarcacao.AsString := viNovoValor;
    WptTextoMascara.SelectionAsString := vgQualificar.WptTextoMarcacao.AsString;
  end;

begin
  // Cria editor temporario
  WptTextoMascara := CarregarWptVirtual(WptTextoMascara, vgQualificar.WptTextoMarcacao);

  // Grava dados, seleciona e retira marca��o global de mascara, deixando apenas as marca��es de mascaras
  WptTextoMascara.SelectionAsString := vgQualificar.WptTextoMarcacao.SelectionAsString;

  WptTextoMascara.SelectAll;
  WptTextoMascara.CurrAttr.DeleteStyle([ afsProtected ]);
  WptTextoMascara.HideSelection;

  // Carregar lista com as Mascaras
  stlMascara := Qualificar_SelecionarMarcacao('s', WptTextoMascara);
  WptTextoMascara.CPPosition := $0;

  try
    for i := 0 to stlMascara.Count - 1 do
    begin
      // Substitui as Mascaras pelo valor correspondente
      Marcacao_DefinirTipo(stlMascara[i]);
      WptTextoMascara.BookmarkSelect(stlMascara[i], true);
      WptTextoMascara.CPPosition := WptTextoMascara.SelStart;
      if Pos('f_qrcode', LowerCase(vgQualificar.Palavra)) > 0 then
        FormatarQRCODE
      else
      begin
        if (vpValor <> '') or (LowerCase(vgQualificar.Palavra[1]) = 'd') or (vgQualificar.Palavra = 'F_CondicaoVazio') then
             WptTextoMascara.SelectionAsString := (Qualificar_FormatarMascara(copy(vgQualificar.Palavra,3,100), LowerCase(vgQualificar.Palavra[1]), vpValor))
        else WptTextoMascara.SelectionAsString := '';
      end;
      WptTextoMascara.DeleteTrailingSpace(True);
      WptTextoMascara.DeleteLeadingSpace(True);
    end;

    // Apaga a marca��o da mascara
    if vpQtdMascara = 1 then
      vgQualificar.WptTextoMarcacao.BookmarkDelete('SELECIONAR', True, true);

    // Seleciona a Marca��o da marca��o que pertence a mascara e substitui a mesma
    if vgQualificar.WptTextoMarcacao.BookmarkSelect('MASCARA', true) then
    begin
      vgQualificar.WptTextoMarcacao.BookmarkSelect('MASCARA', true);
      vgQualificar.WptTextoMarcacao.CPPosition := vgQualificar.WptTextoMarcacao.SelStart;
      vgQualificar.WptTextoMarcacao.ClearSelection(True);
      vgQualificar.WptTextoMarcacao.BookmarkDelete('MASCARA', true, true);

      if trim(vgQualificar.WptTextoMarcacao.Text) = ';' then
        vgQualificar.WptTextoMarcacao.CPPosition := $0;
      vgQualificar.WptTextoMarcacao.SelectionAsString := WptTextoMascara.AsString;
    end;
  finally
    FreeAndNil(WptTextoMascara);
    FreeAndNil(stlMascara);
  end;
end;

procedure Qualificar_TipoListaTexto(vpMarcacaoPrincipal : string);
var
  i, viSeq, viDuplicarQtd, vipos : integer;
  viCondicao, viSqlPrincipal, viCampoManual, viCondicaoValor : string;

  viResultado, viPalavra, viCondicaoSql, viTabelaAuxiliar : string;
  viTabela, viCampo, viID, viCampoIDDuplicar : string;

  viSeparadorQtd     : Integer;

  viCount : integer;  // Serve para definir se existe mais de uma mascara;
  viFlag, viDuplicar, viVerificarValor : Boolean;
  WptDuplicar, WptBackup : TWPRichText;

  procedure SepararCamposPesquisa;
  begin
    // Separa os campos de pesquisa
    if viTabelaAuxiliar = '' then
         viTabela := copy(viPalavra,1, Pos(';', viPalavra)-1)
    else viTabela := viTabelaAuxiliar;

    delete(viPalavra,1,Pos(';', viPalavra));
    viCampo := copy(viPalavra,1, Pos(';', viPalavra)-1);
    delete(viPalavra,1,Pos(';', viPalavra));
    viID         := viPalavra;
    if viID = '' then
       viID  := copy(viTabela,3, 30)+'_ID'
  end;

  procedure VerificarExistenciaMascara;
  begin
    vgQualificar.WptTextoMarcacao.CPObj.Name := 'SELECIONAR';
    vgQualificar.WptTextoMarcacao.BookmarkSelect(vgQualificar.WptTextoMarcacao.CPObj.Name, True);
    if vgQualificar.StlComplemento.Count-1 > i then
    begin
      Marcacao_DefinirTipo(vgQualificar.StlComplemento[i+1]);
      if vgQualificar.Tipo <> 'g' then
      begin
        if pos('TEXTO', viCampo) = 0 then
             vgQualificar.WptTextoMarcacao.SelectionAsString := viResultado
        else vgQualificar.WptTextoMarcacao.SelectionAsString := WptBackup.AsString;
        vgQualificar.WptTextoMarcacao.BookmarkMoveTo('SELECIONAR', True);
        vgQualificar.WptTextoMarcacao.CPObj.Name := 'PRONTO';
      end;
    end
    else
      if pos('TEXTO', viCampo) = 0 then
           vgQualificar.WptTextoMarcacao.SelectionAsString := viResultado
      else vgQualificar.WptTextoMarcacao.SelectionAsString := WptBackup.AsString;
  end;

  procedure InserirSeparador(var vpTexto : TWPRichText);
  begin
    if vgQualificar.AtivarSeparador then
    begin
      dec(viSeparadorQtd);
      case viSeparadorQtd of
        0 : vpTexto.InputString(vgQualificar.VincSeparador[3]);
        1 : if vgQualificar.VincSeparador[2] = 'e' then
                 vpTexto.InputString(' '+vgQualificar.VincSeparador[2]+' ')
            else vpTexto.InputString(vgQualificar.VincSeparador[2]+' ');
        else vpTexto.InputString(vgQualificar.VincSeparador[1]+' ')
      end;
    end;
  end;

begin
  viDuplicarQtd := 0;
  viCount       := 0;
  viDuplicar    := False;
  viFlag        := True;

  try
    try
      repeat
        // verifica se houve duplica��o. caso sim, grava no Wptools Armazenador.
        if viDuplicar then
        begin
          WptDuplicar.SelectionAsString :=  vgQualificar.WptTextoMarcacao.AsString;
          InserirSeparador(WptDuplicar);
          vgQualificar.WptTextoMarcacao.AsString := WptBackup.AsString;
        end
        else
          viFlag := True;

        viCondicaoSql := vgQualificar.CondicaoSql;

        // *** Verifica se a Troca de Tabela de Valores
        viTabelaAuxiliar := '';
        if (viCondicaoSql <> '') then
        begin
          vipos := pos('TABELA_AUXILIAR=', viCondicaoSql);
          if vipos > 0 then
          begin
            if (vgQualificar.UsarTabelaAuxiliar) then
              viTabelaAuxiliar := copy(viCondicaoSql, pos('=',viCondicaoSql)+1, 30);
            viCondicaoSql := '';
            vgQualificar.CondicaoSql := '';
          end;
        end;
        // *** Final

        // Carrega a lista de Marca��o de tabelas, listas e Grupos de Mascaras
        if vgQualificar.StlComplemento <> nil then
           FreeAndNil(vgQualificar.StlComplemento);

        vgQualificar.StlComplemento := Qualificar_SelecionarMarcacao('t', vgQualificar.WptTextoMarcacao);
        vgQualificar.WptTextoMarcacao.CPPosition := $0;

        for i := 0 to vgQualificar.StlComplemento.Count - 1 do
        begin
          vgQualificar.WptTextoMarcacao.BookmarkMoveTo(vgQualificar.StlComplemento[i], TRUE);

          // Define o Tipo da mesma
          Marcacao_DefinirTipo(vgQualificar.StlComplemento[i], False);
          viPalavra := vgQualificar.Palavra;

          case vgQualificar.Tipo of    { (t) = Tipo de Tabela   (r) Tipo de Somat�rio   (q) Tipo de Sequencial }
           't','r','q': begin  {Tipo Tabela}
                          viCount := 0;

                          {Pega os campos de pesquisa}
                          SepararCamposPesquisa;

                          viCampoManual := '';
                          if (pos('AND ',viCondicaoSql) > 0) OR (pos('OR ',viCondicaoSql) > 0) OR (pos('GROUP ',viCondicaoSql) > 0) OR (pos('ORDER ',viCondicaoSql) > 0) then
                            viCondicao := viCondicaoSql
                          else
                          begin
                            viCondicao := '';
                            if (pos('CAMPO_MANUAL=',viCondicaoSql) > 0) then
                              viCampoManual := copy(viCondicaoSql, pos('=',viCondicaoSql)+1, 255);

                            if (pos('CP=',viCondicaoSql) > 0) then
                              viCampoManual := copy(viCondicaoSql, pos('=',viCondicaoSql)+1, 255);
                          end;

                          if vgQualificar.StlCampos.Values[viID] <> '' then
                          begin
                            viVerificarValor := True;
                            if CharInSet(vgQualificar.Tipo, ['t','q']) then
                            begin
                              if viCampoManual = '' then
                                   viSqlPrincipal := ' SELECT '+ viCampo
                              else viSqlPrincipal := ' SELECT '+ viCampoManual;

                              vgSqlCondicao  := ' FROM '+viTabela;

                              if (pos(viID+'=',viCondicaoSql) = 0) then
                                vgSqlCondicao := vgSqlCondicao + ' WHERE '+viID +' = '+ vgQualificar.StlCampos.Values[viID] + ' '
                              else
                              begin
                                viCondicaoValor := copy(viCondicaoSql, pos('=',viCondicaoSql)+1, 255);
                                vgSqlCondicao   := vgSqlCondicao + ' WHERE '+viID +' = '+ vgQualificar.StlCampos.Values[viCondicaoValor] + ' ';
                              end;

                              ExecutaSimpleDSAux(
                                viSqlPrincipal + vgSqlCondicao + viCondicao,
                                IfThen(
                                  viCondicao.Contains(
                                    ':P_') and
                                  Assigned(
                                    vgQualificar.ParametrosCondicao),
                                  2));

                              if viCondicao.Contains(
                                ':P_') and
                                Assigned(
                                  vgQualificar.ParametrosCondicao) then
                              begin
                                dtmControles.SimpleAuxiliar.Params
                                  .AssignValues(
                                    vgQualificar.ParametrosCondicao);

                                dtmControles.SimpleAuxiliar.Open;
                              end;

                              // Somente se o "vpValor" igual a Vazio e Condi��o achar o Proximo Campo/e ou Tabela
                              if (dtmControles.SimpleAuxiliar.FieldByName(viCampo).AsString = '') then
                              begin
                                if (pos('&&', viCondicaoSql) > 0) then // Lista
                                begin
                                  viCount := 0;
                                  viCampo          := copy(viCondicaoSql,Pos('&&', viCondicaoSql)+2,30);
                                  viResultado      := vgQualificar.StlLista.Values[viCampo];
                                  viVerificarValor := False
                                end
                                else
                                begin
                                  if (pos('&', viCondicaoSql) > 0)  then
                                  begin
                                    viTabela := copy(viCondicaoSql, 1, pos('&', viCondicaoSql)-1);
                                    Delete(viCondicaoSql,1, pos('&', viCondicaoSql));
                                    viCampo := copy(viCondicaoSql, 1, pos('&', viCondicaoSql)-1);
                                    Delete(viCondicaoSql,1, pos('&', viCondicaoSql));
                                    viID     := copy(viCondicaoSql, 1, pos('&', viCondicaoSql)-1);

                                    vgSqlCondicao  := ' FROM '+viTabela +
                                                      ' WHERE '+viID +' = '+ vgQualificar.StlCampos.Values[viID] + ' ';
                                    viSqlPrincipal := ' SELECT '+ viCampo;
                                    ExecutaSimpleDSAux(viSqlPrincipal + vgSqlCondicao,0);
                                  end;
                                end;
                              end;
                            end
                            else
                              ExecutaSimpleDSAux(' SELECT SUM('+viCampo+') AS '+ viCampo +
                                                 ' FROM '+viTabela +
                                                 ' WHERE '+viID +' = '+ vgQualificar.StlCampos.Values[viID] + ' '+
                                                   viCondicao,0);

                            if viVerificarValor and (pos('TEXTO', viCampo) = 0) then
                            begin
                              if CharInSet(vgQualificar.Tipo,['t','r']) then
                              begin
                                viResultado := dtmControles.SimpleAuxiliar.FieldByName(viCampo).AsString;
                                viResultado := AplicarEstiloCaixaAltaBaixa(viResultado);
                              end
                              else
                              begin
                                vgQualificar.Sequencial := 1;
                                for viSeq := 1 to vgQualificar.stlListaSequencial.Count do
                                begin
                                  if pos(viCampo, vgQualificar.stlListaSequencial[viSeq-1]) > 0 then
                                  begin
                                    vgQualificar.Sequencial := StrToInt(vgQualificar.stlListaSequencial.Values[viCampo])+1;
                                    vgQualificar.stlListaSequencial.Values[viCampo] := IntToStr(vgQualificar.Sequencial);
                                  end
                                end;

                                if vgQualificar.Sequencial = 1 then
                                  vgQualificar.stlListaSequencial.Add(viCampo+'=1');

                                if dtmControles.SimpleAuxiliar.RecordCount >= vgQualificar.Sequencial then
                                begin
                                  dtmControles.SimpleAuxiliar.RecNo := vgQualificar.Sequencial;
                                  viResultado := dtmControles.SimpleAuxiliar.FieldByName(viCampo).AsString;
                                end
                                else viResultado := '';
                              end;
                            end
                            else
                            begin
                              if viVerificarValor then
                              begin
                                WptBackup := CarregarWptVirtual(WptBackup, vgQualificar.WptTextoMarcacao);
                                WptBackup.AsString := DeCompressString(dtmControles.SimpleAuxiliar.FieldByName(viCampo).AsString);

                                if vgQualificar.QualificarGramatica then
                                  Qualificar_GetGramatica(WptBackup); // Os campos de Qtd e Sexo ja est� preenchido.
                              end;
                            end;

                            {S� substitui o valor se n�o tiver grupo de mascara para ser qualificado}
                            VerificarExistenciaMascara;
                            if WptBackup <> nil then
                            begin
                              WptBackup.Free;
                              WptBackup := nil;
                            end;
                          end
                          else
                          begin
                            vgQualificar.WptTextoMarcacao.CPObj.Name := 'APAGAR';
                            vgQualificar.WptTextoMarcacao.BookmarkSelect(vgQualificar.WptTextoMarcacao.CPObj.Name, True);
                            vgQualificar.WptTextoMarcacao.BookmarkDelete('APAGAR',true, true);
                            viResultado := '';
                          end;
                        end;

           'g' : begin {Tipo Grupo de Mascara}
                   vgQualificar.WptTextoMarcacao.CPObj.Name := 'MASCARA';
                   vgQualificar.WptTextoMarcacao.BookmarkSelect(vgQualificar.WptTextoMarcacao.CPObj.Name, True);
                   inc(viCount);
                   {Qualifica a mascara}
                   Qualificar_DefinirMascara(viCount, viResultado);
                 end;

           'l' : begin {Tipo Lista}
                   viCount := 0;
                   viCampo := copy(vgQualificar.Palavra,Pos(';', vgQualificar.Palavra)+1,30);
                   viResultado := vgQualificar.StlLista.Values[viCampo];
                   {S� substitui o valor se n�o tiver grupo de mascara para ser qualificado}
                   VerificarExistenciaMascara;
                 end;

           'p' : begin {Tipo duplicar Valor - Pega todos os itens do Sql Montado}
                    viCount := 0;

                    {Pega os campos de pesquisa}
                    SepararCamposPesquisa;

                    if not viDuplicar then
                    begin
                      WptDuplicar := CarregarWptVirtual(WptDuplicar, vgQualificar.WptTextoMarcacao);
                      WptBackup   := CarregarWptVirtual(WptDuplicar, vgQualificar.WptTextoMarcacao);
                      WptBackup.SelectionAsString := vgQualificar.WptTextoMarcacao.AsString;
                      viDuplicar := true;

                      // Se for verdadeiro, significa que ja foi iniciado a duplica��o;
                      if  pos(';',viCondicaoSql) > 0 then
                      begin
                        viCampoIDDuplicar := copy(viCondicaoSql, pos(';',viCondicaoSql)+1,30);
                        if viCampoIDDuplicar = '#' then
                          viCampoIDDuplicar := '';
                      end;

                      if viCampoIDDuplicar <> '' then
                        viCampoIDDuplicar := ','+viCampoIDDuplicar;
                      vgQualificar.StlCampos.Add(copy(viCampoIDDuplicar,2,30)+'=0');
                    end;

                    ExecutaSimpleDSAux(' SELECT '+ viCampo+viCampoIDDuplicar+
                                       ' FROM  '+viTabela +
                                       ' WHERE '+viID +' = '+ vgQualificar.StlCampos.Values[viID] + ' '+
                                         copy(viCondicaoSql,1, pos(';',viCondicaoSql)-1), 0);
                    if i = 0 then
                    begin
                      if not dtmControles.SimpleAuxiliar.IsEmpty then
                        dtmControles.SimpleAuxiliar.RecNo := viDuplicarQtd+1;

                      // Armazena o valor do CampoDuplicarId. Para isso, retira a ',' adicionado na descricao do campo
                      if viCampoIDDuplicar <> '' then
                        vgQualificar.StlCampos.Values[copy(viCampoIDDuplicar,2,30)] := dtmControles.SimpleAuxiliar.FieldByName(copy(viCampoIDDuplicar,2,30)).AsString;

                      viDuplicarQtd  := dtmControles.SimpleAuxiliar.RecNo;
                      if viDuplicarQtd = 1 then
                        viSeparadorQtd := dtmControles.SimpleAuxiliar.RecordCount;
                      if pos(';#',viCondicaoSql) = 0 then
                        Delete(viCondicaoSql,1,pos(';',viCondicaoSql));
                    end;

                    vlDuplicarQtd := viDuplicarQtd;
                    viResultado := dtmControles.SimpleAuxiliar.FieldByName(viCampo).AsString;
                    {S� substitui o valor se n�o tiver grupo de mascara para ser qualificado}
                    VerificarExistenciaMascara;

                    dtmControles.SimpleAuxiliar.Next;
                    if i = 0  then
                      if dtmControles.SimpleAuxiliar.Eof then
                           viFlag := True
                      else viFlag := false;
                  end;
                end;
                if (i = vgQualificar.StlComplemento.Count - 1) and (viDuplicar) and (viSeparadorQtd = 1) then
                   InserirSeparador(vgQualificar.WptTextoMarcacao);
        end;
      until viFlag;
    except
      vgQualificar.WptTextoMarcacao.AsString := 'Erro!!! '+vpMarcacaoPrincipal;
      vgQualificacaoErro := 'Erro!!! ('+vpMarcacaoPrincipal+' - '+viPalavra+ ' - '+ viResultado+')';
      vgQualificacaoOK := False;
    end;

    // Verifica se houve duplica��o.
    if WptDuplicar <> nil then
    begin
      WptDuplicar.SelectionAsString := vgQualificar.WptTextoMarcacao.AsString;
      vgQualificar.WptTextoMarcacao.AsString := WptDuplicar.AsString;
      if viFlag then
      begin
        // Excluir o �ltimo ponto do texto (',', '.', ';')
        vgQualificar.WptTextoMarcacao.DeleteTrailingSpace(False);
        vgQualificar.WptTextoMarcacao.CPPosition := $FFFFF;
        vgQualificar.WptTextoMarcacao.InputString(#8);
      end;
    end;
  finally
     FreeAndNil(WptDuplicar);
     FreeAndNil(WptBackup);
  end;

  try
    vgQualificar.WptTextoMarcacao.BookmarkDeleteAllMarkers;
  except
    vgQualificar.WptTextoMarcacao.BookmarkDeleteAllMarkers;
  end;
  vgQualificar.WptTextoMarcacao.DeleteTrailingSpace(False);
  vgQualificar.WptAuxiliar.Clear;
  vgQualificar.WptAuxiliar.CurrAttr.Style := [];

  vgQualificar.WptAuxiliar.SelectionAsString := vgQualificar.WptTextoMarcacao.AsString;
end;

Function Qualificar_FormatarMascara(vpMarcacao, vpTipo, vpValor : string):String;
var
  viNomeDias: String;
  viAno, viDia : Double;
  viAnoExtenso, viAnoExtensoAux, viDiaExtenso, viMesExtenso, viHora, viMinuto, viAuxiliar, viValorLista : String;
  WptFormatar : TWPRichText;
  viCondicao, viCondicao2 : string;
  viListaCondicao : TStringList;
  i,viCont : Integer;
  viSomaValor  : Currency;
  viMaiusculoMinusculo, viArmazenar : Boolean;
  viValorNumerico : Array[1..5] of string;
  viValorLetra    : Array[1..5] of string;
  viValorCondicao : String;

  // Dados Pesquisa Sql e Condicao ELSE
  viTabela, viCampo, ViId : String;
  viTipoValor : String;

  procedure SepararCamposPesquisa(viPesquisa : string);
  begin
    // Separa os campos de pesquisa
    viTabela := copy(viPesquisa,1, Pos(';', viPesquisa)-1);
    delete(viPesquisa,1,Pos(';', viPesquisa));
    viCampo := copy(viPesquisa,1, Pos(';', viPesquisa)-1);
    delete(viPesquisa,1,Pos(';', viPesquisa));
    viID := viPesquisa;
    if viID = '' then
       viID  := copy(viTabela,3, 30)+'_ID'
  end;

begin
  WptFormatar := nil;
  try
    case vpTipo[1] of {Tipo Data}
      'd' : begin
              if (vpValor = '') then
              begin
                if vgQualificar.PreencherDataVazia then
                  vpValor := dtmControles.DataHoraBanco(4)
                else
                begin
                  Qualificar_FormatarMascara := '';
                  exit;
                end;
              end;

              // Se encontrar o "*", significa que o Dia, M�s e Ano por extenso devem ser a Primeira Letra em Mai�sculo
              viMaiusculoMinusculo := pos('*',vpMarcacao) > 0;
              if viMaiusculoMinusculo then
                vpMarcacao := copy(vpMarcacao, 1, Length(vpMarcacao)-1);

              viNomeDias   := 'dias';
              if copy(vpValor,1,2) = '01' then
              begin
                viNomeDias   := 'dia';
                viDiaExtenso := 'primeiro';
              end
              else
              begin
                // Dia em extenso
                viDia := StrToFloat(copy(vpValor,1,2));
                viDiaExtenso := trim(ValorExtenso(viDia, '', '', 4));
              end;

              // Converte o Ano para o Extenso
              viAno := StrToFloat(copy(vpValor,7,4));
              viAnoExtenso := trim(ValorExtenso(viAno, '', '', 4));
              if POS('VERIFICAR_ANO_1900',vgQualificar.CondicaoSql) > 0 then
                if pos('um mil', viAnoExtenso) > 0 then
                begin
                   viAnoExtenso := trim(copy(viAnoExtenso, 9, 150));
                   viAnoExtenso := 'mil '+ viAnoExtenso;
                end;

              // Converte Mes Extenso
              viMesExtenso := FormatDateTime('MMMM', StrToDateTime(vpValor));
              if POS('INICIAL_MAIOR',vgQualificar.CondicaoSql) > 0 then
              begin
                viDiaExtenso := MaiusculoMinusculo(trim(MaiusculoMinusculo(viDiaExtenso)));
                if pos(' e ', viDiaExtenso) > 0 then
                begin
                  viAuxiliar   := copy(viDiaExtenso, 0, pos(' e ', viDiaExtenso)-1);
                  viDiaExtenso := copy(viDiaExtenso, pos(' e ', viDiaExtenso)+1);
                  viDiaExtenso := Trim(LowerCase(viDiaExtenso));
                  viDiaExtenso := viAuxiliar + ' '+ viDiaExtenso;
                end;
              end;

              if viMaiusculoMinusculo then
              begin
                viDiaExtenso    := trim(MaiusculoMinusculo(viDiaExtenso));
                viMesExtenso    := trim(MaiusculoMinusculo(viMesExtenso));
                viAnoExtensoAux := viAnoExtenso;
                viAnoExtenso    := trim(UpCase(viAnoExtenso[1]) + copy(viAnoExtensoAux,2,70));
              end;

              vpMarcacao := LowerCase(vpMarcacao);
              if vpMarcacao = 'dataextenso' then
                Qualificar_FormatarMascara := viDiaExtenso + ' '+viNomeDias+' do m�s de ' +
                               FormatDateTime('MMMM', StrToDateTime(vpValor)) + ' do ano de ' + viAnoExtenso
              else
                if vpMarcacao = 'anoextenso' then
                  Qualificar_FormatarMascara := trim(viAnoExtenso)
              else
                if vpMarcacao = 'mesextenso' then
                  Qualificar_FormatarMascara := viMesExtenso
              else
                if vpMarcacao = 'diaextenso' then
                  Qualificar_FormatarMascara := viDiaExtenso + ' '+ viNomeDias
              else
                if vpMarcacao = 'diaextensosimples' then
                  Qualificar_FormatarMascara := viDiaExtenso
              else
                if vpMarcacao = 'anonumero' then
                  Qualificar_FormatarMascara := copy(vpValor,7,4)
              else
                if vpMarcacao = 'mesnumero' then
                  Qualificar_FormatarMascara := copy(vpValor,4,2)
              else
                if vpMarcacao = 'dianumero' then
                  Qualificar_FormatarMascara := copy(vpValor,1,2)
              else
                if vpMarcacao = 'diasnome' then
                  Qualificar_FormatarMascara := viNomeDias
              else
                if vpMarcacao = 'dataextensosimples' then
                  Qualificar_FormatarMascara := viDiaExtenso + ' de ' + FormatDateTime('MMMM', StrToDateTime(vpValor)) + ' de ' + viAnoExtenso
              else
                if vpMarcacao = 'datasimples' then
                  Qualificar_FormatarMascara := FormatDateTime('dd/mm/yyyy', StrToDateTime(vpValor));

            end;
      'v' : begin {Tipo valor}
              viCont := 0;
              viArmazenar := False;
              for i := 1 to Length(vpvalor) do
              begin
                if CharInSet(vpValor[i],['0'..'9',',']) then
                begin
                  if not viArmazenar then
                    inc(viCont);
                  viValorNumerico[viCont] := viValorNumerico[viCont] + vpValor[i];
                  viArmazenar := True;
                end
                else
                begin
                  if viArmazenar then
                  begin
                    inc(viCont);
                    viArmazenar := False;
                  end;
                  if viCont = 0 then
                    inc(viCont);
                  viValorNumerico[viCont] := viValorNumerico[viCont] + vpValor[i];
                end;
              end;

              if vpMarcacao = 'ValorExtenso' then
                Qualificar_FormatarMascara := trim(ValorExtenso(StrToFloat(viValorNumerico[1]), '', '', 3))
              else
                if vpMarcacao = 'ValorNumerico' then
                  Qualificar_FormatarMascara := FormatFloat(',#0.00', StrToFloat(viValorNumerico[1]))
              else
                if vpMarcacao = 'ValorTextoInteiro' then
                begin
                  viCont  := 1;
                  vpValor := '';
                  repeat
                    if CharInSet(viValorNumerico[viCont][1],['0'..'9']) then
                      vpValor := vpValor + trim(ValorExtenso(StrToFloat(viValorNumerico[viCont]), '', '', 4))
                    else
                      if CharInSet(viValorNumerico[viCont][1],['-','/']) then
                        vpValor := vpValor + viValorNumerico[viCont]
                      else
                        if viValorNumerico[viCont][1] = ' ' then
                             vpValor := vpValor + viValorNumerico[viCont]
                        else vpValor := vpValor + ' ' + viValorNumerico[viCont];
                    inc(viCont);
                  until viValorNumerico[viCont] = '';
                  Qualificar_FormatarMascara := vpValor;
                end
              else
                if vpMarcacao = 'ValorNumeroInteiro' then
                begin
                  viCont  := 1;
                  vpValor := '';
                  repeat
                    if CharInSet(viValorNumerico[viCont][1],['0'..'9']) then
                      vpValor := vpValor + viValorNumerico[viCont]
                    else
                      if CharInSet(viValorNumerico[viCont][1],['-','/']) then
                           vpValor := vpValor + viValorNumerico[viCont]
                      else vpValor := vpValor + viValorNumerico[viCont];
                    inc(viCont);
                  until viValorNumerico[viCont] = '';
                  Qualificar_FormatarMascara := vpValor
                end
              else
                if vpMarcacao = 'ValorRetornarNumero' then
                begin
                  vpValor := viValorNumerico[1];
                  Qualificar_FormatarMascara := vpValor;
                end
              else
                if vpMarcacao = 'ValorSomatorioLista' then
                begin
                  viSomaValor := StrToCurr(vpValor);
                  repeat
                    viCondicao  := '';
                    if vgQualificar.CondicaoSql <> '' then
                      viCondicao := Copy(vgQualificar.CondicaoSql, 1, pos('+', vgQualificar.CondicaoSql)-1);
                    vgQualificar.CondicaoSql := Copy(vgQualificar.CondicaoSql, pos('+', vgQualificar.CondicaoSql)+1, 200);

                    try
                      if viCondicao <> '' then
                      begin
                        viValorLista := vgQualificar.StlLista.Values[viCondicao];
                        viSomaValor  := viSomaValor + StrToCurr(viValorLista);
                      end;
                    except
                      viSomaValor := StrToCurr(vpValor);
                    end;
                  until viCondicao = '';
                  Qualificar_FormatarMascara := FormatFloat(',#0.00', viSomaValor);
                end;
            end;
      'f' : begin {Outros Tipos}
              if vpMarcacao = 'MaiusculoMinusculo' then
                Qualificar_FormatarMascara := MaiusculoMinusculo(vpValor)
              else
                if vpMarcacao = 'Minusculo' then
                  Qualificar_FormatarMascara := AnsiLowerCase(vpValor)
              else
                if vpMarcacao = 'Maiusculo' then
                  Qualificar_FormatarMascara := AnsiUpperCase(vpValor)
              else
                if (copy(vpMarcacao, 1,12) = 'MascaraFloat') or (copy(vpMarcacao, 1,12) = 'MascaraTexto') then
                begin
                  if copy(vpMarcacao, 1,12) = 'MascaraFloat' then
                       Qualificar_FormatarMascara := FormatFloat(copy(vpMarcacao, 14,30), StrToFloat(vpvalor))
                  else Qualificar_FormatarMascara := Trim(FormatMaskText(copy(vpMarcacao, 14,100), vpvalor));
                end
              else
                if vpMarcacao = 'Concordancia' then {Concordancia Gramatical Individual {As vari�veis vgQualificar.Qtd, vgQualificar.Sexo devem estar preenchidas}
                begin
                  WptFormatar := CarregarWptVirtual(WptFormatar, vgQualificar.WptTextoMarcacao);
                  try
                    WptFormatar.InputString(' ');
                    WptFormatar.InputHyperlink(vpvalor+'�d1�',vpvalor+'�d1�');
                    WptFormatar.SelectAll;
                    WptFormatar.CurrAttr.AddStyle ([afsProtected]);
                    Qualificar_Gramatica(WptFormatar, True);
                    Qualificar_FormatarMascara := WptFormatar.Text;
                  finally
                    WptFormatar.Free;
                  end;
               end
              else
                if vpMarcacao = 'Doi' then
                begin
                  if vgQualificar.StlLista.Values['CONSTAR_INFORMAR_DOI'] = 'S' then
                       Qualificar_FormatarMascara := dtmControles.BuscarConfig('ATO','QUALIFICACAO', 'TEXTO_DOI_SIM','T')
                  else Qualificar_FormatarMascara := dtmControles.BuscarConfig('ATO','QUALIFICACAO', 'TEXTO_DOI_NAO','T');
                end
              else
                if (vpMarcacao = 'LocalizarSubstituir') or (vpMarcacao = 'LocalizarSubstuituir') then
                begin
                  viCondicao  := copy(vgQualificar.CondicaoSql, 1, pos('*', vgQualificar.CondicaoSql)-1);
                  Delete(vgQualificar.CondicaoSql,1, pos('*', vgQualificar.CondicaoSql));
                  viCondicao2 := copy(vgQualificar.CondicaoSql, 1, pos('*', vgQualificar.CondicaoSql)-1);

                  viAuxiliar := '';
                  for i := 1 to Length(vpvalor) do
                  begin
                    if vpvalor[i] <> viCondicao then
                         viAuxiliar := viAuxiliar + vpvalor[i]
                    else viAuxiliar := viAuxiliar + viCondicao2;
                  end;
                  Qualificar_FormatarMascara := viAuxiliar;
                end
              else
                if vpMarcacao = 'Numerador' then
                  Qualificar_FormatarMascara := IntToStr(vlDuplicarQtd)
              else
                if (vpMarcacao = 'CondicaoVazio') then
                begin
                  if (vpValor = '') then
                       Qualificar_FormatarMascara := vgQualificar.CondicaoSql
                  else Qualificar_FormatarMascara := vpValor;
                end
              else
                if vpMarcacao = 'CondicaoDiferente' then
                begin
                  viCondicao := copy(vgQualificar.CondicaoSql, 1, pos('<>', vgQualificar.CondicaoSql)-1);
                  if viCondicao <> vpValor then
                    Qualificar_FormatarMascara := copy(vgQualificar.CondicaoSql, pos('<>', vgQualificar.CondicaoSql)+2, 90);
                end
              else
                if vpMarcacao = 'CondicaoDiferenteIgual' then
                begin
                  viCondicao := copy(vgQualificar.CondicaoSql, 1, pos('<>', vgQualificar.CondicaoSql)-1);
                  if viCondicao <> vpValor then
                       Qualificar_FormatarMascara := copy(vgQualificar.CondicaoSql, pos('<>', vgQualificar.CondicaoSql)+2, (pos('=', vgQualificar.CondicaoSql)-1))
                  else Qualificar_FormatarMascara := copy(vgQualificar.CondicaoSql, pos('=', vgQualificar.CondicaoSql)+1, 100);
                end
              else
                if vpMarcacao = 'Condicao' then
                begin
                  if vpValor <> '' then
                  begin
                    if pos('ConcatenarAntes', vpMarcacao) > 0 then
                      Qualificar_FormatarMascara := copy(vpMarcacao, 17,30) + vpvalor
                    else
                    begin
                      if pos('>0', vgQualificar.CondicaoSql) > 0 then
                      begin
                        if vpValor = '0' then
                          Qualificar_FormatarMascara := ''
                        else
                        begin
                          viCondicao  := copy(vgQualificar.CondicaoSql, 1, pos('*', vgQualificar.CondicaoSql)-1);
                          Delete(vgQualificar.CondicaoSql,1, pos('*', vgQualificar.CondicaoSql));
                          viCondicao2 := copy(vgQualificar.CondicaoSql, 1, pos('*', vgQualificar.CondicaoSql)-1);

                          if viCondicao = '>0' then
                               Qualificar_FormatarMascara := vpValor + viCondicao2
                          else Qualificar_FormatarMascara := viCondicao+vpValor;
                        end;
                      end
                      else
                      begin
                        viListaCondicao := TStringList.Create;
                        try
                          viValorCondicao := '';
                          viTipoValor     := 'S';
                          repeat
                            viCondicao := copy(vgQualificar.CondicaoSql, 1, pos('*', vgQualificar.CondicaoSql)-1);

                            if pos('ELSE', viCondicao) > 0 then
                            begin
                              viTipoValor     := copy(vgQualificar.CondicaoSql, pos('=', vgQualificar.CondicaoSql)-1,1);
                              viValorCondicao := copy(vgQualificar.CondicaoSql, pos('=', vgQualificar.CondicaoSql)+1,100);
                              viValorCondicao := copy(viValorCondicao, 1, pos('*', viValorCondicao)-1);
                              if pos(';', viValorCondicao) > 0 then
                              begin
                                SepararCamposPesquisa(viValorCondicao);
                                ExecutaSimpleDSAux(' SELECT '+viCampo+
                                                   ' FROM '+viTabela +
                                                   ' WHERE '+viID +' = '+ vgQualificar.StlCampos.Values[viID],0);

                                viValorCondicao := dtmControles.SimpleAuxiliar.FieldByName(viCampo).AsString;
                              end;
                            end
                            else viListaCondicao.Add(viCondicao);
                            Delete(vgQualificar.CondicaoSql,1, pos('*', vgQualificar.CondicaoSql));
                          until vgQualificar.CondicaoSql = '';

                          if (vpValor <> '') and (viListaCondicao.Values[vpValor] <> '') then
                          begin
                            if viTipoValor = 'S' then
                                 Qualificar_FormatarMascara := viListaCondicao.Values[vpValor]
                            else Qualificar_FormatarMascara := FormatFloat(',#0.00', StrToFloat(viListaCondicao.Values[vpValor]));
                          end
                          else
                            if viValorCondicao <> '' then
                            begin
                              if viTipoValor = 'S' then
                                   Qualificar_FormatarMascara := viValorCondicao
                              else Qualificar_FormatarMascara := FormatFloat(',#0.00', StrToFloat(viValorCondicao));
                            end;
                        finally
                          FreeAndNil(viListaCondicao);
                        end;
                        end;
                    end;
                  end;
                end
              else
                if vpMarcacao = 'EstadoExtenso' then
                  Qualificar_FormatarMascara := RetornarEstadoExtenso(vpValor)
              else
                if vpMarcacao = 'CPFCNPJ' then
                begin
                  if Length(vpValor) > 11 then
                       Qualificar_FormatarMascara := FormataCNPJ(vpValor)
                  else Qualificar_FormatarMascara := FormataCPF(vpValor);
                end
              else
                if vpMarcacao = 'CPFCNPJCondicaoAntes' then
                begin
                  if Length(vpValor) > 11 then
                  begin
                    viValorCondicao := copy(vgQualificar.CondicaoSql, pos('CNPJ=', vgQualificar.CondicaoSql)+5,100);
                    Qualificar_FormatarMascara := viValorCondicao+FormataCNPJ(vpValor);
                  end
                  else
                  begin
                    viValorCondicao := copy(vgQualificar.CondicaoSql, pos('CPF=', vgQualificar.CondicaoSql)+4,pos('*', vgQualificar.CondicaoSql)-4);
                    Qualificar_FormatarMascara := viValorCondicao+FormataCPF(vpValor);
                  end;
                end
              else
                if vpMarcacao = 'IdadeAno' then
                  Qualificar_FormatarMascara := IdadeCerta(strtodate(vpValor), dtmControles.DataHoraBanco(4), True)
              else
                if copy(vpMarcacao, 1,15) = 'ConcatenarAntes' then
                begin
                  if (vpValor <> '') then
                    Qualificar_FormatarMascara := trim(copy(vpMarcacao, 17,30) + vpvalor);
                end;
            end;
      'h' : begin
              if vpMarcacao = 'HoraMinuto' then
                Qualificar_FormatarMascara := FormatDateTime('HH:MM', StrToDateTime(vpValor))
              else
                if vpMarcacao = 'HoraMinutoSegundo' then
                  Qualificar_FormatarMascara := FormatDateTime('HH:MM:SS', StrToDateTime(vpValor))
              else
                if vpMarcacao = 'HoraMinutoTextoSimples' then
                begin
                  viHora := FormatDateTime('HH', StrToDateTime(vpValor));
                  viMinuto := copy(FormatDateTime('HH:MM', StrToDateTime(vpValor)),4,2);
                  Qualificar_FormatarMascara := viHora+'h '+viMinuto+'min';
                end
              else
                if vpMarcacao = 'HoraMinutoTexto' then
                begin
                  viHora := FormatDateTime('HH', StrToDateTime(vpValor));
                  if viHora = '00' then
                       viHora := 'zero'
                  else viHora := trim(ValorExtenso(StrToFloat(viHora), '', '', 4));
                  viMinuto := copy(FormatDateTime('HH:MM', StrToDateTime(vpValor)),4,2);

                  if viMinuto = '00' then
                    Qualificar_FormatarMascara := viHora+' horas'
                  else
                  begin
                    viMinuto := trim(ValorExtenso(StrToFloat(viMinuto), '', '', 4));
                    Qualificar_FormatarMascara := viHora+' horas e '+viMinuto+' minutos'
                  end;
                end
            end;
    end;
  except
    Qualificar_FormatarMascara := 'Erro!!! ('+vpTipo+' - '+vpMarcacao+ ' - '+ vpValor+')';
    vgQualificacaoErro := 'Erro!!! ('+vpTipo+' - '+vpMarcacao+ ' - '+ vpValor+')';
    vgQualificacaoOK := False;
  end;
end;

procedure Qualificar_FixoTabelionato(vpWptAux : TWPRichText; vpListaFixa : TStringList);
var
  i : integer;
  viWptBackup : TWPRichText;
  viLista : TStringList;
  viOrdemQualificaAuxiliar, viAtoId, viPedidoId, viCondicaoSql : String;
  viPreencherDataVazia : Boolean;
  VincSeparador : array[1..3] of string;

  procedure QualificarAuxiliarAto;
  var
    viQtd, i : Integer;

    Procedure VerificarQtdTipoParte;
    begin
      ExecutaSimpleDSAux(' SELECT  DISTINCT(VP.ATO_PARTETIPO_ID) '+
                         ' FROM T_ATO_VINCULOPARTE VP '+
                         '   LEFT OUTER JOIN T_ATO_PARTETIPO PT ON '+
                         '   VP.ATO_PARTETIPO_ID = PT.ATO_PARTETIPO_ID '+
                         ' WHERE VP.ATO_ID = '+ vgQualificar.StlCampos.Values['ATO_ID']+
//                         ' AND (PT.AUTO_QUALIFICA = ''S'') OR (PT.AUTO_QUALIFICA = ''A'')'+
                         ' AND (PT.AUTO_QUALIFICA = ''S'') '+
                         ' AND VP.TIPO_VINCULO = ''3'''+
                         ' ORDER BY VP.TIPO_VINCULO, VP.ORDEM',0);
      viQtd := dtmControles.SimpleAuxiliar.RecordCount;
    end;

  begin
    if vgQualificar.AuxAtoAposParte = 'S' then
    begin
      viWptBackup          := CarregarWptVirtual(viWptBackup, vgQualificar.WptAuxiliar);
      viWptBackup.AsString := vgQualificar.WptAuxiliar.AsString;
      vgQualificar.Palavra := 'QUALIFICACAO?AUXILIAR?ATO';
      VerificarQtdTipoParte;

      for i := 1 to viQtd do
      begin
        if i > 1 then
        begin
          VerificarQtdTipoParte;
          vgQualificar.Palavra := 'QUALIFICACAO?AUXILIAR?ATO';
        end;

        dtmControles.SimpleAuxiliar.RecNo := i;
        Qualificar_Partes('3', dtmControles.SimpleAuxiliar.FieldByName('ATO_PARTETIPO_ID').AsString);
        viWptBackup.CPPosition := $FFFFF;
        viWptBackup.SelectionAsString     := vgQualificar.WptAuxiliar.AsString;
        vgQualificar.WptAuxiliar.AsString := viWptBackup.AsString;
      end;
      viWptBackup.Free;
    end;
  end;

  procedure QualificarCNB;
  var
    viTipoCNB, viQtd: Integer;
    viWptBackup : TWPRichText;
  begin
    Screen.Cursor := crHourGlass;
    viTipoCNB := 2;
    viWptBackup := CarregarWptVirtual(viWptBackup, vgQualificar.WptAuxiliar);
    try
      repeat
        viQtd := dtmControles.GetInt(' SELECT COUNT(ATO_ID) AS QTD FROM T_ATO_VINCULOPARTE '+
                                     ' WHERE ATO_ID = '+ viAtoId+
                                     '  AND (TIPO_VINCULO = '+QuotedStr('1') +' OR TIPO_VINCULO = '+QuotedStr('0')+')'+
                                     '  AND CNB_SITUACAO = '+QuotedStr(IntToStr(viTipoCNB)));

        if viQtd > 0 then
        begin
          if viWptBackup.AsString <> '' then
            viWptBackup.SelectionAsString := '; ';

          ExecutaSqlAuxiliar(' SELECT TEXTO '+
                             ' FROM G_MARCACAO_TIPO '+
                             ' WHERE NOME = '+ QuotedStr(TrocaCharPorAsci('CNB?QUALIFICACAO?'+IntToStr(viTipoCNB)))+
                             '   AND SISTEMA_ID = '+ IntToStr(vgId),0);

          viWptBackup.SelectionAsString := DeCompressString(dtmControles.sqlAuxiliar.FieldByName('TEXTO').AsString);
          Marcacao_RetirarProtecao(viWptBackup, true);
          viWptBackup.HideSelection;
        end;
        Dec(viTipoCNB);
      until viTipoCNB = 0;

      {Preenche as Id's das Tabelas de qualifica��o}
      if vgQualificar.StlCampos <> nil then
        FreeAndNil(vgQualificar.StlCampos);

      if vgQualificar.StlPrincipal <> nil then
        FreeAndNil(vgQualificar.StlPrincipal);

      vgQualificar.StlCampos := TStringList.Create;
      vgQualificar.StlCampos.Add('ATO_ID='+viAtoId);
      vgQualificar.StlPrincipal := Qualificar_SelecionarMarcacao('a',viWptBackup);
      Qualificar_Iniciar(viWptBackup, 'L');
    finally
      FreeAndNil(viWptBackup);
    end;
  end;

  procedure QualificarSelosCaucaiaAto(vpTabela, vpId, vpNomeCPTabela, vpNomeCPCampo : String);
  var
    viWptArmazena, viWptTexto, viWptQualifica : TWPRichText;
    viQtdGrupoSelo : array[1..3, 1..2] of string;
    viSql : String;
    i, viQtd : Integer;
  begin
    Screen.Cursor  := crHourGlass;
    viWptTexto     := CarregarWptVirtual(viWptBackup, vgQualificar.WptAuxiliar);
    viWptArmazena  := CarregarWptVirtual(viWptBackup, vgQualificar.WptAuxiliar);
    viWptQualifica := CarregarWptVirtual(viWptBackup, vgQualificar.WptAuxiliar);

    viSql := ' SELECT '+
             '        SG.SELO_GRUPO_ID, '+
             '        LIST (SL.SIGLA || CAST (SL.NUMERO AS INTEGER) || CASE WHEN SL.VALIDADOR IS NULL THEN '''' ELSE ''-'' END || COALESCE (SL.VALIDADOR, ''''), '', '') AS SELOS '+
             ' FROM G_SELO_LIVRO SL '+
             '   LEFT OUTER JOIN G_SELO_LOTE ST ON '+
             '   ST.SELO_LOTE_ID = SL.SELO_LOTE_ID '+
             '   LEFT OUTER JOIN G_SELO_GRUPO SG ON '+
             '   ST.SELO_GRUPO_ID = SG.SELO_GRUPO_ID '+
             ' WHERE SL.'+vpNomeCPTabela+' = '+QuotedStr(vpTabela)+
             '   AND SL.'+vpNomeCPCampo+' = '+vpId+
             ' GROUP BY SG.SELO_GRUPO_ID ';

    ExecutaSqlAuxiliar(viSql,0);
    viQtd := dtmControles.sqlAuxiliar.RecordCount;
    for i := 1 to viQtd do
    begin
      viQtdGrupoSelo[i,1] := dtmControles.sqlAuxiliar.FieldByName('SELO_GRUPO_ID').AsString;
      viQtdGrupoSelo[i,2] := dtmControles.sqlAuxiliar.FieldByName('SELOS').AsString;
      dtmControles.sqlAuxiliar.Next;
    end;
    dtmControles.sqlAuxiliar.Close;

    ExecutaSqlAuxiliar(' SELECT TEXTO '+
                       ' FROM G_MARCACAO_TIPO '+
                       ' WHERE NOME = '+ QuotedStr(TrocaCharPorAsci('SELOS?QUALIFICACAO?CAUCAIA'))+
                       '   AND SISTEMA_ID = '+ IntToStr(vgId),0);
    viWptTexto.SelectionAsString := DeCompressString(dtmControles.sqlAuxiliar.FieldByName('TEXTO').AsString);
    Marcacao_RetirarProtecao(viWptTexto, true);
    viWptTexto.HideSelection;

    if vgQualificar.StlCampos <> nil then
      FreeAndNil(vgQualificar.StlCampos);

    if vgQualificar.StlLista <> nil then
      FreeAndNil(vgQualificar.StlLista);

    vgQualificar.StlCampos := TStringList.Create;
    vgQualificar.StlLista  := TStringList.Create;

    for i := 1 to viQtd do
    begin
      vgQualificar.StlCampos.Clear;
      vgQualificar.StlLista.Clear;

      viWptQualifica.AsString := viWptTexto.AsString;
      vgQualificar.StlCampos.Add('SELO_GRUPO_ID='+viQtdGrupoSelo[i,1]);
      vgQualificar.StlLista.Add('SELO_AGRUPADOR=' +viQtdGrupoSelo[i,2]);

      vgQualificar.StlPrincipal := Qualificar_SelecionarMarcacao('a',viWptQualifica);
      Qualificar_Iniciar(viWptQualifica, 'L');

      viWptArmazena.SelectionAsString := viWptQualifica.AsString;
    end;

    vgQualificar.WptAuxiliar.Clear;
    vgQualificar.WptAuxiliar.AsString := viWptArmazena.AsString;
    vgQualificar.WptAuxiliar.DeleteTrailingSpace(true);

    FreeAndNil(viWptTexto);
    FreeAndNil(viWptQualifica);
    FreeAndNil(viWptArmazena);
  end;

  procedure QualificarProprietarioImovel;
  var
    viQtd, i: Integer;
    viWptBackup, viWptQualifica, viWptArmazena : TWPRichText;

    procedure CarregarValores;
    begin
      with dtmControles.SimpleAuxiliar do
      begin
        if i = 1 then
        begin
          {Preenche as Id's das Tabelas de qualifica��o}
          vgQualificar.StlCampos.Add('PESSOA_VINCULO_ID='+FieldByName('PESSOA_VINCULO_ID').AsString);
          vgQualificar.StlCampos.Add('PESSOA_ID='+FieldByName('PESSOA_ID').AsString);
          vgQualificar.StlCampos.Add('TB_ESTADOCIVIL_ID='+FieldByName('TB_ESTADOCIVIL_ID').AsString);
          vgQualificar.StlCampos.Add('TB_PROFISSAO_ID='+FieldByName('TB_PROFISSAO_ID').AsString);
          vgQualificar.StlCampos.Add('TB_REGIMECOMUNHAO_ID='+FieldByName('TB_REGIMECOMUNHAO_ID').AsString);
          vgQualificar.StlCampos.Add('TB_TIPO_VINCULO_ID='+FieldByName('TB_TIPO_VINCULO_ID').AsString);
        end
        else
        begin
          {Preenche as Id's das Tabelas de qualifica��o}
          vgQualificar.StlCampos.Values['PESSOA_VINCULO_ID']    := FieldByName('PESSOA_VINCULO_ID').AsString;
          vgQualificar.StlCampos.Values['PESSOA_ID']            := FieldByName('PESSOA_ID').AsString;
          vgQualificar.StlCampos.Values['TB_ESTADOCIVIL_ID']    := FieldByName('TB_ESTADOCIVIL_ID').AsString;
          vgQualificar.StlCampos.Values['TB_PROFISSAO_ID']      := FieldByName('TB_PROFISSAO_ID').AsString;
          vgQualificar.StlCampos.Values['TB_REGIMECOMUNHAO_ID']  := FieldByName('TB_REGIMECOMUNHAO_ID').AsString;
          vgQualificar.StlCampos.Values['TB_TIPO_VINCULO_ID']    := FieldByName('TB_TIPO_VINCULO_ID').AsString;
        end;
      end;
    end;

    procedure BuscarParte;
    begin
      ExecutaSimpleDSAux(' SELECT PESSOA_VINCULO_ID, PESSOA_ID, TB_ESTADOCIVIL_ID, '+
                         '        TB_PROFISSAO_ID, TB_REGIMECOMUNHAO_ID, TB_TIPO_VINCULO_ID '+
                         ' FROM R_PESSOA_VINCULO '+
                         ' WHERE IMOVEL_ID = '+vgQualificar.StlCampos.Values['IMOVEL_ID']+' '+viCondicaoSql,0);
    end;

  begin
    Screen.Cursor  := crHourGlass;
    viWptBackup    := TWPRichText.Create(nil);
    viWptQualifica := TWPRichText.Create(nil);
    viWptArmazena  := TWPRichText.Create(nil);

    // Buscar Modelo de Qualifi��o
    ExecutaSqlAuxiliar(' SELECT TEXTO FROM G_MARCACAO_TIPO '+
                       ' WHERE NOME = '+QuotedStr('QUALIFICACAO�PROPRIETARIO�1')+
                       '   AND SISTEMA_ID = 1', 0);
    viWptBackup.AsString := DeCompressString(dtmControles.sqlAuxiliar.FieldByName('TEXTO').AsString);
    dtmControles.sqlAuxiliar.Close;
    vgQualificar.WptAuxiliar.Clear;

    viCondicaoSql := vgQualificar.CondicaoSql;
    BuscarParte;
    viQtd := dtmControles.SimpleAuxiliar.RecordCount;

    for i := 1 to 3 do
      VincSeparador[i] := vgQualificar.VincSeparador[i];

    for i := 1 to viQtd do
    begin
      if i > 1 then
      begin
         BuscarParte;
         dtmControles.SimpleAuxiliar.RecNo := i;
       end;

      CarregarValores;
      viWptQualifica.Clear;
      viWptQualifica.AsString := viWptBackup.AsString;

      if vgQualificar.StlPrincipal <> nil then
        FreeAndNil(vgQualificar.StlPrincipal);
      vgQualificar.StlPrincipal := Qualificar_SelecionarMarcacao('a',viWptQualifica);

      Qualificar_Iniciar(viWptQualifica, 'L');
      viWptArmazena.SelectionAsString := viWptQualifica.AsString;
      viWptArmazena.DeleteTrailingSpace(True);

      if ((i+1) = viQtd) then
        viWptArmazena.InputString(VincSeparador[2]+ ' ')
      else
        if i = viQtd then
             viWptArmazena.InputString(VincSeparador[3])
        else viWptArmazena.InputString(VincSeparador[1]+ ' ');
      viWptArmazena.CPPosition := $FFFFF;
    end;

    vgQualificar.WptAuxiliar.Clear;
    vgQualificar.WptAuxiliar.AsString := viWptArmazena.AsString;
    vgQualificar.WptAuxiliar.DeleteTrailingSpace(true);
    dtmControles.SimpleAuxiliar.Close;

    FreeAndNil(viWptQualifica);
    FreeAndNil(viWptBackup);
    FreeAndNil(viWptArmazena);
  end;

  {$REGION 'Qualificar_DocumentoCivil_Modelo1_Grid'}
  procedure Qualificar_DocumentoCivil_Modelo1_Grid;
  var
    viWptBackup, viWptQualifica, viWptArmazena : TWPRichText;
    viModelo, viCab, viTitulo : String;
    viQtd : integer;
    viDocQualifica : array[1..10,1..3] of string;

    procedure BuscarDocumentosCertidao(vpTituloEleitor : Boolean = False);
    var
      viSql : String;
      i : Integer;
    begin
      viSql := ' SELECT D.DOCUMENTO_ID, D.TB_TIPODOCUMENTO_ID, D.MUNICIPIO_ID '+
               ' FROM V_DOCUMENTO D '+
               '   LEFT OUTER JOIN V_TB_TIPODOCUMENTO TD ON '+
               '   D.TB_TIPODOCUMENTO_ID = TD.TB_TIPODOCUMENTO_ID '+
               ' WHERE D.REGISTRO_ID = '+ vgQualificar.StlCampos.Values['REGISTRO_ID']+
               '   AND D.LIVRO_NATUREZA_ID = '+ vgQualificar.StlCampos.Values['LIVRO_NATUREZA_ID']+
               '   AND TD.DOCUMENTO_CERTIDAO = '+QuotedStr('S');
      if vpTituloEleitor then
           viSql := viSql + '   AND TD.TITULO_ELEITOR = '+QuotedStr('S')
      else viSql := viSql + '   AND (TD.TITULO_ELEITOR = '+QuotedStr('N') + ' OR TD.TITULO_ELEITOR IS NULL)';
      ExecutaSimpleDSAux(viSql,0);

      viQtd := dtmControles.SimpleAuxiliar.RecordCount;
      for i := 1 to viQtd do
      begin
        viDocQualifica[i,1] := dtmControles.SimpleAuxiliar.FieldByName('DOCUMENTO_ID').AsString;
        viDocQualifica[i,2] := dtmControles.SimpleAuxiliar.FieldByName('TB_TIPODOCUMENTO_ID').AsString;
        viDocQualifica[i,3] := dtmControles.SimpleAuxiliar.FieldByName('MUNICIPIO_ID').AsString;
        dtmControles.SimpleAuxiliar.Next;
      end;
      dtmControles.SimpleAuxiliar.Active := False;
    end;

    procedure QualificarDocumentos(vpModelo : string);
    var
      i : Integer;
    begin
      BuscarDocumentosCertidao(vpModelo = '2');
      if viQtd = 0 then
        viWptArmazena.SelectionAsString := ' '
      else
      begin
        viWptBackup    := TWPRichText.Create(nil);
        viWptQualifica := TWPRichText.Create(nil);

        try
          viTitulo := 'QUALIFICA�DOC�CIVIL�TIT�'+vpModelo;
          viCab    := 'QUALIFICA�DOC�CIVIL�CAB�'+vpModelo;
          viModelo := 'QUALIFICA�DOC�CIVIL�MOD�'+vpModelo;

          // Inserir o Titulo da Grid
          ExecutaSqlAuxiliar(' SELECT TEXTO FROM G_MARCACAO_TIPO '+
                             ' WHERE NOME = '+QuotedStr(viTitulo)+
                             '   AND SISTEMA_ID = '+ IntToStr(vgId),0);
          viWptArmazena.SelectionAsString   := DeCompressString(dtmControles.sqlAuxiliar.FieldByName('TEXTO').AsString);
          viWptArmazena.CPPosition := $FFFFF;
          dtmControles.sqlAuxiliar.Close;

          // Inserir o Cabe�alho da Grid
          ExecutaSqlAuxiliar(' SELECT TEXTO FROM G_MARCACAO_TIPO '+
                             ' WHERE NOME = '+QuotedStr(viCab)+
                             '   AND SISTEMA_ID = '+ IntToStr(vgId),0);
          viWptArmazena.SelectionAsString   := DeCompressString(dtmControles.sqlAuxiliar.FieldByName('TEXTO').AsString);
          viWptArmazena.CPPosition := $FFFFF;
          dtmControles.sqlAuxiliar.Close;

          // Inserir o Modelo da Grid
          ExecutaSqlAuxiliar(' SELECT TEXTO FROM G_MARCACAO_TIPO '+
                             ' WHERE NOME = '+QuotedStr(viModelo)+
                             '   AND SISTEMA_ID = '+ IntToStr(vgId),0);
          viWptBackup.AsString := DeCompressString(dtmControles.sqlAuxiliar.FieldByName('TEXTO').AsString);
          dtmControles.sqlAuxiliar.Close;

          for i := 1 to viQtd do
          begin
            viWptQualifica.Clear;
            viWptQualifica.AsString := viWptBackup.AsString;
            vgQualificar.StlCampos.Values['DOCUMENTO_ID'] := viDocQualifica[i,1];
            vgQualificar.StlCampos.Values['TB_TIPODOCUMENTO_ID'] := viDocQualifica[i,2];
            vgQualificar.StlCampos.Values['MUNICIPIO_ID'] := viDocQualifica[i,3];

            if vgQualificar.StlPrincipal <> nil then
              FreeAndNil(vgQualificar.StlPrincipal);
            vgQualificar.StlPrincipal := Qualificar_SelecionarMarcacao('a',viWptQualifica);

            Qualificar_Iniciar(viWptQualifica, 'L');
            viWptArmazena.SelectionAsString := viWptQualifica.AsString;
            viWptArmazena.CPPosition := $FFFFF;
          end;
        finally
          FreeAndNil(viWptQualifica);
          FreeAndNil(viWptBackup);
        end;
      end;
    end;

  begin
    vgQualificar.WptAuxiliar.Clear;
    viWptArmazena  := TWPRichText.Create(nil);
    QualificarDocumentos('1');
    QualificarDocumentos('2');
    vgQualificar.WptAuxiliar.Clear;
    vgQualificar.WptAuxiliar.SelectionAsString := viWptArmazena.AsString;
    FreeAndNil(viWptArmazena);
  end;
  {$ENDREGION}

  {$REGION 'Qualificar_DocumentoNotas'}
  procedure Qualificar_DocumentoNotas;
  var
    viWptArmazena : TWPRichText;
    viSegDocPrimeiro : Boolean;

    procedure QualificaDocumento(vpMarcacao, vpComplemento : String);
    begin
      ExecutaSqlAuxiliar(' SELECT TEXTO FROM G_MARCACAO_TIPO '+
                         ' WHERE NOME = '+QuotedStr('MODELO1')+
                         '   AND SISTEMA_ID = '+ IntToStr(vgId),0);

      vgQualificar.WptAuxiliar.AsString := DeCompressString(dtmControles.sqlAuxiliar.FieldByName('TEXTO').AsString);
      dtmControles.sqlAuxiliar.Close;
      Qualificar_Iniciar(vgQualificar.WptAuxiliar, 'L');
      if vpComplemento <> '' then
        viWptArmazena.SelectionAsString := ', '+ vpComplemento;
      viWptArmazena.SelectionAsString := vgQualificar.WptAuxiliar.AsString;
      viWptArmazena.CPPosition := $FFFFF;
    end;

  begin
    vgQualificar.WptAuxiliar.Clear;
    viWptArmazena  := TWPRichText.Create(nil);

    viSegDocPrimeiro := dtmControles.GetInt('SELECT SEG_DOCUMENTO_ID FROM T_PESSOA WHERE PESSOA_ID '+vgQualificar.StlCampos.Values['PESSOA_ID']) > 0;
    if viSegDocPrimeiro then
    begin
      QualificaDocumento('SEGUNDO�DOC�P', '');
      QualificaDocumento('PRIMEIRO�DOC�P', 'onde conta a C�dula de Identidade n� ');
    end
    else QualificaDocumento('DOCUMENTO','');

    vgQualificar.WptAuxiliar.Clear;
    vgQualificar.WptAuxiliar.SelectionAsString := viWptArmazena.AsString;
    FreeAndNil(viWptArmazena);
  end;
  {$ENDREGION}

  {$REGION 'Qualificar_AssinaturaIndividual'}
  procedure Qualificar_AssinaturaIndividual;
  var
    viAtoId, viDadosSql, viSexo: String;
    viWptAuxiliar, viWptQualificacao : TWPRichText;
    viQtd, viPosicao : Integer;

    procedure CarregarPartesAssinantes(vpId : Integer);
    var
      viSql : String;
    begin
      viSql := ' SELECT VP.ATO_VINCULOPARTE_ID, VP.PESSOA_NOME, PT.DESCRICAO AS PARTE_TIPO, P.SEXO,  '+
               '        T2.DADOS_ASSINATURA '+
               '  FROM T_ATO_VINCULOPARTE VP '+
               '    LEFT OUTER JOIN T_ATO_PARTETIPO PT ON '+
               '    VP.ato_partetipo_id = PT.ato_partetipo_id '+
               '    LEFT OUTER JOIN T_PESSOA P ON '+
               '    VP.pessoa_id = P.pessoa_id '+

               '    LEFT JOIN '+
               '      (SELECT (VP2.PESSOA_NOME ||'',''||PT2.DESCRICAO ||'',''|| P2.SEXO) AS DADOS_ASSINATURA, AUXILIAR_ID '+
               '      FROM T_ATO_VINCULOPARTE VP2 '+
               '      LEFT OUTER JOIN T_ATO_PARTETIPO PT2 ON '+
               '      VP2.ato_partetipo_id = PT2.ato_partetipo_id '+
               '      LEFT OUTER JOIN T_PESSOA P2 ON '+
               '      VP2.pessoa_id = P2.pessoa_id) T2 ON '+
               '      T2.AUXILIAR_ID = VP.ato_vinculoparte_id or '+
               '      T2.AUXILIAR_ID = VP.auxiliar_assinatura_id '+
               ' WHERE ATO_ID = '+viAtoId +
               '   AND NOT VP.assinatura_tipo = ''4'''+
               '   AND NOT VP.TIPO_VINCULO = ''4'''+
               ' ORDER BY VP.TIPO_VINCULO, VP.ORDEM ';

      ExecutaSimpleDSAux(viSql,0);
      if vpId = 0 then
        viQtd := dtmControles.SimpleAuxiliar.RecordCount
      else
        dtmControles.SimpleAuxiliar.RecNo := vpId;
    end;

    procedure BuscarMarcacao(vpMarcacao : String);
    begin
      viWptAuxiliar.Clear;
      ExecutaSqlAuxiliar(' SELECT TEXTO FROM G_MARCACAO_TIPO '+
                         ' WHERE NOME = '+QuotedStr(vpMarcacao)+
                         '   AND SISTEMA_ID = '+ IntToStr(vgId),0);
      viWptAuxiliar.AsString := DeCompressString(dtmControles.sqlAuxiliar.FieldByName('TEXTO').AsString);
    end;

    function MontarComplemento(vpTipo : integer):String;
    var
      viComplemento : String;

      function RetornarQualificacaoSexo(vpPalavra, vpSexo : String):String;
      begin
        ExecutaSqlAuxiliar('SELECT * FROM G_GRAMATICA WHERE PALAVRA ='+ QuotedStr(vpPalavra),0);

        if vpSexo = 'M' then
             Result := dtmControles.sqlAuxiliar.FieldByName('PREFIXO').Asstring + dtmControles.sqlAuxiliar.FieldByName('SUFIXO_MS').Asstring
        else Result := dtmControles.sqlAuxiliar.FieldByName('PREFIXO').Asstring + dtmControles.sqlAuxiliar.FieldByName('SUFIXO_FS').Asstring;
        dtmControles.sqlAuxiliar.Close;
      end;

      procedure ComplementoQualificacao;
      begin
        viSexo := dtmControles.SimpleAuxiliar.FieldByName('SEXO').AsString;
        if viSexo = 'M' then
             viComplemento := viComplemento + ' do '
        else viComplemento := viComplemento + ' da ';

        viComplemento := viComplemento + MaiusculoMinusculo(RetornarQualificacaoSexo(dtmControles.SimpleAuxiliar.FieldByName('PARTE_TIPO').AsString,viSexo))+
                         ' '+ dtmControles.SimpleAuxiliar.FieldByName('PESSOA_NOME').AsString;
      end;

    begin
      case vpTipo of
        1 : viComplemento := MaiusculoMinusculo(RetornarQualificacaoSexo(dtmControles.SimpleAuxiliar.FieldByName('PARTE_TIPO').AsString,
                                                   dtmControles.SimpleAuxiliar.FieldByName('SEXO').AsString));
        2 : begin
               viComplemento := RetornarValorListaString(viDadosSql,',');
               if viComplemento = 'ASSINA A ROGO' then
                 viComplemento := 'Assinante a Rogo'
               else
               begin
                 viSexo        := RetornarValorListaString(viDadosSql,',');
                 viComplemento := MaiusculoMinusculo(RetornarQualificacaoSexo(viComplemento,viSexo));
               end;
               ComplementoQualificacao;
            end;
      end;
      Result := viComplemento;
    end;

    procedure Qualificar;
    begin
      if vgQualificar.StlPrincipal <> nil then
        FreeAndNil(vgQualificar.StlPrincipal);
      vgQualificar.StlPrincipal := Qualificar_SelecionarMarcacao('a', viWptAuxiliar);

      Qualificar_Iniciar(viWptAuxiliar, 'L');

      Marcacao_RetirarProtecao(viWptAuxiliar, true);
      RedefinirPadraoFonte(viWptAuxiliar);

      viWptQualificacao.InputString(' ');
      viWptQualificacao.SelectionAsString := viWptAuxiliar.AsString;
      viWptQualificacao.InputString('.');
    end;

  begin
    viAtoId := vgQualificar.StlCampos.Values['ATO_ID'];
    CarregarPartesAssinantes(0);
    viPosicao := 0;

    viWptAuxiliar     := TWPRichText.Create(nil);
    viWptQualificacao := TWPRichText.Create(nil);
    viWptQualificacao.Clear;


    repeat
      Inc(viPosicao);
      if viPosicao > 1 then
        CarregarPartesAssinantes(viPosicao);

      if vgQualificar.StlLista = nil then
        vgQualificar.StlLista := TStringList.Create;

      if dtmControles.SimpleAuxiliar.FieldByName('DADOS_ASSINATURA').AsString <> '' then
      begin
        viDadosSql := dtmControles.SimpleAuxiliar.FieldByName('DADOS_ASSINATURA').AsString;
        vgQualificar.StlLista.Values['VINCULO_PARTE_NOME']        := RetornarValorListaString(viDadosSql,',');
        vgQualificar.StlLista.Values['VINCULO_PARTE_COMPLEMENTO'] := MontarComplemento(2);
        BuscarMarcacao('VINCULO�PARTE�NOME�COMPLEMENTO');
        dtmControles.SimpleAuxiliar.Close;
        Qualificar;
      end
      else
      begin
        vgQualificar.StlLista.Values['VINCULO_PARTE_NOME']        := dtmControles.SimpleAuxiliar.FieldByName('PESSOA_NOME').AsString;
        vgQualificar.StlLista.Values['VINCULO_PARTE_COMPLEMENTO'] := MontarComplemento(1);
        BuscarMarcacao('VINCULO�PARTE�NOME�TIPO');
        dtmControles.SimpleAuxiliar.Close;
        Qualificar;
      end;
    until viPosicao = viQtd;

    vgQualificar.WptAuxiliar.Clear;
    vgQualificar.WptAuxiliar.AsString := viWptQualificacao.AsString;
    vgQualificar.WptAuxiliar.DeleteTrailingSpace(true);
    FreeAndNil(viWptAuxiliar);
    FreeAndNil(viWptQualificacao);
  end;
  {$ENDREGION}

  {$REGION 'Qualificar_EscreventeAssina'}
  procedure Qualificar_EscreventeAssina;
  var
    viEscrevente, viPessoaId : String;
    viWptAuxiliar : TWPRichText;
  begin
    viEscrevente := vgQualificar.StlCampos.Values['ESCREVENTE_ASSINA_ID'];
    if viEscrevente = '' then
      exit;

    viPessoaId := dtmControles.GetStr(' SELECT P.PESSOA_ID '+
                                      ' FROM G_USUARIO G '+
                                      '   LEFT OUTER JOIN T_PESSOA P ON '+
                                      '   P.CPF_CNPJ = G.CPF '+
                                      ' WHERE G.USUARIO_ID ='+viEscrevente+
                                      '   AND ((NOT G.CPF IS NULL) AND (NOT G.CPF = '+QuotedStr('')+'))');
    if viPessoaId = '' then
      exit;

    viWptAuxiliar := TWPRichText.Create(nil);
    viWptAuxiliar.Clear;

    ExecutaSqlAuxiliar(' SELECT TEXTO FROM G_MARCACAO_TIPO '+
                       ' WHERE NOME = '+QuotedStr('ESCREVENTE�PADRAO')+
                       '   AND SISTEMA_ID = '+ IntToStr(vgId),0);
    viWptAuxiliar.AsString := DeCompressString(dtmControles.sqlAuxiliar.FieldByName('TEXTO').AsString);

    // Pega os dAdos da Pessoa que est�o faltando
    ExecutaSqlAuxiliar(' SELECT NOME, SEXO, TB_DOCUMENTOTIPO_ID, TB_REGIMECOMUNHAO_ID, TB_PROFISSAO_ID, '+
                       '        TB_ESTADOCIVIL_ID, PESSOA_CONJUGE_ID, TELEFONE, EMAIL '+
                       ' FROM T_PESSOA '+
                       ' WHERE PESSOA_ID = '+ viPessoaId,0);

//    if vgQualificar.StlCampos = nil then
//      vgQualificar.StlCampos := TStringList.Create;
    vgQualificar.StlCampos.Add('PESSOA_ID='+viPessoaId);
    vgQualificar.StlCampos.Add('PESSOA_CONJUGE_ID='+dtmControles.sqlAuxiliar.FieldByName('PESSOA_CONJUGE_ID').AsString);
    vgQualificar.StlCampos.Add('TB_DOCUMENTOTIPO_ID='+ dtmControles.sqlAuxiliar.FieldByName('TB_DOCUMENTOTIPO_ID').AsString);
    vgQualificar.StlCampos.Add('TB_ESTADOCIVIL_ID='+dtmControles.sqlAuxiliar.FieldByName('TB_ESTADOCIVIL_ID').AsString);
    vgQualificar.StlCampos.Add('TB_PROFISSAO_ID='+dtmControles.sqlAuxiliar.FieldByName('TB_PROFISSAO_ID').AsString);
    vgQualificar.StlCampos.Add('TB_REGIMECOMUNHAO_ID='+dtmControles.sqlAuxiliar.FieldByName('TB_REGIMECOMUNHAO_ID').AsString);

    if vgQualificar.StlPrincipal <> nil then
      FreeAndNil(vgQualificar.StlPrincipal);
    vgQualificar.StlPrincipal := Qualificar_SelecionarMarcacao('a', viWptAuxiliar);

    vgQualificar.Sexo := dtmControles.sqlAuxiliar.FieldByName('SEXO').AsString;
    vgQualificar.VincQtdSexo[1,1] := '1';
    vgQualificar.VincQtdSexo[1,2] := vgQualificar.Sexo;
    Qualificar_GetGramatica(viWptAuxiliar, true);

    Qualificar_Iniciar(viWptAuxiliar, 'L');

    Marcacao_RetirarProtecao(viWptAuxiliar, true);
    RedefinirPadraoFonte(viWptAuxiliar);

    vgQualificar.WptAuxiliar.Clear;
    vgQualificar.WptAuxiliar.SelectionAsString := viWptAuxiliar.AsString;
    vgQualificar.WptAuxiliar.DeleteTrailingSpace(true);
    dtmControles.sqlAuxiliar.Close;
    FreeAndNil(viWptAuxiliar);
  end;
  {$ENDREGION}

begin
  viLista := TStringList.Create;
  viLista.Text := vpListaFixa.Text;

  viPreencherDataVazia := vgQualificar.PreencherDataVazia;
  vgQualificar.PreencherDataVazia := False;

  // Determina a ordem de qualifica��o do Auxiliar do Ato
  viOrdemQualificaAuxiliar :=  vgQualificar.AuxAtoOrdemQualifica;
  if (viOrdemQualificaAuxiliar = '') or (viOrdemQualificaAuxiliar = '0') then
    if vgQualificar.AuxAtoAposOutorgado then
         viOrdemQualificaAuxiliar := '2'
    else viOrdemQualificaAuxiliar := '1';
  // *************


  viAtoId    := vgQualificar.StlCampos.Values['ATO_ID'];
  viPedidoId := vgQualificar.StlCampos.Values['SERVICO_PEDIDO_ID'];
  for i := 0 to (viLista.Count-1) do
  begin
    {Seleciona a marca��o}
    Marcacao_DefinirTipo(viLista[i]);
    vpWptAux.BookmarkSelect(viLista[i], True);

    vgQualificar.Palavra := UpperCase(vgQualificar.Palavra);

    ExecutaSimpleDSAux(' SELECT TIPO_VALOR, TEXTO, CONDICAO_SQL, SEPARADOR_1, SEPARADOR_2, SEPARADOR_3, ATIVAR_SEPARADOR  '+
                       ' FROM G_MARCACAO_TIPO '+
                       ' WHERE NOME = '+ QuotedStr(TrocaCharPorAsci(vgQualificar.Palavra))+
                       '   AND SISTEMA_ID = '+ IntToStr(vgId),0);

    vgQualificar.WptTextoMarcacao.AsString := DeCompressString(dtmControles.SimpleAuxiliar.FieldByName('TEXTO').AsString);
    vgQualificar.CondicaoSql               := dtmControles.SimpleAuxiliar.FieldByName('CONDICAO_SQL').AsString;
    vgQualificar.VincSeparador[1]          := dtmControles.SimpleAuxiliar.FieldByName('SEPARADOR_1').AsString;
    vgQualificar.VincSeparador[2]          := dtmControles.SimpleAuxiliar.FieldByName('SEPARADOR_2').AsString;
    vgQualificar.VincSeparador[3]          := dtmControles.SimpleAuxiliar.FieldByName('SEPARADOR_3').AsString;
    vgQualificar.AtivarSeparador           := dtmControles.SimpleAuxiliar.FieldByName('ATIVAR_SEPARADOR').AsString = 'S';

    if vgQualificar.Palavra = 'PRIMEIRO?OUTORGADO?E?OUTROS' then
      vgQualificar.WptAuxiliar.AsString := Qualificar_MarcacaoInicial('2')
    else
      if vgQualificar.Palavra = 'PRIMEIRO?OUTORGANTE?E?OUTROS' then
        vgQualificar.WptAuxiliar.AsString := Qualificar_MarcacaoInicial('1')
    else
      if vgQualificar.Palavra = 'QUALIFICACAO?1�?OUTORGANTE' then
      begin
        vgQualificar.WptAuxiliar.AsString := Qualificar_MarcacaoInicial('1');
        Qualificar_Partes('1','', '', 1);
        if vgQualificar.OutorganteRecOutorgado then
          QualificarAuxiliarAto;
      end
    else
      if vgQualificar.Palavra = 'QUALIFICACAO?2�?OUTORGANTE' then
      begin
        vgQualificar.WptAuxiliar.AsString := Qualificar_MarcacaoInicial('1');
        Qualificar_Partes('1','', '',2);
        QualificarAuxiliarAto;
      end
    else
      if vgQualificar.Palavra = 'QUALIFICACAO?OUTORGANTE' then
      begin
        Qualificar_Partes('1','', vgQualificar.PessoaJuridicaId);
        if (vgQualificar.OutorganteRecOutorgado) or (viOrdemQualificaAuxiliar = '1') then
          if vgQualificar.StlCampos.Values['ATO_ID'] <> '' then
            QualificarAuxiliarAto;
      end
    else
      if (vgQualificar.Palavra = 'QUALIFICACAO?OUTORGADO') then
      begin
        Qualificar_Partes('2','');
        if viOrdemQualificaAuxiliar = '2' then
          QualificarAuxiliarAto;
      end
    else
      if vgQualificar.Palavra = 'QUALIFICACAO?AUXILIAR?ATO' then
        Qualificar_Partes('3','')
    else
      if vgQualificar.Palavra = 'QUALIFICACAO?IMOVEL' then
        Qualificar_Imovel
    else
      if vgQualificar.Palavra = 'QUALIFICACAO?IMOVEL?1�' then
        Qualificar_Imovel(1)
    else
      if vgQualificar.Palavra = 'QUALIFICACAO?IMOVEL?2�' then
        Qualificar_Imovel(2)
    else
      if vgQualificar.Palavra = 'QUALIFICAR?CNB?G' then
        QualificarCNB
    else
      if vgQualificar.Palavra = 'QUALIFICACAO?SELOS?CAUCAIA' then
      begin
        if viPedidoId <> '' then
             QualificarSelosCaucaiaAto('T_SERVICO_PEDIDO',viPedidoId, 'TABELA_ITEM','CAMPO_ITEM_ID')
        else QualificarSelosCaucaiaAto('T_ATO',viAtoId, 'TABELA', 'CAMPO_ID');
      end
    else
      if vgQualificar.Palavra = 'QUALIFICAR?PROPRIETARIO?IMOVEL' then
        QualificarProprietarioImovel
    else
      if
        (vgQualificar.Palavra = 'TEXTO?TRANSPORTADO?CERT') or
        (vgQualificar.Palavra = 'TEXTO?TRANSPORTADO?CERT?GERAL')
      then
      begin
        if vgQualificar.WptTextoLista = nil then
          exit;

        vgQualificar.WptTextoLista.SelectAll;
        vgQualificar.WptTextoLista.CurrAttr.Alignment := paralBlock;
        vgQualificar.WptAuxiliar.AsString := vgQualificar.WptTextoLista.AsString;
      end
    else
      if vgQualificar.Palavra = 'QUALIFICA?DOC?CIVIL?GRID?1' then
        Qualificar_DocumentoCivil_Modelo1_Grid
    else
      if vgQualificar.Palavra = 'QUALIFICA?DOC?NOTAS' then
        Qualificar_DocumentoNotas
    else
      if vgQualificar.Palavra = 'QUALIFICACAO?ESCREVENTE?ASSINA' then
        Qualificar_EscreventeAssina
    else
      if vgQualificar.Palavra = 'QUALIFICACAO?ASS?INDIVIDUAL?1' then
        Qualificar_AssinaturaIndividual;


    vgQualificar.Stylo := vpWptAux.CurrAttr.Style;
    Qualificar_SubstituirMarcacao(viLista[i], 'G', vpWptAux, viLista[i]);

  end;
  DestruirWptVirtual('vgWptAuxiliar');
  DestruirWptVirtual('vgWptTextoMarcacao');
  vgQualificar.PessoaJuridicaId := '';
  viLista.Free;

  vgQualificar.PreencherDataVazia := viPreencherDataVazia;
end;

Function Qualificar_MarcacaoInicial(vpTipoVinculo : String):String;
var
  viInfoConjuge, viInfoOutros : string;
  viSql, viNome : string;
  viIdConjuge   : Integer;
  viEsposoMarido, viEsposaMulher : String;
begin
  viEsposoMarido := 'seu esposo';
  viEsposaMulher := 'sua esposa';

  try
    viSql := ' SELECT VP.PESSOA_NOME, VP.ATO_VINCULOPARTE_ID, VP.PESSOA_CONJUGE_ID, P.SEXO '+
             ' FROM T_ATO_VINCULOPARTE VP '+
             '      LEFT OUTER JOIN T_PESSOA P ON '+
             '      VP.PESSOA_ID = P.PESSOA_ID '+
             ' WHERE (VP.TIPO_VINCULO = '+QuotedStr(vpTipoVinculo) +' OR VP.TIPO_VINCULO = '+ QuotedStr('0')+')'+
             '   AND ASSINATURA_TIPO <> '+ QuotedStr('4')+
             '   AND ATO_ID ='+ vgQualificar.StlCampos.Values['ATO_ID'];

    viSql := viSql + ' ORDER BY VP.ORDEM';
    ExecutaSimpleDSAux(viSql,0);

    with dtmControles do
    begin
      viNome :=  SimpleAuxiliar.FieldByName('PESSOA_NOME').AsString;
      case SimpleAuxiliar.RecordCount of
        0   : Result := vgQualificar.Palavra;
        1   : Result := viNome;
       else
       begin
         SimpleAuxiliar.Next;
         viIdConjuge := SimpleAuxiliar.FieldByName('PESSOA_CONJUGE_ID').AsInteger;
         SimpleAuxiliar.First;

         // Verifica se a pr�xima Pessoa � c�njuge. caso seja, verifica o sexo do mesmo.
         if SimpleAuxiliar.FieldByName('ATO_VINCULOPARTE_ID').AsCurrency = viIdConjuge then
         begin
           if dtmControles.BuscarConfig('ATO','QUALIFICACAO','MARCACAO_PRIMEIRO_OUTORGANTE','S') = '2' then
           begin
             viEsposaMulher := 'sua mulher';
             viEsposoMarido := 'seu marido';
           end;

           if SimpleAuxiliar.FieldByName('SEXO').AsString = 'M' then
                viInfoConjuge := viEsposaMulher
           else viInfoConjuge := viEsposoMarido;

           if SimpleAuxiliar.RecordCount >= 3 then
             if SimpleAuxiliar.RecordCount = 3 then
             begin
               if SimpleAuxiliar.FieldByName('SEXO').AsString = 'M' then
                    viInfoOutros := 'Outra'
               else viInfoOutros := 'Outro';
             end
             else viInfoOutros := 'Outros';

           if (viInfoOutros = '') then
                Result := viNome +' e '+viInfoConjuge
           else Result := viNome +', '+viInfoConjuge +' e '+ viInfoOutros;
         end
         else
         begin
           if SimpleAuxiliar.RecordCount = 2 then
           begin
             if SimpleAuxiliar.FieldByName('SEXO').AsString = 'M' then
                  viInfoOutros := 'Outra'
             else viInfoOutros := 'Outro';
           end
           else viInfoOutros := 'Outros';

           Result := viNome +' e '+viInfoOutros;
         end;
       end;
      end;
    end;

    Result := AplicarEstiloCaixaAltaBaixa(Result);
  except
    Result := 'Erro!!! '+ vgQualificar.Palavra;
  end;
end;

procedure Qualificar_Partes(vpTipoVinculo, vpTipoParte : String;  vpPessoaJuridica : string = ''; vpOrdem : integer = 0);
var
  viSql, viPalavra, viSexoParte, viPreDefinidoJuridico : string;
  viNivel, viAssinaturas : integer;
  viSimpleAuxiliarA, viSimpleAuxiliarB : TI9Query;
  viFlag, viConjuge, viSeparador, viPular : Boolean;
  viVetIdAuxiliar : array[1..10,1..9] of Integer;
  viWptArmazena, viWptTexto, viWptComplemento, viWptAuxiliar : TWPRichText;

  procedure PegarSeparadores;
  begin
    ExecutaSqlAuxiliar(' SELECT SEPARADOR_1, SEPARADOR_2, SEPARADOR_3 '+
                       ' FROM G_MARCACAO_TIPO '+
                       ' WHERE NOME = '+ QuotedStr(TrocaCharPorAsci(viPalavra))+
                       '   AND SISTEMA_ID = '+ IntToStr(vgId),0);
    vgQualificar.VincSeparador[1] := dtmControles.sqlAuxiliar.FieldByName('SEPARADOR_1').AsString;
    vgQualificar.VincSeparador[2] := dtmControles.sqlAuxiliar.FieldByName('SEPARADOR_2').AsString;
    vgQualificar.VincSeparador[3] := dtmControles.sqlAuxiliar.FieldByName('SEPARADOR_3').AsString;
    dtmControles.sqlAuxiliar.Close;
  end;

  procedure BuscarPessoaJuridica(vpSimpleDataSet : TI9Query);
  begin
    viSql := ' SELECT SEXO, PESSOA_ID, TB_DOCUMENTOTIPO_ID, '+
             '        TB_PROFISSAO_ID, PESSOA_CONJUGE_ID '+
             ' FROM T_PESSOA '+
             ' WHERE PESSOA_ID ='+ vpPessoaJuridica;
    with vpSimpleDataSet do
    begin
      Active := False;
      SQL.Text := viSql;
      Active := true;
    end;
  end;

  procedure BuscarParte(vpSimpleDataSet : TI9Query; vpAuxiliarId : Integer; vpAuxiliar : Boolean;
                   vpPessoaBuscarId : string = '');
  begin
    if vpPessoaJuridica = '' then
    begin
      viSql := ' SELECT VP.ATO_VINCULOPARTE_ID, VP.PESSOA_CONJUGE_ID AS CONJUGE, VP.TIPO_VINCULO, VP.ORDEM, '+
               '        VP.AUXILIAR_ID, VP.MARCACAO_TIPO_ID, VP.ATO_PARTETIPO_ID, VP.ASSINATURA_TIPO, VP.TEXTO_COMPLEMENTAR, '+
               '        P.SEXO, P.PESSOA_ID, P.TB_DOCUMENTOTIPO_ID, P.TB_ESTADOCIVIL_ID, P.PESSOA_TIPO, P.SEG_DOCUMENTOTIPO_ID, '+
               '        P.TB_PROFISSAO_ID, P.TB_REGIMECOMUNHAO_ID, P.PESSOA_CONJUGE_ID, P.TEXTO AS TEXTO_JURIDICO, P.CPF_CNPJ,'+
               '        PT.TEXTO '+
               ' FROM T_ATO_VINCULOPARTE VP '+
               '      LEFT OUTER JOIN T_PESSOA P ON '+
               '      VP.PESSOA_ID = P.PESSOA_ID '+
               '      LEFT OUTER JOIN T_ATO_PARTETIPO PT ON '+
               '      VP.ATO_PARTETIPO_ID = PT.ATO_PARTETIPO_ID '+
               ' WHERE VP.ATO_ID ='+ vgQualificar.StlCampos.Values['ATO_ID']+
               '   AND (PT.AUTO_QUALIFICA = '+QuotedStr('S') +')';

      if vpAuxiliar then
           viSql := viSql + ' AND AUXILIAR_ID = '+ IntToStr(vpAuxiliarId)+
                            ' ORDER BY VP.ATO_VINCULOPARTE_ID'
      else
        if vpTipoVinculo <> '3' then
             viSql := viSql + ' AND (VP.TIPO_VINCULO = '+QuotedStr(vpTipoVinculo) +' OR VP.TIPO_VINCULO = '+ QuotedStr('0')+')'+
                              ' ORDER BY VP.TIPO_VINCULO, VP.ORDEM'
        else
        begin
          viSql := viSql + ' AND VP.TIPO_VINCULO = '+QuotedStr(vpTipoVinculo);
          if vpTipoParte <> '' then
            viSql := viSql + ' AND VP.ATO_PARTETIPO_ID = '+QuotedStr(vpTipoParte);
          viSql := viSql + ' ORDER BY VP.TIPO_VINCULO, VP.ORDEM';
        end;
    end
    else
    begin
      viSql := ' SELECT PR.REPRESENTANTE_ID, PR.PESSOA_AUXILIAR_ID, PR.PESSOA_ID AS PESSOA_BUSCAR, '+
               '        PR.MARCACAO_TIPO_ID, PR.ATO_PARTETIPO_ID, PR.ASSINATURA_TIPO, '+
               '        P.SEXO, P.PESSOA_ID, P.TB_DOCUMENTOTIPO_ID, P.TB_ESTADOCIVIL_ID, '+
               '        P.TB_PROFISSAO_ID, P.TB_REGIMECOMUNHAO_ID, P.PESSOA_CONJUGE_ID, P.PESSOA_TIPO, '+
               '        PT.TEXTO, P.TEXTO AS TEXTO_JURIDICO '+
               ' FROM T_PESSOA_REPRESENTANTE PR '+
               '   LEFT OUTER JOIN T_PESSOA P ON '+
               '   PR.REPRESENTANTE_ID = P.PESSOA_ID '+
               '   LEFT OUTER JOIN T_ATO_PARTETIPO PT ON '+
               '   PR.ATO_PARTETIPO_ID = PT.ATO_PARTETIPO_ID '+
               ' WHERE PR.PESSOA_ID = '+ vpPessoaBuscarId +
               '   AND PT.AUTO_QUALIFICA = '+QuotedStr('S');

      if vpAuxiliar then
           viSql := viSql +  ' AND PR.PESSOA_AUXILIAR_ID = '+ IntToStr(vpAuxiliarId)
      else viSql := viSql +  ' AND PR.PESSOA_AUXILIAR_ID IS NULL'
    end;

    with vpSimpleDataSet do
    begin
      Active := False;
      SQL.Text := viSql;
      Active := true;
    end;
  end;

  procedure AplicarQualificacao(vpSimpleDataSet : TI9Query; vpAuxiliar : Boolean = False; vpAuxiliarJuridico : Boolean = False);
  var
    viMarcacao : integer;

    Function VerificarSexo(vpDataSetAux : TI9Query):String;
    begin
      vpDataSetAux.First;
      Result := 'F';
      while not vpDataSetAux.eof do
      begin
        if vpDataSetAux.FieldByName('SEXO').AsString = 'M' then
        begin
          Result := 'M';
          break;
        end;
        vpDataSetAux.next;
      end;
      vpDataSetAux.First;
    end;

    function VerificarPessoaExposta:String;
    var
      viData : String;
      viPessoaExposta : Boolean;
    begin
      viData := dtmControles.GetStr(' SELECT DATA_LAVRATURA FROM T_ATO WHERE ATO_ID = '+vgQualificar.StlCampos.Values['ATO_ID']);
      if viData = '' then
        viData := FormatDateTime('DD/MM/YYYY', dtmControles.DataHoraBanco(3));
      viPessoaExposta :=  TPessoaExpostaController.PessoaExposta(vpSimpleDataSet.FieldByName('CPF_CNPJ').AsString,StrToDate(viData));
      if viPessoaExposta then
           Result := 'S'
      else Result := 'N'; 
    end;

  begin
    {Pega a Qualifica��o da Parte}
    if ((vpAuxiliar) or (vpPessoaJuridica = '')) and not vpAuxiliarJuridico then
         viMarcacao := vpSimpleDataSet.FieldByName('MARCACAO_TIPO_ID').AsInteger
    else viMarcacao := dtmControles.BuscarConfig('CADASTRO_PESSOA', 'GERAL', 'QUALIFICACAO_PESSOA_JURIDICA', 'I');

    {Verifica se existe texto complementar da Parte Selecionada}
    if (vpPessoaJuridica = '') and (not vpAuxiliar) and (vpSimpleDataSet.RecNo = 1) then
    begin
      if vpSimpleDataSet.FieldByName('TEXTO').AsString <> '' then
      begin
        viWptAuxiliar.AsString := DeCompressString(vpSimpleDataSet.FieldByName('TEXTO').AsString);
        if trim(viWptAuxiliar.Text) <> '' then
        begin
          viWptAuxiliar.CPPosition := $0;
          viWptAuxiliar.InputString(' ');
          viWptAuxiliar.CPPosition := $FFFFF;
          viWptAuxiliar.InputString(' ');

          {Aplicar a Concord�ncia Verbal}
          vgQualificar.VincQtdSexo[1,1] := IntToStr(vpSimpleDataSet.RecordCount);
          vgQualificar.VincQtdSexo[1,2] := VerificarSexo(vpSimpleDataSet);
          Qualificar_GetGramatica(viWptAuxiliar, True);
        end
        else viWptAuxiliar.Clear;
      end;
    end
    else viWptAuxiliar.Clear;

    ExecutaSqlAuxiliar(' SELECT TEXTO FROM G_MARCACAO_TIPO '+
                       ' WHERE MARCACAO_TIPO_ID = '+IntToStr(viMarcacao),0);

    viWpttexto.Clear;
    viWpttexto.SelectionAsString := DeCompressString(dtmControles.sqlAuxiliar.FieldByName('TEXTO').AsString);
    {Retira a Prote��o}
    viWpttexto.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
    viWpttexto.CurrAttr.DeleteStyle([ afsProtected ]);

    vgQualificar.StlLista.Values['PESSOA_EXPOSTA']         := VerificarPessoaExposta;

    {Carregar a Lista com as Chaves Zeradas}
    vgQualificar.StlCampos.Values['PESSOA_ID']             := vpSimpleDataSet.FieldByName('PESSOA_ID').AsString;
    vgQualificar.StlCampos.Values['TB_DOCUMENTOTIPO_ID']   := vpSimpleDataSet.FieldByName('TB_DOCUMENTOTIPO_ID').AsString;

    if (vpPessoaJuridica = '') then
    begin
      if vpSimpleDataSet.FieldByName('SEG_DOCUMENTOTIPO_ID').AsString = '' then
           vgQualificar.StlCampos.Values['SEG_DOCUMENTOTIPO_ID']  := '0'
      else vgQualificar.StlCampos.Values['SEG_DOCUMENTOTIPO_ID']  := vpSimpleDataSet.FieldByName('SEG_DOCUMENTOTIPO_ID').AsString;
    end
    else
      vgQualificar.StlCampos.Values['SEG_DOCUMENTOTIPO_ID']  := '0';

    if (vpPessoaJuridica = '') or (vpAuxiliar) then
    begin
      vgQualificar.StlCampos.Values['TB_ESTADOCIVIL_ID']    := vpSimpleDataSet.FieldByName('TB_ESTADOCIVIL_ID').AsString;
      vgQualificar.StlCampos.Values['TB_PROFISSAO_ID']      := vpSimpleDataSet.FieldByName('TB_PROFISSAO_ID').AsString;
      vgQualificar.StlCampos.Values['TB_REGIMECOMUNHAO_ID'] := vpSimpleDataSet.FieldByName('TB_REGIMECOMUNHAO_ID').AsString;
      vgQualificar.StlCampos.Values['PESSOA_CONJUGE_ID']    := vpSimpleDataSet.FieldByName('PESSOA_CONJUGE_ID').AsString;
    end;
    dtmControles.sqlAuxiliar.Close;

    {Aplicar a Concord�ncia Verbal}
    vgQualificar.Sexo := vpSimpleDataSet.FieldByName('SEXO').AsString;
    vgQualificar.Qtd  := '1';

    if vgQualificar.Sexo = 'M' then
         Qualificar_Gramatica(viWpttexto, True, 'F', True)
    else Qualificar_Gramatica(viWpttexto, True, 'M', True);

    {Qualificas as marca��es autom�ticas}
    if vgQualificar.StlPrincipal <> nil then
      FreeAndNil(vgQualificar.StlPrincipal);
    vgQualificar.StlPrincipal := Qualificar_SelecionarMarcacao('a',viWpttexto);

    Qualificar_Iniciar(viWpttexto, 'L');

    // Junta o Complemento.
    if viWptAuxiliar.AsString <> '' then
    begin
      viWpttexto.CPPosition := $0;
      viWpttexto.SelectionAsString := viWptAuxiliar.AsString;
      viWpttexto.CPPosition := $FFFFF;
      viWptAuxiliar.Clear;
    end;
  end;

  procedure InicializarNivel(vpAuxiliarId, vpNivel : integer);
  begin
    inc(vpNivel);
    viNivel := vpNivel;
    viVetIdAuxiliar[viNivel,1] := vpAuxiliarId; {Chave do Auxiliar}
    viVetIdAuxiliar[viNivel,2] := 0; {Quantidade de registros do Auxiliar}
    viVetIdAuxiliar[viNivel,3] := 0; {Quantidade j� Qualificadas}
  end;

begin
  viPalavra             := vgQualificar.Palavra;
  viPreDefinidoJuridico := dtmControles.BuscarConfig('ATO','QUALIFICACAO','QUALIFICACAO_JURIDICO_PREDEFINIDO','S');

  // Criar controles de Armazenamento e Pesquisa
  viSimpleAuxiliarA            := TI9Query.Create(nil);
  viSimpleAuxiliarB            := TI9Query.Create(nil);
  viSimpleAuxiliarA.Connection := dtmControles.DB;
  viSimpleAuxiliarB.Connection := dtmControles.DB;
  viWptArmazena                := CarregarWptVirtual(viWptArmazena, vgQualificar.WptAuxiliar);
  viWpttexto                   := CarregarWptVirtual(viWptArmazena, vgQualificar.WptAuxiliar);
  viWptComplemento             := CarregarWptVirtual(viWptArmazena, vgQualificar.WptAuxiliar);
  viWptAuxiliar                := CarregarWptVirtual(viWptArmazena, vgQualificar.WptAuxiliar);
  viWptArmazena.Clear;
  viConjuge     := False;
  viAssinaturas := 0;
  viSexoParte   := 'F';

  // Busca as Partes principais
  if (vpPessoaJuridica = '') then
       BuscarParte(viSimpleAuxiliarA, 0, False)
  else BuscarPessoaJuridica(viSimpleAuxiliarA);
  viSimpleAuxiliarA.First;  

  // Carregar a Lista com as Chaves Zeradas
  vgQualificar.StlCampos.Add('PESSOA_ID=0');
  vgQualificar.StlCampos.Add('TB_DOCUMENTOTIPO_ID=0');
  vgQualificar.StlCampos.Add('TB_ESTADOCIVIL_ID=0');
  vgQualificar.StlCampos.Add('TB_PROFISSAO_ID=0');
  vgQualificar.StlCampos.Add('TB_REGIMECOMUNHAO_ID=0');

  While not viSimpleAuxiliarA.Eof do
  begin
    // Verifica se vai qualificar todas as pessoas desta parte ou somente a pessoa especifica e seus auxiliares
    if vpOrdem > 0 then
      if viSimpleAuxiliarA.FieldByName('ORDEM').AsInteger <> vpOrdem then
      begin
        viSimpleAuxiliarA.Next;
        Continue;
      end;

    viFlag     := False;
    viPular    := False;

   {Verifica se Possui conjuge, ou se � conjuge da Parte anterior}
    if (viConjuge) then
    begin
      viConjuge   := False;
      viSeparador := False;
    end
    else
    begin
      if vpPessoaJuridica = '' then
           viConjuge := viSimpleAuxiliarA.FieldByname('CONJUGE').AsInteger > 0
      else viConjuge := False;

      viSeparador := True;

      {Aplica Qualifica��o  -  Se for Marca��o de Pessoa Juridica Pr� definida, ent�o pega a Marca��o pronta da mesma}
      if (vpPessoaJuridica = '') and (viPreDefinidoJuridico = viSimpleAuxiliarA.FieldByName('MARCACAO_TIPO_ID').AsString) then
      begin
        viWptTexto.AsString := DeCompressString(viSimpleAuxiliarA.FieldByName('TEXTO_JURIDICO').AsString);
        viPular := True;
      end
      else AplicarQualificacao(viSimpleAuxiliarA);

      {Armazena no wptools Tempor�rio}
      if viSimpleAuxiliarA.RecNo > 1 then
        viWptArmazena.InputString(' ');
      viWpttexto.CPPosition := $FFFFF;
      viWptArmazena.SelectionAsString := viWpttexto.AsString;
    end;

    // Verifica se a Parte Assina
    if vpPessoaJuridica = '' then
    begin
      if viSimpleAuxiliarA.FieldByName('ASSINATURA_TIPO').AsString = '3' then
        inc(viAssinaturas);
    end;

    // Verifica se o Sexo � Masculino
    if (viAssinaturas = 1) or ((viAssinaturas > 1) and (viSexoParte = 'F')) then
      if viSimpleAuxiliarA.FieldByName('SEXO').AsString = 'M' then
           viSexoParte := 'M'
      else viSexoParte := 'F';

    if vpPessoaJuridica = '' then
         InicializarNivel(viSimpleAuxiliarA.FieldByname('ATO_VINCULOPARTE_ID').AsInteger,0)
    else InicializarNivel(viSimpleAuxiliarA.FieldByname('PESSOA_ID').AsInteger,0);
    vgQualificar.IgnorarMascara := True;

    repeat {Verifica se Possui Auxiliar}
      if vpPessoaJuridica = '' then
        BuscarParte(viSimpleAuxiliarB, viVetIdAuxiliar[viNivel,1], true)
      else
      begin
        if viNivel = 1 then
          BuscarParte(viSimpleAuxiliarB, viVetIdAuxiliar[viNivel,1], False, vpPessoaJuridica)
        else
          if viNivel = 2  then
               BuscarParte(viSimpleAuxiliarB, viVetIdAuxiliar[viNivel-1,4], true, vpPessoaJuridica)
          else BuscarParte(viSimpleAuxiliarB, viVetIdAuxiliar[viNivel-1,4], true,  viSimpleAuxiliarB.FieldByname('PESSOA_BUSCAR').AsString);
      end;

      if (viSimpleAuxiliarB.RecordCount > 0) and viPular then
      begin
        // Adiciona o Texto Complementar
        if vpPessoaJuridica = '' then
        begin
          if viSimpleAuxiliarB.FieldByName('TEXTO_COMPLEMENTAR').AsString <> '' then
          begin
            viWpttexto.CPPosition := $FFFFF;
            viWpttexto.InputString(', ');
            viWpttexto.SelectionAsString := DeCompressString(viSimpleAuxiliarB.FieldByName('TEXTO_COMPLEMENTAR').AsString);
            viWptArmazena.InputString(', ');
            viWptArmazena.SelectionAsString := DeCompressString(viSimpleAuxiliarB.FieldByName('TEXTO_COMPLEMENTAR').AsString);
          end;
        end;
        viFlag := True;
      end
      else
      begin
        if (viSimpleAuxiliarB.RecordCount > 0) and (not viPular) then
        begin

          vgQualificar.QualificarGramatica := True;
          viVetIdAuxiliar[viNivel,2] := viSimpleAuxiliarB.RecordCount;
          viSimpleAuxiliarB.RecNo := viVetIdAuxiliar[viNivel,3] + 1;

          {Aplica a Qualifica��o}
          if viSimpleAuxiliarB.FieldByname('PESSOA_TIPO').AsString <> 'J' then
               AplicarQualificacao(viSimpleAuxiliarB, True)
          else AplicarQualificacao(viSimpleAuxiliarB, True, True);

          // Adiciona o Texto Complementar
          if vpPessoaJuridica = '' then
          begin
            if viSimpleAuxiliarB.FieldByName('TEXTO_COMPLEMENTAR').AsString <> '' then
            begin
              viWpttexto.CPPosition := $FFFFF;
              viWpttexto.InputString(', ');
              viWpttexto.SelectionAsString := DeCompressString(viSimpleAuxiliarB.FieldByName('TEXTO_COMPLEMENTAR').AsString);
            end;
          end;

          viVetIdAuxiliar[viNivel,3] := viSimpleAuxiliarB.RecNo;

          {Adiciona o separador}
          viWptArmazena.LastPar;
          if viSeparador then
          begin
            PegarSeparadores;
            viWptArmazena.DeleteTrailingSpace(true);
            if vpPessoaJuridica <> '' then
               viWptArmazena.InputString(Qualificar_DefinirSeparador(2))
            else
            begin
              if (viNivel = 1) then
                   viWptArmazena.InputString(Qualificar_DefinirSeparador(viVetIdAuxiliar[viNivel,2] - (viVetIdAuxiliar[viNivel,3])+1))
              else viWptArmazena.InputString(Qualificar_DefinirSeparador(viVetIdAuxiliar[viNivel,2] - (viVetIdAuxiliar[viNivel,3])));
            end;
            viWptArmazena.InputString(' ');
          end;

          // Insere o complemento Inicial. � inserido uma �nica vez;
          if (viNivel = 1) and (viVetIdAuxiliar[1,3] = 1) then
          begin
            viWptArmazena.DeleteTrailingSpace(False);
            viWptArmazena.InputString(' ');
            viWptArmazena.InputString(dtmControles.BuscarConfig('ATO', 'QUALIFICACAO', 'COMPLEMENTO_AUXILIAR', 'S'));
            viWptArmazena.InputString(' ');
          end;

          {Se for o 1� registro de cada n�vel, ent�o adiciona o texto complementar armazenado no tipo da parte;}
          if viVetIdAuxiliar[viNivel,3] = 1 then
          begin
            viWptComplemento.AsString := DeCompressString(viSimpleAuxiliarb.FieldByName('TEXTO').AsString);

            if viNivel = 1 then
            begin
              {Quantidade referente as partes}
              if viAssinaturas = 0 then
                viAssinaturas := 1;
              vgQualificar.VincQtdSexo[1,1] := IntToStr(viAssinaturas);
              vgQualificar.VincQtdSexo[1,2] := viSexoParte;

              // Se for 1 Assinatura e o conjuge estiver ativado, os auxiliares s�o somente para a 1 Parte
              if vpPessoaJuridica = '' then
                if ((viAssinaturas = 1) and (viConjuge or (viSimpleAuxiliarA.FieldByname('CONJUGE').AsInteger > 0))) then
                  if viSexoParte = 'M' then
                       viWptComplemento.InputString('sendo ele ')
                  else viWptComplemento.InputString('sendo ela ');
            end
            else
            begin
              {Quantidade referente as ao(s) auxiliares do nivel  acima}
              if vpPessoaJuridica = '' then
              begin
                vgQualificar.VincQtdSexo[1,1] := Qualificar_QtdRegistroTab(vpTipoVinculo[4], IntToStr(viVetIdAuxiliar[viNivel-1,1]));
                vgQualificar.VincQtdSexo[1,2] := Qualificar_VerificarSexoTab(vpTipoVinculo[4], IntToStr(viVetIdAuxiliar[viNivel-1,1]));
              end
              else
              begin
                vgQualificar.VincQtdSexo[1,1] := '1';
                vgQualificar.VincQtdSexo[1,2] := 'M';
              end;
            end;

            {Quantidade referente ao(s) auxiliares do nivel atual}
            vgQualificar.VincQtdSexo[2,1] := IntToStr(viSimpleAuxiliarB.RecordCount);
            if viSimpleAuxiliarB.RecordCount = 1 then
                 vgQualificar.VincQtdSexo[2,2] := Qualificar_VerificarSexoTab('4', IntToStr(viVetIdAuxiliar[viNivel,1]), vpPessoaJuridica <> '')
            else vgQualificar.VincQtdSexo[2,2] := 'M';

            {Aplicar a concord�ncia}
            Qualificar_GetGramatica(viWptComplemento);
            viWptComplemento.DeleteLeadingSpace(True);

            viWptArmazena.DeleteTrailingSpace(False);
            viWptArmazena.InputString(' ');
            viWptArmazena.SelectionAsString := viWptComplemento.AsString;

            viWptArmazena.DeleteTrailingSpace(False);
            viWptArmazena.InputString(' ');
          end;

          {Armazena o texto Qualificado}
          viWpttexto.CPPosition := $FFFFF;
          viWptArmazena.SelectionAsString := viWpttexto.AsString;

          if vpPessoaJuridica = '' then
          begin
             viVetIdAuxiliar[viNivel,4] := viSimpleAuxiliarB.FieldByname('ATO_VINCULOPARTE_ID').AsInteger;
             BuscarParte(viSimpleAuxiliarB,  viVetIdAuxiliar[viNivel,4], true)
          end
          else
          begin
            viVetIdAuxiliar[viNivel,4] := viSimpleAuxiliarB.FieldByname('REPRESENTANTE_ID').AsInteger;
            if viNivel < 2 then
                 BuscarParte(viSimpleAuxiliarB,  viVetIdAuxiliar[viNivel,4], true, vpPessoaJuridica)
            else BuscarParte(viSimpleAuxiliarB, viVetIdAuxiliar[viNivel,4], true,  viSimpleAuxiliarB.FieldByname('PESSOA_AUXILIAR_ID').AsString);
          end;

          if viSimpleAuxiliarB.RecordCount > 0 then
            InicializarNivel(viVetIdAuxiliar[viNivel,4], viNivel)
          else
          begin
            {Volta para o n�vel anterior, ate que o nivel seja zerado}
            repeat
              if ((viNivel > 1) and (viVetIdAuxiliar[viNivel,2] = viVetIdAuxiliar[viNivel,3]) or (viVetIdAuxiliar[1,2] = viVetIdAuxiliar[1,3])) then
                Dec(viNivel);
            until (viNivel = 0) or (viVetIdAuxiliar[viNivel,2] <> viVetIdAuxiliar[viNivel,3]);
          end;

          viAssinaturas := 0;
          viSexoParte   := 'F';
        end
        else viFlag := True;
      end;
    until (viFlag) or (viNivel = 0);
    vgQualificar.IgnorarMascara := False;

    if viSeparador then
    begin
      PegarSeparadores;
      viWptArmazena.DeleteTrailingSpace(true);
      if vpPessoaJuridica <> '' then
        viWptArmazena.InputString(Qualificar_DefinirSeparador(0))
      else
      begin
        if viConjuge then
             viWptArmazena.InputString(Qualificar_DefinirSeparador(viSimpleAuxiliarA.RecordCount - (viSimpleAuxiliarA.RecNo+1)))
        else viWptArmazena.InputString(Qualificar_DefinirSeparador(viSimpleAuxiliarA.RecordCount - viSimpleAuxiliarA.RecNo));
      end;
    end;
    viSimpleAuxiliarA.next;
  end;

  vgQualificar.WptAuxiliar.Clear;
  vgQualificar.WptAuxiliar.SelectionAsString := viWptArmazena.AsString;

  FreeAndNil(viSimpleAuxiliarA);
  FreeAndNil(viSimpleAuxiliarB);
  FreeAndNil(viWptArmazena);
  FreeAndNil(viWptComplemento);
  FreeAndNil(viWptTexto);
end;

procedure RetirarPontuacaoNaoUtilizada(var vpWptAux : TWPRichText);
var
  viFlag : Boolean;

  procedure ProcuraSubstitui(vpTextoProcurar, vpTextoSubstituir : String; vpExcluir : Boolean);
  begin
    viFlag := False;
    repeat
      vpWptAux.Finder.ToStart;
      vpWptAux.Finder.FoundPosition := 0;
      if vpWptAux.Finder.Next(vpTextoProcurar) then
      begin
        if vpExcluir then
        begin
          vpWptAux.Finder.SelectText;
          vpWptAux.ClearSelection(True);
        end
        else
        begin
          vpWptAux.Finder.SelectText;
          vpWptAux.ClearSelection(True);
          vpWptAux.SelectionAsString := vpTextoSubstituir;
        end;
      end
      else viFlag := True;
    until viFlag;
  end;
begin
  vpWptAux.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  ProcuraSubstitui('na ,', 'em', False);
  ProcuraSubstitui(' ,', '', True);
  ProcuraSubstitui(',,', ',', False);
  ProcuraSubstitui('-;', ';', False);
  vpWptAux.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
end;

procedure Qualificar_SubstituirMarcacao(vpMarcacao: string; vpTipo : char; vpWptAux : TWPRichText; vpMarcacaoSelecionar : string);
var
  viFonte : String;
begin
  {vpTipo = L = 'Marca��o Local da Unit - Substitui Marca��es vazias e deleta os Bookmark'}
  {vpTipo = G = 'Marca��o Geral - N�o substitui marca��es vazias e deleta os BookMark'}
  {vpTipo = P = 'Marca��o p/ o procedure PrepararQualificarPadrao - Substitui marca��es vazias e n�o deleta os BookMark'}
  {vpTipo = N = 'Marca��o p/ o Procedure PrepararQualificarPadrao - N�o substitui marca��es vazias e n�o deleta os BookMark'}

  // Seta o cursor do mouse na posi��o correta
  vpWptAux.CPPosition := vpWptAux.SelStart;

  // Substitui a marca��o no editor Principal
  if (not vgQualificar.WptAuxiliar.IsEmpty) or CharInSet(vpTipo,['L', 'P', 'N']) then
  begin
    Marcacao_DefinirTipo(vpMarcacao);

    // Retira a prote��o e os BookMarks
    vgQualificar.WptAuxiliar.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
    vgQualificar.WptAuxiliar.SelectAll;
    vgQualificar.WptAuxiliar.CurrAttr.DeleteStyle([ afsProtected ]);

    if CharInSet(vpTipo,['L', 'G']) then
    begin
      try
        vgQualificar.WptAuxiliar.BookmarkDeleteAllMarkers;
      except
//        Clipboard.Clear;
        vgQualificar.WptAuxiliar.BookmarkDeleteAllMarkers;
      end;
    end;


    vgQualificar.WptAuxiliar.SelectAll;
    // Verifica se esta existe a marca��o de For�ar Caixa Alta (Mai�scula)
    if (vgQualificar.CaixaAlta = '�') and not vgQualificar.IgnorarMascara then
       vgQualificar.WptAuxiliar.AsString := AnsiUpperCase(vgQualificar.WptAuxiliar.Text)
    else
      if (vgQualificar.CaixaAltaBaixa = '�') and not vgQualificar.IgnorarMascara then
         vgQualificar.WptAuxiliar.AsString := MaiusculoMinusculo(vgQualificar.WptAuxiliar.Text)
    else
      if (vgQualificar.CaixaBaixa = '�') and not vgQualificar.IgnorarMascara then
         vgQualificar.WptAuxiliar.AsString := AnsiLowerCase(vgQualificar.WptAuxiliar.Text);

    vgQualificar.WptAuxiliar.DeleteLeadingSpace(False);

    vpWptAux.BookmarkSelect(vpMarcacaoSelecionar, True);
    vpWptAux.CurrAttr.Style := [];
    vgQualificar.WptAuxiliar.SelectAll;
    vgQualificar.WptAuxiliar.CurrAttr.Size := vpWptAux.CurrAttr.Size;
    if (vpTipo = 'N') then
    begin
      if vgQualificar.WptAuxiliar.Text <> '' then
        vpWptAux.SelectionAsString := vgQualificar.WptAuxiliar.AsString
    end
    else vpWptAux.SelectionAsString := vgQualificar.WptAuxiliar.AsString;

    {Aplicar Stylo Original}
    viFonte := vpWptAux.CurrAttr.FontName;
    if (vgQualificar.Stylo <> []) and (vgQualificar.Stylo <> [afsProtected]) then
    begin
      vpWptAux.BookmarkMoveTo(vpMarcacaoSelecionar, TRUE);
      vpWptAux.BookmarkSelect(vpWptAux.CPObj.Name, False);
      vpWptAux.CurrAttr.Style := vgQualificar.Stylo;
      vpWptAux.CurrAttr.DeleteStyle([ afsProtected ]);
      if vgQualificar.ManterFonteMinuta then
        vpWptAux.CurrAttr.FontName := viFonte;
      vpWptAux.HideSelection;
    end
    else
    begin
      if vpTipo = 'L' then
      begin
        vpWptAux.BookmarkMoveTo(vpMarcacaoSelecionar, TRUE);
        vpWptAux.BookmarkSelect(vpWptAux.CPObj.Name, False);
        vpWptAux.CurrAttr.Style := vgQualificar.VincStylo[vgQualificar.viStyliId];
        if vgQualificar.ManterFonteMinuta then
          vpWptAux.CurrAttr.FontName := viFonte;
      end
      else if CharInSet(vpTipo,['N', 'P']) then
      begin
        vpWptAux.BookmarkMoveTo(vpMarcacaoSelecionar, TRUE);
        vpWptAux.BookmarkSelect(vpWptAux.CPObj.Name, False);
        if vgQualificar.ManterFonteMinuta then
          vpWptAux.CurrAttr.FontName := viFonte;
      end;
    end;
  end;
  vgQualificar.WptAuxiliar.Clear;
end;

Function Qualificar_DefinirSeparador(vpQtdRestante : integer):string;
begin
  case vpQtdRestante of
     0 : Result := vgQualificar.VincSeparador[3];
     1 : Result := vgQualificar.VincSeparador[2];
    else Result := vgQualificar.VincSeparador[1];
  end;
end;

procedure Qualificar_Imovel(vpOrdem : integer = 0);
var
  i : integer;
begin
  if vgQualificar.StlLista.Values['IMOVEL_GERAL'] = dtmControles.BuscarConfig('ATO','QUALIFICACAO','QUALIFICACAO_IMOVEL_GERAL','S') then
  begin
    {Busca texto do Im�vel Geral, gravado na tabela de Ato}
    ExecutaSqlAuxiliar(' SELECT TEXTO_IMOVEL_GERAL '+
                       ' FROM T_ATO '+
                       ' WHERE ATO_ID = '+ vgQualificar.StlCampos.Values['ATO_ID'],0);

    vgQualificar.WptAuxiliar.AsString := DeCompressString(dtmControles.sqlAuxiliar.FieldByName('TEXTO_IMOVEL_GERAL').AsString);
    vgQualificar.WptAuxiliar.CPPosition := $FFFFF;
    vgQualificar.WptAuxiliar.InputString('; ');
    dtmControles.sqlAuxiliar.Close;
  end
  else
  begin
    // Buscar Im�veis
    ExecutaSimpleDSAux(' SELECT U.TEXTO '+
                       '  FROM T_ATO_VINCULOIMOVEL V '+
                       '  LEFT OUTER JOIN T_IMOVEL_UNIDADE U '+
                       '    ON V.IMOVEL_UNIDADE_ID = U.IMOVEL_UNIDADE_ID '+
                       '  WHERE V.ATO_ID = '+ vgQualificar.StlCampos.Values['ATO_ID']+
                       '  ORDER BY V.ATO_VINCULOIMOVEL_ID',0);
    vgQualificar.WptAuxiliar.Clear;

    for i := 1 to dtmControles.SimpleAuxiliar.RecordCount do
    begin
      // verifica se vai qualificar todos os im�veis ou somente o im�vel espec�fico
      if vpOrdem > 0 then
        if vpOrdem <> i then
        begin
          dtmControles.SimpleAuxiliar.Next;
          Continue;
        end;

      vgQualificar.WptAuxiliar.SelectionAsString := DeCompressString(dtmControles.SimpleAuxiliar.FieldByName('TEXTO').AsString);
      vgQualificar.WptAuxiliar.CPPosition := $FFFFF;
      dtmControles.SimpleAuxiliar.Next;

      if ((i+1) = dtmControles.SimpleAuxiliar.RecordCount) and (vpOrdem = 0) then
           vgQualificar.WptAuxiliar.InputString(vgQualificar.VincSeparador[2]+ ' ')
      else
        if i = dtmControles.SimpleAuxiliar.RecordCount then
             vgQualificar.WptAuxiliar.InputString(vgQualificar.VincSeparador[3])
        else vgQualificar.WptAuxiliar.InputString(vgQualificar.VincSeparador[1]+ ' ');
    end;
    vgQualificar.WptAuxiliar.DeleteTrailingSpace(true);
  end;
end;


function BuscarTextoMarcacaoAux(vpTexto : TWPRichText; vpMarcacaoNova : string):TWPRichText;
var
  vitexto : TWPRichText;
begin
  Result := TWPRichText.Create(nil);
  Result.Visible := false;

  vitexto := TWPRichText.Create(nil);
  vitexto.Visible := false;

  try
  {  if vpMarcacaoNova <> '' then
    begin
      Result.BookmarkInput(vpMarcacaoNova, True);
      Result.BookmarkMoveTo(vpMarcacaoNova);
      Result.CPMoveNext;
    end;}

    Result.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
    vitexto.SelectionAsString := vpTexto.AsString;

    vitexto.SelectAll;
    vitexto.CurrAttr.DeleteStyle([ afsProtected ]);
    vitexto.HideSelection;

    if vitexto.BookmarkMoveTo('<texto_final_certidao>') then
    begin
      vitexto.CPMoveNext;
      vitexto.InputString(#8);
      vitexto.SelectWord;
      vitexto.ClearSelection(true);
    end;

  //  Marcacao_RetirarProtecao(Result, true);
    vitexto.CPPosition := $FFFFF;
    vitexto.InputString(' ');
    vitexto.SelectAll;
    vitexto.BookmarkInput(vpMarcacaoNova, False);
  //  Marcacao_RetirarProtecao(Result, True);
    vitexto.HideSelection;

    Result.AsString := vitexto.AsString;
  finally
    FreeAndNil(vitexto);
  end;

end;

function BuscarTextoMarcacao(vpMarcacaoId, vpMarcacaoNova : string):TWPRichText;
begin
  Result := TWPRichText.Create(nil);
  Result.Visible := false;

  if vpMarcacaoNova <> '' then
  begin
    Result.BookmarkInput(vpMarcacaoNova, True);
    Result.BookmarkMoveTo(vpMarcacaoNova,TRUE);
    Result.CPMoveNext;
  end;

  ExecutaSqlAuxiliar(' SELECT TEXTO '+
                     ' FROM G_MARCACAO_TIPO '+
                     ' WHERE MARCACAO_TIPO_ID = '+ vpMarcacaoId,0);
  Result.SelectionAsString := DeCompressString(dtmControles.sqlAuxiliar.FieldByName('TEXTO').AsString);
  Result.HideSelection;
  dtmControles.sqlAuxiliar.Close;
end;

procedure PrepararQualificarPadrao(var vpWptAuxiliar : TWPRichText; vpMarcacaoNova : string;
                                         vpApagarMarcarcao, vpProtecao, vpSubstituirVazio: Boolean; vpUsarTabelaAuxiliar : Boolean = False;
                                         vpQualificarGramatica : Boolean = True; vpManterFonteMinuta : Boolean = False);
begin
  vgQualificar.UsarTabelaAuxiliar  := vpUsarTabelaAuxiliar;
  vgQualificar.QualificarGramatica := vpQualificarGramatica;
  vgQualificar.ManterFonteMinuta   := vpManterFonteMinuta;

  if vgQualificar.StlPrincipal <> nil then
    FreeAndNil(vgQualificar.StlPrincipal);
  vgQualificar.StlPrincipal := Qualificar_SelecionarMarcacao('a', vpWptAuxiliar);

  try
    if vpSubstituirVazio then
         Qualificar_Iniciar(vpWptAuxiliar,'P')
    else Qualificar_Iniciar(vpWptAuxiliar,'N');

    vpWptAuxiliar.SelectAll;
    if vpApagarMarcarcao then
    begin
      try
        vpWptAuxiliar.BookmarkDeleteAllMarkers;
      except
        vpWptAuxiliar.BookmarkDeleteAllMarkers;
      end;
    end;

    if vpMarcacaoNova <> '' then
      vpWptAuxiliar.BookmarkInput(vpMarcacaoNova);

    if vpProtecao then
         vpWptAuxiliar.CurrAttr.AddStyle([ afsProtected ])
    else vpWptAuxiliar.CurrAttr.DeleteStyle([ afsProtected ]);
    vpWptAuxiliar.HideSelection;
  finally
    FreeAndNil(vgQualificar.StlPrincipal);
    DestruirWptVirtual('vgWptAuxiliar');
    DestruirWptVirtual('vgWptTextoMarcacao');
  end;
end;

procedure Marcacao_RetirarProtecao(vpWptAux : TWPRichText; vpTudo : Boolean = False;
      vpTravar : Boolean = True);
begin
  vpWptAux.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  if vpTudo then
    vpWptAux.SelectAll;
  vpWptAux.CurrAttr.DeleteStyle([ afsProtected ]);

  if vpTravar then
    vpWptAux.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
end;

procedure Marcacao_AjustarMarcacao(var vpWptAux : TWPRichText);
var
  i : Integer;
begin
  if vgQualificar.StlPrincipal <> nil then
     FreeAndNil(vgQualificar.StlPrincipal);

  vgQualificar.StlPrincipal := TStringList.Create;
  vpWptAux.BookmarkGetList(vgQualificar.StlPrincipal);

  vpWptAux.ProtectedProp := [ppParProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  for i := 0 to vgQualificar.StlPrincipal.Count-1 do
  begin
    vpWptAux.BookmarkMoveTo(vgQualificar.StlPrincipal[i], True);
    vpWptAux.CPMoveNext;
    if vpWptAux.CPWord = '' then
      vpWptAux.DeleteChar(1);
  end;
  vpWptAux.ProtectedProp := [ppParProtected,ppProtected,ppAllowEditAtTextEnd,ppProtectSelectedTextToo];
  Screen.Cursor := crDefault;
  FreeAndNil(vgQualificar.StlPrincipal);
end;

procedure DestruirComponentes;
begin
  if vgQualificar.WptTextoMarcacao <> nil then
     FreeAndNil(vgQualificar.WptTextoMarcacao);

  if vgQualificar.WptAuxiliar <> nil then
     FreeAndNil(vgQualificar.WptAuxiliar);

  if vgQualificar.WptTeste <> nil then
     FreeAndNil(vgQualificar.WptTeste);

  if vgQualificar.WptPrincipal <> nil then
     FreeAndNil(vgQualificar.WptPrincipal);

  if vgQualificar.StlPrincipal <> nil then
     FreeAndNil(vgQualificar.StlPrincipal);

  if vgQualificar.StlComplemento <> nil then
     FreeAndNil(vgQualificar.StlComplemento);

  if vgQualificar.stlAuxiliar <> nil then
     FreeAndNil(vgQualificar.stlAuxiliar);

  if vgQualificar.StlCampos <> nil then
     FreeAndNil(vgQualificar.StlCampos);

  if vgQualificar.StlLista <> nil then
     FreeAndNil(vgQualificar.StlLista);

  if vgQualificar.StlErros <> nil then
     FreeAndNil(vgQualificar.StlErros);

  if vgQualificar.StlBookMark <> nil then
     FreeAndNil(vgQualificar.StlBookMark);

  if vgQualificar.stlMarcacaoFixaA <> nil then
     FreeAndNil(vgQualificar.stlMarcacaoFixaA);

  if vgWptEditorMarcacao <> nil then
     FreeAndNil(vgWptEditorMarcacao);

  if vgQualificar.stlListaSequencial <> nil then
     FreeAndNil(vgQualificar.stlListaSequencial);
end;

procedure Marcacao_RetirarDicionarioGramatical(vpWptAux : TWPRichText);
var
  viOk : boolean;
  viTempList : TWPTextObjList;
  viObj      : TWPTextObj;

  procedure IniciarBusca;
  begin
    vpWptAux.HideSelection;
    viOk := False;

    // Avan�a para a pr�xima marca��o
    if vpWptAux.CPPosition > 0 then
      vpWptAux.CPMoveNext;

    repeat
      viTempList.Clear;
      vpWptAux.OpenCodesAtCP(viTempList,wpobjHyperlink);
      vpWptAux.CPMoveNext;
    until viTempList.Count = 0;
  end;

begin
  vpWptAux.CPPosition := $0;
  viTempList := TWPTextObjList.Create;

  IniciarBusca;

  repeat
    repeat
      viTempList.Clear;
      vpWptAux.OpenCodesAtCP(viTempList,wpobjHyperlink);

      viObj := vpWptAux.HyperlinkAtCP;
      // Procura a Marca��o e seta o objeto da mesma
      While ((viTempList.Count > 0) and (Pos('�', viObj.Name) = 0)) do
      begin
        viObj := vpWptAux.HyperlinkAtCP;
        viOk  := true;
        Break;
      end;

      if (viOk) and ((copy(viObj.Source,pos('�',viObj.Source)+2,1)) <> '') then
           vpWptAux.DeleteHyperlink(False)
      else vpWptAux.CPMoveNext;
    until (viOk or (not(vpWptAux.CPMoveNext)));
    IniciarBusca;
  until not(vpWptAux.CPMoveNext);

  FreeAndNil(viTempList);
  FreeAndNil(viObj);  
end;

Function  Marcacao_Mostrardescricao(vpWptAux : TWPRichText):String;
var
  TempList : TWPTextObjList;
  i        : Integer;
  viMarcaocaInterna, viProtecao : string;
begin
  viMarcaocaInterna := '';
  vgTipoMarcacao := '';
  TempList := TWPTextObjList.Create;
  try
    // Pega o tipo de marca��o de Bookmark
    vpWptAux.OpenCodesAtCP(TempList,wpobjBookmark); // was: wpcoBookMark

    for i:=TempList.Count-1 downto 0 do
    begin
      if viMarcaocaInterna <> '' then
        viMarcaocaInterna := viMarcaocaInterna + ' - ';
      viMarcaocaInterna   := TempList[i].Name;
      vgTipoMarcacao      := 'B';
      break;
    end;

    // Verifica se � vari�vel protegida
    if viMarcaocaInterna <> '' then
    begin
      viProtecao := '';
      viProtecao := dtmControles.GetStr(' SELECT PROTEGIDA FROM G_MARCACAO_TIPO '+
                                        ' WHERE SISTEMA_ID = '+IntToStr(vgId)+
                                        '   AND NOME = '+ QuotedStr(copy(viMarcaocaInterna,1, length(viMarcaocaInterna)-3)));
      if viProtecao = 'S' then
        viMarcaocaInterna := 'Vari�vel Protegida';
    end;
  finally
    FreeAndNil(TempList);
  end;
  
  Result := viMarcaocaInterna;
end;

Function  TravarVariavelProtegida(var vpWptAux : TWPRichText):String;
var
  i : Integer;
  viProtecao : String;
begin
  if vgQualificar.StlPrincipal <> nil then
    FreeAndNil(vgQualificar.StlPrincipal);
  vgQualificar.StlPrincipal := Qualificar_SelecionarMarcacao('a',vpWptAux);

  for i := 0 to vgQualificar.StlPrincipal.Count - 1 do
  begin
    viProtecao := dtmControles.GetStr(' SELECT PROTEGIDA FROM G_MARCACAO_TIPO '+
                                      ' WHERE SISTEMA_ID = '+IntToStr(vgId)+
                                      '   AND NOME = '+ QuotedStr(copy(vgQualificar.StlPrincipal[i],1, length(vgQualificar.StlPrincipal[i])-3)));
    if viProtecao = 'S' then
    begin
      vpWptAux.BookmarkSelect(vgQualificar.StlPrincipal[i], true);
      vpWptAux.CurrAttr.AddStyle([ afsProtected ]);
      vpWptAux.HideSelection;
    end;
  end;
end;

end.


